"use client"
import ProductCard from '../ui/ProductCard';
import { featuredProducts } from '../../data/products';
import Link from 'next/link';
import { useState, useEffect, useRef } from 'react';

const MAX_DISPLAY_ITEMS = 8;
const AUTO_SLIDE_INTERVAL = 5000; // 5 seconds

export default function FeaturedProducts() {
  const [productStart, setProductStart] = useState(0);
  const [slideDirection, setSlideDirection] = useState(0);
  const autoSlideRef = useRef<NodeJS.Timeout | null>(null);

  // Tính toán số trang tối đa
  const maxPages = Math.ceil(featuredProducts.length / MAX_DISPLAY_ITEMS);

  const productPrev = () => {
    setSlideDirection(-1);
    
    if (productStart === 0) {
      // Nếu ở trang đầu, quay về trang cuối
      setProductStart((maxPages - 1) * MAX_DISPLAY_ITEMS);
    } else {
      setProductStart(productStart - MAX_DISPLAY_ITEMS);
    }
    
    setTimeout(() => {
      setSlideDirection(0);
    }, 400);
    
    // Reset auto slide timer
    resetAutoSlide();
  };

  const productNext = () => {
    setSlideDirection(1);
    
    if (productStart >= (maxPages - 1) * MAX_DISPLAY_ITEMS) {
      // Nếu ở trang cuối, quay về trang đầu
      setProductStart(0);
    } else {
      setProductStart(productStart + MAX_DISPLAY_ITEMS);
    }
    
    setTimeout(() => {
      setSlideDirection(0);
    }, 400);
    
    // Reset auto slide timer
    resetAutoSlide();
  };

  const autoSlide = () => {
    setSlideDirection(1);
    
    if (productStart >= (maxPages - 1) * MAX_DISPLAY_ITEMS) {
      // Nếu ở trang cuối, quay về trang đầu
      setProductStart(0);
    } else {
      setProductStart(productStart + MAX_DISPLAY_ITEMS);
    }
    
    setTimeout(() => {
      setSlideDirection(0);
    }, 400);
  };

  const resetAutoSlide = () => {
    // Clear existing timer
    if (autoSlideRef.current) {
      clearInterval(autoSlideRef.current);
    }
    
    // Start new timer
    autoSlideRef.current = setInterval(autoSlide, AUTO_SLIDE_INTERVAL);
  };

  // Start auto slide on component mount and when productStart changes
  useEffect(() => {
    resetAutoSlide();
    
    // Cleanup on unmount
    return () => {
      if (autoSlideRef.current) {
        clearInterval(autoSlideRef.current);
      }
    };
  }, [productStart]);

  // Tạo danh sách sản phẩm theo phân trang
  const getVisibleProducts = () => {
    const result = [];
    for (let i = 0; i < MAX_DISPLAY_ITEMS; i++) {
      const index = productStart + i;
      if (index < featuredProducts.length) {
        result.push(featuredProducts[index]);
      }
    }
    return result;
  };

  // Tính toán transform với hiệu ứng hiện đại
  const getTransformStyle = () => {
    const baseTransform = 'translateX(0)';
    
    if (slideDirection === 0) {
      return {
        transform: baseTransform,
        transition: 'transform 0.4s cubic-bezier(0.4, 0, 0.2, 1)'
      };
    }
    
    const itemWidth = 100 / MAX_DISPLAY_ITEMS;
    const translateX = slideDirection === 1 ? `-${itemWidth}%` : `${itemWidth}%`;
    
    return {
      transform: `translateX(${translateX})`,
      transition: 'transform 0.4s cubic-bezier(0.4, 0, 0.2, 1)'
    };
  };

  const hasMoreProducts = featuredProducts.length > MAX_DISPLAY_ITEMS;

  return (
    <section className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center mb-8">
          <h3 className="text-3xl font-bold text-gray-900">SẢN PHẨM BÁN CHẠY</h3>
          {hasMoreProducts && (
            <Link 
              href="/products" 
              className="text-gray-500 hover:text-gray-700 transition-colors duration-200 text-sm"
            >
              Xem tất cả &gt;&gt;
            </Link>
          )}
        </div>
        
        {hasMoreProducts ? (
          <div className="relative">
            <div className="flex items-center w-full">
              <button
                onClick={productPrev}
                className="w-8 h-8 rounded-full bg-white border border-gray-200 flex items-center justify-center text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 transition-all duration-300 cursor-pointer shadow-sm flex-shrink-0 hover:shadow-md active:scale-95 z-10"
                aria-label="Trước"
              >
                <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clipRule="evenodd" />
                </svg>
              </button>

              <div className="flex flex-1 overflow-hidden mx-4">
                <div 
                  className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 w-full"
                  style={getTransformStyle()}
                >
                  {getVisibleProducts().map((product, idx) => (
                    <div key={`${productStart}-${idx}`}>
                      <ProductCard
                        id={product.id}
                        name={product.name}
                        price={product.price}
                        image={product.image}
                        description={product.description}
                      />
                    </div>
                  ))}
                </div>
              </div>

              <button
                onClick={productNext}
                className="w-8 h-8 rounded-full bg-white border border-gray-200 flex items-center justify-center text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 transition-all duration-300 cursor-pointer shadow-sm flex-shrink-0 hover:shadow-md active:scale-95 z-10"
                aria-label="Sau"
              >
                <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clipRule="evenodd" />
                </svg>
              </button>
            </div>
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {featuredProducts.map((product) => (
              <ProductCard
                key={product.id}
                id={product.id}
                name={product.name}
                price={product.price}
                image={product.image}
                description={product.description}
              />
            ))}
          </div>
        )}
      </div>
    </section>
  );
} 