import { useState } from "react";
import Image from "next/image";

const categories = [
  { name: "Bó Hoa Sinh Nhật, Tình Yêu", image: "/images/categories/bo-hoa-sinh-nhat-tinh-yeu.webp" },
  { name: "Hoa Cưới", image: "/images/categories/hoa-cuoi.webp" },
  { name: "Giỏ Quà Tết", image: "/images/categories/gio-qua-tet.png" },
  { name: "Cây Xanh Văn Phòng", image: "/images/categories/cay-xanh-van-phong.webp" },
  { name: "Giỏ Trái Cây", image: "/images/categories/gio-trai-cay.png" },
  { name: "Bánh Kem", image: "/images/categories/banh-kem.png" },
  { name: "Lan Hồ Điệp", image: "/images/categories/lan-ho-diep.webp" },
  { name: "Kệ hoa khai trương", image: "/images/categories/ke-hoa-khai-truong.png" },
  { name: "Giỏ Hoa Khai Trương, Sinh Nhật", image: "/images/categories/gio-hoa-khai-truong-sinh-nhat.jpg" },
  { name: "Kệ hoa chia buồn", image: "/images/categories/ke-hoa-chia-buon.webp" },
];

const VISIBLE_CAT = 8;

export default function CategorySlider() {
  const [catStart, setCatStart] = useState(0);

  const catPrev = () => {
    if (catStart === 0) {
      // Nếu ở đầu, quay về cuối
      setCatStart(categories.length - 1);
    } else {
      setCatStart(catStart - 1);
    }
  };

  const catNext = () => {
    if (catStart >= categories.length - 1) {
      // Nếu ở cuối, quay về đầu
      setCatStart(0);
    } else {
      setCatStart(catStart + 1);
    }
  };

  // Tạo danh sách categories theo vòng tròn
  const getVisibleCategories = () => {
    const result = [];
    for (let i = 0; i < VISIBLE_CAT; i++) {
      const index = (catStart + i) % categories.length;
      result.push(categories[index]);
    }
    return result;
  };

  return (
    <div className="w-full mt-6">
      <div className="flex items-center w-full">
        <button
          onClick={catPrev}
          className="w-6 h-6 rounded-full bg-gray-100 flex items-center justify-center text-gray-500 hover:bg-gray-200 hover:text-gray-700 transition-all duration-200 cursor-pointer shadow-sm flex-shrink-0"
          aria-label="Trước"
        >
          <svg className="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
            <path fillRule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clipRule="evenodd" />
          </svg>
        </button>

        <div className="flex flex-1 overflow-hidden">
          <div 
            className="flex flex-1 transition-transform duration-300 ease-in-out"
            style={{
              transform: `translateX(0)`,
            }}
          >
            {getVisibleCategories().map((cat, idx) => (
              <div 
                key={`${catStart}-${idx}`} 
                className="flex flex-col items-center flex-1 min-w-0"
              >
                <div className="w-16 h-16 rounded-full overflow-hidden border border-gray-200 flex items-center justify-center bg-white shadow-sm">
                  <Image
                    src={cat.image}
                    alt={cat.name}
                    width={64}
                    height={64}
                    className="object-contain w-full h-full"
                  />
                </div>
                <span className="mt-2 text-center text-xs leading-tight whitespace-pre-line font-medium px-1">{cat.name}</span>
              </div>
            ))}
          </div>
        </div>

        <button
          onClick={catNext}
          className="w-6 h-6 rounded-full bg-gray-100 flex items-center justify-center text-gray-500 hover:bg-gray-200 hover:text-gray-700 transition-all duration-200 cursor-pointer shadow-sm flex-shrink-0"
          aria-label="Sau"
        >
          <svg className="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
            <path fillRule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clipRule="evenodd" />
          </svg>
        </button>
      </div>
    </div>
  );
}