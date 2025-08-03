package impl

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"go-backend-api/internal/database"
	"go-backend-api/internal/model"
	"go-backend-api/internal/repo"
	"go-backend-api/internal/utils"
	"go-backend-api/internal/utils/cache"
	"go-backend-api/pkg/response"
	"log"

	"github.com/google/uuid"
)

type sMenu struct {
	r   *database.Queries
	qTx *sql.Tx
	db  *sql.DB
}

func NewMenuImpl(r *database.Queries, qTx *sql.Tx, db *sql.DB) *sMenu {
	return &sMenu{
		r:   r,
		qTx: qTx,
		db:  db,
	}
}

func (s *sMenu) CreateMenu(ctx context.Context, in *model.MenuInput) (codeResult int, out model.MenuOutput, err error) {
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, model.MenuOutput{}, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	qtx := s.r.WithTx(tx)
	var level int
	var numberOrder int
	subjectUUID := ctx.Value("subjectUUID")
	var infoUser model.GetCacheToken
	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeGetCache, model.MenuOutput{}, err
	}
	roleId, err := qtx.GetOneRoleAccountByAccountId(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeRoleError, model.MenuOutput{}, fmt.Errorf("failed to get role: %w", err)
	}
	// Kiểm tra url có tồn tại trong DB
	if urlFound, err := s.r.CountMenuByURL(ctx, database.CountMenuByURLParams{
		MenuUrl:  in.Menu_url,
		MenuName: in.Menu_name,
	}); err != nil {
		return response.ErrCodeMenuError, model.MenuOutput{}, fmt.Errorf("failed to count menu: %w", err)
	} else if urlFound > 0 {
		return response.ErrCodeMenuHasExists, model.MenuOutput{}, fmt.Errorf("Menu already exists")
	}

	var menuParentID sql.NullString
	if in.Menu_parent_id != "" {
		menuParentID = sql.NullString{String: in.Menu_parent_id, Valid: true}
	}

	if !menuParentID.Valid {
		count, err := s.r.CountRootMenus(ctx)
		if err != nil {
			return response.ErrCodeMenuError, model.MenuOutput{}, fmt.Errorf("failed to count root menus: %w", err)
		}
		level = 1
		numberOrder = int(count) + 1
	} else {
		parentMenu, err := s.r.GetMenuById(ctx, menuParentID.String)
		if err != nil {
			return response.ErrCodeMenuError, model.MenuOutput{}, err
		}
		level = int(parentMenu.MenuLevel) + 1
		count, err := s.r.CountMenuWithParentId(ctx, menuParentID)
		if err != nil {
			return response.ErrCodeMenuError, model.MenuOutput{}, err
		}
		numberOrder = int(count) + 1
	}
	// Tạo ID mới cho menu
	newUUID := uuid.New().String()

	// Thêm menu vào DB
	if _, err := qtx.InsertMenu(ctx, database.InsertMenuParams{
		ID:              newUUID,
		MenuName:        in.Menu_name,
		MenuIcon:        in.Menu_icon,
		MenuUrl:         in.Menu_url,
		MenuParentID:    menuParentID,
		MenuLevel:       int32(level),
		MenuNumberOrder: int32(numberOrder),
		MenuGroupName:   in.Menu_group_name,
	}); err != nil {
		return response.ErrCodeMenuError, model.MenuOutput{}, err
	}
	//insert bảng role_menu
	if err = qtx.CreateRolesMenu(ctx, database.CreateRolesMenuParams{
		ID:         uuid.New().String(),
		MenuID:     newUUID,
		RoleID:     roleId.RoleID,
		ListMethod: json.RawMessage(`["GET", "POST", "PUT", "DELETE"]`),
	}); err != nil {
		return response.ErrCodeMenuError, model.MenuOutput{}, err
	}
	// Commit transaction
	err = tx.Commit()
	if err != nil {
		return response.ErrCodeTransactionError, model.MenuOutput{}, fmt.Errorf("failed to commit transaction: %w", err)
	}
	committed = true
	// Tạo output từ input
	output := model.MenuOutput{
		Id:                newUUID, // Sử dụng ID mới
		Menu_name:         in.Menu_name,
		Menu_icon:         in.Menu_icon,
		Menu_url:          in.Menu_url,
		Menu_parent_id:    in.Menu_parent_id,
		Menu_level:        level,
		Menu_Number_order: numberOrder,
		Menu_group_name:   in.Menu_group_name,
	}

	// Trả về kết quả thành công
	return response.ErrCodeSucces, output, err
}

