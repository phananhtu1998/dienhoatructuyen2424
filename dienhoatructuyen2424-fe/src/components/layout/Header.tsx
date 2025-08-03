import Image from 'next/image';

export default function Header() {
  return (
    <header>
      {/* Top Green Bar - Very thin */}
      <div className="bg-green-600 h-6">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-full">
            <div className="text-white text-xs">
              Chào mừng bạn đến với Sức Sống Flowers
            </div>
            <div className="flex items-center space-x-2 text-white text-xs">
              <span className="text-red-400 text-sm">★</span>
              <span className="cursor-pointer">VI ^</span>
            </div>
          </div>
        </div>
      </div>

      {/* Main Header Area - Much taller */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-4 h-24">
            {/* Logo - Exact 100x100px size */}
            <div className="flex items-center">
              <Image
                src="/images/logo/logo.png"
                alt="Sức Sống Flowers Logo"
                width={100}
                height={100}
                className="w-[100px] h-[100px] cursor-pointer"
                priority
              />
            </div>

            {/* Search Bar - Smaller and more rounded */}
            <div className="hidden md:flex flex-1 max-w-xl mx-16">
              <div className="relative w-full">
                <input
                  type="text"
                  placeholder="Tìm kiếm..."
                  className="w-full px-4 py-2 pr-10 text-sm border border-gray-300 rounded-full focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent bg-white cursor-text"
                />
                <div className="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                  <svg className="h-4 w-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </div>
              </div>
            </div>

            {/* Hotline and Cart - Larger spacing */}
            <div className="flex items-center space-x-12">
              {/* Hotline - Larger text and icon */}
              <div className="hidden md:flex items-center space-x-3 cursor-pointer">
                <svg className="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                </svg>
                <div className="text-center">
                  <p className="text-sm text-gray-500">Hotline</p>
                  <p className="text-base font-bold text-green-600">0896 205 268</p>
                </div>
              </div>

              {/* Cart - SVG icon with Font Awesome style */}
              <div className="flex items-center space-x-2">
                <div className="relative group">
                  <button className="flex items-center justify-center w-12 h-12 text-green-600 hover:text-green-700 cursor-pointer">
                    <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                      <path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12L9.1 13h7.45c.75 0 1.41-.41 1.75-1.03L21.7 4H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"/>
                    </svg>
                  </button>
                  {/* Cart Badge - Larger */}
                  <div className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-6 w-6 flex items-center justify-center">
                    0
                  </div>
                  
                  {/* Cart Dropdown Popup */}
                  <div className="absolute right-0 mt-2 w-80 bg-white rounded-lg shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-gray-200">
                    <div className="p-4">
                      {/* Title */}
                      <div className="text-center mb-4">
                        <h3 className="text-lg font-semibold text-gray-900">Giỏ hàng của bạn</h3>
                      </div>
                      
                      {/* Empty Cart Message */}
                      <div className="text-center mb-4">
                        <p className="text-sm text-gray-600">Chưa có sản phẩm trong giỏ hàng</p>
                        <p className="text-sm text-gray-600 mt-1">Tổng cộng: 0</p>
                      </div>
                      
                      {/* Action Buttons */}
                      <div className="space-y-2">
                        <button className="w-full bg-red-600 text-white py-2 px-4 rounded-md hover:bg-red-700 transition-colors text-sm font-medium cursor-pointer">
                          Mua hàng ngay
                        </button>
                        <button className="w-full border border-red-600 text-red-600 py-2 px-4 rounded-md hover:bg-red-50 transition-colors text-sm font-medium cursor-pointer">
                          Xem giỏ hàng
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <span className="text-sm text-gray-500 cursor-pointer">Giỏ hàng</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
} 