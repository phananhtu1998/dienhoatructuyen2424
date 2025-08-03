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
              <span>VI ^</span>
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
                className="w-[100px] h-[100px]"
                priority
              />
            </div>

            {/* Search Bar - Smaller and more rounded */}
            <div className="hidden md:flex flex-1 max-w-xl mx-16">
              <div className="relative w-full">
                <input
                  type="text"
                  placeholder="Tìm kiếm..."
                  className="w-full px-4 py-2 pr-10 text-sm border border-gray-300 rounded-full focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent bg-white"
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
              <div className="hidden md:flex items-center space-x-3">
                <svg className="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                </svg>
                <div className="text-center">
                  <p className="text-sm text-gray-500">Hotline</p>
                  <p className="text-base font-bold text-green-600">0896 205 268</p>
                </div>
              </div>

              {/* Cart - Larger icon and text */}
              <div className="flex items-center space-x-2">
                <div className="relative">
                  <button className="flex items-center justify-center w-12 h-12 text-green-600 hover:text-green-700">
                    <svg className="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 3h2l.4 2M7 13h10l4-8H5.4m0 0L7 13m0 0l-2.5 5M7 13l2.5 5m6-5v6a2 2 0 01-2 2H9a2 2 0 01-2-2v-6m8 0V9a2 2 0 00-2-2H9a2 2 0 00-2 2v4.01" />
                    </svg>
                  </button>
                  {/* Cart Badge - Larger */}
                  <div className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-6 w-6 flex items-center justify-center">
                    0
                  </div>
                </div>
                <span className="text-sm text-gray-500">Giỏ hàng</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
} 