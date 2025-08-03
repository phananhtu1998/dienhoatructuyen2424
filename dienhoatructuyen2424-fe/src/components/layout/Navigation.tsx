import { categories } from '../../data/products';
import CategoryCard from '../ui/CategoryCard';

export default function Navigation() {
  return (
    <nav className="bg-gray-100">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center h-12">
          <div className="flex items-center space-x-8">
            <a href="#" className="text-orange-500 hover:text-orange-600 px-4 py-3 text-sm font-medium">TRANG CHỦ</a>
            <a href="#" className="text-gray-700 hover:text-green-600 px-4 py-3 text-sm font-medium">GIỚI THIỆU</a>
            <div className="relative group">
              <button className="text-gray-700 hover:text-green-600 px-4 py-3 text-sm font-medium flex items-center">
                DANH MỤC SẢN PHẨM
                <svg className="ml-1 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
              </button>
              <div className="absolute left-0 mt-2 w-64 bg-white rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-gray-200">
                <div className="py-2">
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Kệ Hoa Khai Trương</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Giỏ Hoa Khai Trương, Sinh Nhật</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Kệ Hoa Chia Buồn</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Giỏ Hoa Chia Buồn</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Bó Hoa Sinh Nhật, Tình Yêu</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Lan Hồ Điệp</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Giỏ Trái Cây</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Cây Xanh Văn Phòng</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Bánh Kem</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Hoa Mừng Tốt Nghiệp</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Hoa Cưới</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Giỏ Quà Tết</a>
                </div>
              </div>
            </div>
            <div className="relative group">
              <button className="text-gray-700 hover:text-green-600 px-4 py-3 text-sm font-medium flex items-center">
                HỖ TRỢ KHÁCH HÀNG
                <svg className="ml-1 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
              </button>
              <div className="absolute left-0 mt-2 w-64 bg-white rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
                <div className="py-2">
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Hướng dẫn mua hàng</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Chính sách đổi trả</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Bảo mật thông tin</a>
                  <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">FAQ</a>
                </div>
              </div>
            </div>
            <a href="#" className="text-gray-700 hover:text-green-600 px-4 py-3 text-sm font-medium">TIN TỨC</a>
            <a href="#" className="text-gray-700 hover:text-green-600 px-4 py-3 text-sm font-medium">LIÊN HỆ</a>
          </div>
        </div>
      </div>
    </nav>
  );
} 