func (s *sMenu) GetMenuById(ctx context.Context, id string) (codeResult int, out model.MenuOutput, err error) {
	// Lấy menu từ repository
	menubyid, err := s.r.GetMenuById(ctx, id)
	if err != nil {
		return response.ErrCodeMenuError, model.MenuOutput{}, err
	}
	var children []model.MenuOutput
	if menubyid.Children != nil {
		if data, ok := menubyid.Children.([]byte); ok {
			if err := json.Unmarshal(data, &children); err != nil {
				children = []model.MenuOutput{}
			}
		}
	}
	out = model.MenuOutput{
		Id:                menubyid.ID,
		Menu_name:         menubyid.MenuName,
		Menu_icon:         menubyid.MenuIcon,
		Menu_url:          menubyid.MenuUrl,
		Menu_Number_order: int(menubyid.MenuNumberOrder),
		Menu_parent_id:    menubyid.MenuParentID.String,
		Menu_level:        int(menubyid.MenuLevel),
		Children:          children,
	}

	return response.ErrCodeSucces, out, err
}

func (s *sMenu) EditMenuById(ctx context.Context, menuUpdates []model.MenuInputEdit) (int, []model.MenuOutput, error) {
	// Bắt đầu transaction mới
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, nil, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	qtx := s.r.WithTx(tx)
	subjectUUID := ctx.Value("subjectUUID")
	var infoUser model.GetCacheToken
	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeGetCache, nil, err
	}
	roleId, err := s.r.GetOneRoleAccountByAccountId(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeRoleError, nil, fmt.Errorf("failed to get role: %w", err)
	}
	// Lấy thông tin tất cả menu (sử dụng transaction)
	allMenus, err := s.r.GetAllMenus(ctx, roleId.RoleID)
	if err != nil {
		return response.ErrCodeMenuError, nil, fmt.Errorf("failed to get all menus: %w", err)
	}

	// Xử lý logic cập nhật menu
	updateParamsList, err := utils.ProcessMenuUpdates(menuUpdates, allMenus)
	if err != nil {
		return response.ErrCodeMenuError, nil, err
	}

	// Thực hiện các truy vấn cập nhật trong transaction
	for _, updateParams := range updateParamsList {
		// Kiểm tra url và tên có trùng hay không
		urlMenuFound, err := s.r.CountEditMenu(ctx, database.CountEditMenuParams{
			ID_2: updateParams.ID,
			ID:   updateParams.ID,
			ID_3: updateParams.ID,
		})
		if err != nil {
			return response.ErrCodeMenuError, nil, fmt.Errorf("failed to count menu: %w", err)
		}
		if urlMenuFound > 0 {
			return response.ErrCodeMenuHasExists, nil, fmt.Errorf("menu URL already exists: %s", updateParams.MenuUrl)
		}
		errUpdate := qtx.UpdateSingleMenu(ctx, updateParams)
		if errUpdate != nil {
			return response.ErrCodeMenuError, nil, fmt.Errorf("failed to update menu ID %s: %w", updateParams.ID, err)
		}
	}

	// Commit transaction sau khi cập nhật thành công
	err = tx.Commit()
	if err != nil {
		return response.ErrCodeTransactionError, nil, fmt.Errorf("failed to commit transaction: %w", err)
	}
	committed = true

	// Lấy lại tất cả menu sau khi cập nhật
	allMenus, err = s.r.GetAllMenus(ctx, roleId.RoleID)
	if err != nil {
		return response.ErrCodeMenuError, nil, fmt.Errorf("failed to get all menus: %w", err)
	}

	// Convert to MenuOutput format
	var menuOutputs []model.MenuOutput
	for _, menu := range allMenus {
		menuOutputs = append(menuOutputs, model.MenuOutput{
			Id:                menu.ID,
			Menu_name:         menu.MenuName,
			Menu_icon:         menu.MenuIcon,
			Menu_url:          menu.MenuUrl,
			Menu_parent_id:    menu.MenuParentID.String,
			Menu_level:        int(menu.MenuLevel),
			Menu_Number_order: int(menu.MenuNumberOrder),
			Menu_group_name:   menu.MenuGroupName,
		})
	}

	// Xây dựng cây menu
	menuMap, rootMenus := repo.GroupMenusByParent(menuOutputs)
	finalMenus := repo.BuildMenuTree(rootMenus, menuMap)

	return response.ErrCodeSucces, finalMenus, nil
}

