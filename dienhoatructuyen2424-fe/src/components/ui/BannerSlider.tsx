'use client';

import { useState, useEffect, useRef } from 'react';
import Image from 'next/image';
import CategorySlider from "./CategorySlider";

const banners = [
  '/images/banner/300-x-81-5.png.webp',
  '/images/banner/300-x-81-7.png.webp', 
  '/images/banner/300-x-81.png.webp'
];

export default function BannerSlider() {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [isDragging, setIsDragging] = useState(false);
  const [startX, setStartX] = useState(0);
  const [currentX, setCurrentX] = useState(0);
  const [translateX, setTranslateX] = useState(0);
  const sliderRef = useRef<HTMLDivElement>(null);

  // Auto slide every 3 seconds
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % banners.length);
      setTranslateX(0);
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  const goToSlide = (index: number) => {
    setCurrentSlide(index);
    setTranslateX(0);
  };

  const nextSlide = () => {
    setCurrentSlide((prev) => (prev + 1) % banners.length);
    setTranslateX(0);
  };

  const prevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + banners.length) % banners.length);
    setTranslateX(0);
  };

  // Mouse event handlers for swipe
  const handleMouseDown = (e: React.MouseEvent) => {
    setIsDragging(true);
    setStartX(e.clientX);
    setCurrentX(e.clientX);
    setTranslateX(0);
  };

  const handleMouseMove = (e: React.MouseEvent) => {
    if (!isDragging) return;
    setCurrentX(e.clientX);
    
    const diff = e.clientX - startX;
    const maxTranslate = window.innerWidth * 0.5; // Max 50% of screen width
    const clampedDiff = Math.max(-maxTranslate, Math.min(maxTranslate, diff));
    setTranslateX(clampedDiff);
  };

  const handleMouseUp = (e: React.MouseEvent) => {
    if (!isDragging) return;
    
    const diff = startX - currentX;

    if (Math.abs(diff) > 10) { // Any movement more than 10px
      if (diff > 0) {
        // Swiped left - next slide
        nextSlide();
      } else {
        // Swiped right - previous slide
        prevSlide();
      }
    }

    setIsDragging(false);
  };

  const handleMouseLeave = () => {
    if (isDragging) {
      const diff = startX - currentX;
      
      if (Math.abs(diff) > 10) { // Any movement more than 10px
        if (diff > 0) {
          nextSlide();
        } else {
          prevSlide();
        }
      }
      
      setIsDragging(false);
    }
  };

  return (
    <>
      <div 
        ref={sliderRef}
        className="relative w-full h-96 overflow-hidden rounded-lg cursor-grab active:cursor-grabbing select-none"
        onMouseDown={handleMouseDown}
        onMouseMove={handleMouseMove}
        onMouseUp={handleMouseUp}
        onMouseLeave={handleMouseLeave}
      >
        {/* Current Banner Image */}
        <div 
          className="relative w-full h-full transition-transform duration-300 ease-out"
          style={{ 
            transform: `translateX(${translateX}px)`
          }}
        >
          <Image
            src={banners[currentSlide]}
            alt={`Banner ${currentSlide + 1}`}
            fill
            className="object-contain"
            priority
            draggable={false}
          />
        </div>

        {/* Dots Indicator */}
        <div className="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
          {banners.map((_, index) => (
            <button
              key={index}
              onClick={() => goToSlide(index)}
              className={`w-3 h-3 rounded-full transition-all cursor-pointer ${
                index === currentSlide
                  ? 'bg-white'
                  : 'bg-white bg-opacity-50 hover:bg-opacity-75'
              }`}
            />
          ))}
        </div>
      </div>
      <CategorySlider />
    </>
  );
} 