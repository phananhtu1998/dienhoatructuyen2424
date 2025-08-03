export default function Navigation() {
  return (
    <nav className="bg-green-700">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-12">
          <div className="flex items-center space-x-8">
            <a href="#" className="text-white hover:text-green-200 px-3 py-2 text-sm font-medium">Trang chủ</a>
            <a href="#" className="text-white hover:text-green-200 px-3 py-2 text-sm font-medium">Giới thiệu</a>
            <div className="relative group">
              <button className="text-white hover:text-green-200 px-3 py-2 text-sm font-medium flex items-center">
                Danh Mục Sản Phẩm
                <svg className="ml-1 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
              </button>
              <div className="absolute left-0 mt-2 w-64 bg-white rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
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
            <a href="#" className="text-white hover:text-green-200 px-3 py-2 text-sm font-medium">Hỗ Trợ Khách Hàng</a>
            <a href="#" className="text-white hover:text-green-200 px-3 py-2 text-sm font-medium">Tin tức</a>
            <a href="#" className="text-white hover:text-green-200 px-3 py-2 text-sm font-medium">Liên hệ</a>
          </div>
        </div>
      </div>
    </nav>
  );
} 