func (s *sMenu) DeleteMenu(ctx context.Context, id string) (int, error) {
	// Bắt đầu transaction mới
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	qtx := s.r.WithTx(tx)
	subjectUUID := ctx.Value("subjectUUID")
	var infoUser model.GetCacheToken
	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeGetCache, err
	}
	roleId, err := s.r.GetOneRoleAccountByAccountId(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeRoleError, fmt.Errorf("failed to get role: %w", err)
	}
	// Lấy thông tin menu cần xóa
	_, err = s.r.GetMenuById(ctx, id)
	if err != nil {
		return response.ErrCodeMenuError, fmt.Errorf("menu not found: %w", err)
	}

	// Lấy tất cả menu để kiểm tra menu cha-con
	allMenus, err := s.r.GetAllMenus(ctx, roleId.RoleID)
	if err != nil {
		return response.ErrCodeMenuError, fmt.Errorf("failed to get all menus: %w", err)
	}

	// Tạo map để lưu thông tin menu hiện tại
	menuMap := make(map[string]database.GetAllMenusRow)
	for _, m := range allMenus {
		menuMap[m.ID] = m
	}

	// Kiểm tra xem menu có phải là menu cha không
	isParent := false
	for _, m := range allMenus {
		if m.MenuParentID.String == id {
			isParent = true
			break
		}
	}

	if isParent {
		// Nếu là menu cha, xóa tất cả menu con
		for _, m := range allMenus {
			if m.MenuParentID.String == id {
				// Xóa menu con
				err := qtx.DeleteMenu(ctx, m.ID)
				if err != nil {
					return response.ErrCodeMenuError, fmt.Errorf("failed to delete child menu %s: %w", m.ID, err)
				}
			}
		}
		// Xóa menu cha
		err := qtx.DeleteMenu(ctx, id)
		if err != nil {
			return response.ErrCodeMenuError, fmt.Errorf("failed to delete parent menu: %w", err)
		}
	} else {
		// Nếu là menu con, chỉ cập nhật Is_deleted
		err := qtx.UpdateMenuDeleted(ctx, id)
		if err != nil {
			return response.ErrCodeMenuError, fmt.Errorf("failed to update menu deleted status: %w", err)
		}
	}

	// Commit transaction
	err = tx.Commit()
	if err != nil {
		return response.ErrCodeTransactionError, fmt.Errorf("failed to commit transaction: %w", err)
	}
	committed = true

	return response.ErrCodeSucces, nil
}

func (s *sMenu) GetAllMenuByRoleId(ctx context.Context, search string) (codeResult int, out []model.MenuOutputFuncpackage, err error) {
	// Bắt đầu transaction
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, out, fmt.Errorf("failed to begin transaction: %w", err)
	}
	defer tx.Rollback()

	subjectUUID := ctx.Value("subjectUUID")
	var infoUser model.GetCacheToken

	// Lấy thông tin tài khoản từ cache
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeGetCache, out, err
	}

	// Lấy RoleId theo tài khoản
	RoleId, err := s.r.GetOneRoleAccountByAccountId(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeRoleError, out, fmt.Errorf("failed to get role: %w", err)
	}

	// Lấy danh sách menu theo RoleId + search
	lstmenus, err := s.r.GetMenuByRoleId(ctx, database.GetMenuByRoleIdParams{
		ID:      RoleId.RoleID,
		Column2: search,
		CONCAT:  search,
	})
	if err != nil {
		return response.ErrCodeRoleError, out, fmt.Errorf("failed to get menu: %w", err)
	}
	menuMap := make(map[string]struct{})

	// Bước 1: Thêm menu chính vào out
	for _, row := range lstmenus {
		menuMap[row.ID] = struct{}{}
		var methods []string
		if len(row.ListMethod) > 0 {
			if err := json.Unmarshal(row.ListMethod, &methods); err != nil {
				methods = []string{}
			}
		} else {
			methods = []string{}
		}
		out = append(out, model.MenuOutputFuncpackage{
			Id:                row.ID,
			Menu_name:         row.MenuName,
			Menu_icon:         row.MenuIcon,
			Menu_url:          row.MenuUrl,
			Menu_parent_id:    row.MenuParentID.String,
			Menu_level:        int(row.MenuLevel),
			Menu_Number_order: int(row.MenuNumberOrder),
			List_method:       methods,
			Menu_group_name:   row.MenuGroupName,
			Children:          []model.MenuOutputFuncpackage{},
		})
	}

	// Bước 2: Thêm menu cha nếu thiếu
	for _, row := range lstmenus {
		if row.MenuParentID.Valid {
			parentID := row.MenuParentID.String
			if _, exists := menuMap[parentID]; !exists {
				parentMenu, err := s.r.GetMenuById(ctx, parentID)
				if err == nil {
					menuMap[parentID] = struct{}{}
					var parentMethods []string
					if len(row.ListMethod) > 0 {
						if err := json.Unmarshal(row.ListMethod, &parentMethods); err != nil {
							log.Printf("Error unmarshaling ListMethod for parent menu %s: %v", parentID, err)
							parentMethods = []string{}
						}
					}
					out = append(out, model.MenuOutputFuncpackage{
						Id:                parentMenu.ID,
						Menu_name:         parentMenu.MenuName,
						Menu_icon:         parentMenu.MenuIcon,
						Menu_url:          parentMenu.MenuUrl,
						Menu_parent_id:    parentMenu.MenuParentID.String,
						Menu_level:        int(parentMenu.MenuLevel),
						Menu_Number_order: int(parentMenu.MenuNumberOrder),
						List_method:       parentMethods,
						Menu_group_name:   parentMenu.MenuGroupName,
						Children:          []model.MenuOutputFuncpackage{},
					})
				}
			}
		}
	}

	// Group & build tree
	groupedMenus, rootMenus := repo.GroupMenusByParentFuncpackage(out)
	finalMenu := repo.BuildMenuTreeFuncpackage(rootMenus, groupedMenus)
	return response.ErrCodeSucces, finalMenu, nil
}
