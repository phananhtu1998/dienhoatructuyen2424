export default function Footer() {
  return (
    <footer className="bg-gray-900 text-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* Contact Info */}
          <div>
            <h4 className="text-lg font-semibold mb-4">Thông tin liên hệ</h4>
            <div className="space-y-2">
              <p className="font-semibold">SỨC SỐNG FLOWERS</p>
              <p>Email: sucsongflowers@gmail.com</p>
              <p>Hotline: 0896 205 268</p>
              <p>Địa chỉ: 63 Tỉnh Thành Trên Toàn Quốc</p>
            </div>
          </div>

          {/* Store System */}
          <div>
            <h4 className="text-lg font-semibold mb-4">Hệ thống cửa hàng</h4>
            <div className="space-y-2">
              <p className="font-semibold">Miền Bắc</p>
              <p className="text-sm">Hà Nội, Bắc Ninh, Hà Nam, Hải Dương, Hải Phòng...</p>
              <p className="font-semibold mt-4">Miền Trung</p>
              <p className="text-sm">Đà Nẵng, Quảng Nam, Quảng Ngãi, Bình Định...</p>
              <p className="font-semibold mt-4">Miền Nam</p>
              <p className="text-sm">TP. Hồ Chí Minh, Bà Rịa Vũng Tàu, Bình Dương...</p>
            </div>
          </div>

          {/* Categories */}
          <div>
            <h4 className="text-lg font-semibold mb-4">DANH MỤC</h4>
            <div className="space-y-2">
              <a href="#" className="block hover:text-green-300">Giới thiệu</a>
              <a href="#" className="block hover:text-green-300">Danh mục sản phẩm</a>
              <a href="#" className="block hover:text-green-300">Hỗ trợ khách hàng</a>
              <a href="#" className="block hover:text-green-300">Tin tức</a>
              <a href="#" className="block hover:text-green-300">Liên hệ</a>
            </div>
          </div>

          {/* Social */}
          <div>
            <h4 className="text-lg font-semibold mb-4">Kết nối với chúng tôi</h4>
            <div className="flex space-x-4">
              <button className="bg-blue-600 p-2 rounded-full hover:bg-blue-700">
                <span className="text-white">Messenger</span>
              </button>
              <button className="bg-green-500 p-2 rounded-full hover:bg-green-600">
                <span className="text-white">Zalo</span>
              </button>
            </div>
          </div>
        </div>
        
        <div className="border-t border-gray-700 mt-8 pt-8 text-center">
          <p>© Copyright by Sức Sống Flowers. All rights reserved | Design by BITI Hightech</p>
        </div>
      </div>
    </footer>
  );
} 