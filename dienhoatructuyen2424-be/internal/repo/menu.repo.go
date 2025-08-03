package repo

import (
	"go-backend-api/internal/model"
)

func BuildMenuTree(rootMenus []model.MenuOutput, menuMap map[string][]model.MenuOutput) []model.MenuOutput {
	for i := range rootMenus {
		if children, exists := menuMap[rootMenus[i].Id]; exists {
			rootMenus[i].Children = BuildMenuTree(children, menuMap) // Gán lại `Children`
		}
	}
	return rootMenus
}

// GroupMenusByParent nhóm danh sách menu theo `menu_parent_id`
func GroupMenusByParent(lstMenu []model.MenuOutput) (map[string][]model.MenuOutput, []model.MenuOutput) {
	menuMap := make(map[string][]model.MenuOutput)
	var rootMenus []model.MenuOutput

	for _, item := range lstMenu {
		// Chuyển đổi `sql.NullString` thành `string`
		parentId := ""
		if item.Menu_parent_id != "" {
			parentId = item.Menu_parent_id
		}

		menu := model.MenuOutput{
			Id:                item.Id,
			Menu_name:         item.Menu_name,
			Menu_icon:         item.Menu_icon,
			Menu_url:          item.Menu_url,
			Menu_level:        int(item.Menu_level),
			Menu_Number_order: int(item.Menu_Number_order),
			Menu_group_name:   item.Menu_group_name,
			Menu_parent_id:    parentId,
			Children:          []model.MenuOutput{},
		}

		if parentId == "" {
			rootMenus = append(rootMenus, menu)
		} else {
			menuMap[parentId] = append(menuMap[parentId], menu)
		}
	}
	return menuMap, rootMenus
}

func GroupMenusByParentFuncpackage(lstMenu []model.MenuOutputFuncpackage) (map[string][]model.MenuOutputFuncpackage, []model.MenuOutputFuncpackage) {
	menuMap := make(map[string][]model.MenuOutputFuncpackage)
	var rootMenus []model.MenuOutputFuncpackage
	for _, item := range lstMenu {
		// Chuyển đổi `sql.NullString` thành `string`
		parentId := ""
		if item.Menu_parent_id != "" {
			parentId = item.Menu_parent_id
		}
		menu := model.MenuOutputFuncpackage{
			Id:                item.Id,
			Menu_name:         item.Menu_name,
			Menu_icon:         item.Menu_icon,
			Menu_url:          item.Menu_url,
			Menu_level:        int(item.Menu_level),
			Menu_Number_order: int(item.Menu_Number_order),
			Menu_group_name:   item.Menu_group_name,
			Menu_parent_id:    parentId,
			List_method:       item.List_method, // Giữ lại List_method
			Children:          []model.MenuOutputFuncpackage{},
		}

		if parentId == "" {
			rootMenus = append(rootMenus, menu)
		} else {
			menuMap[parentId] = append(menuMap[parentId], menu)
		}
	}

	return menuMap, rootMenus
}

func BuildMenuTreeFuncpackage(rootMenus []model.MenuOutputFuncpackage, menuMap map[string][]model.MenuOutputFuncpackage) []model.MenuOutputFuncpackage {
	for i := range rootMenus {
		if children, exists := menuMap[rootMenus[i].Id]; exists {
			// Tạo bản sao của children để không mất thông tin List_method
			childrenCopy := make([]model.MenuOutputFuncpackage, len(children))
			copy(childrenCopy, children)
			rootMenus[i].Children = BuildMenuTreeFuncpackage(childrenCopy, menuMap)
		}
	}
	return rootMenus
}
