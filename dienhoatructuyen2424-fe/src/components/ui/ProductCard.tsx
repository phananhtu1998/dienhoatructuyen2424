'use client';

import ImageWithFallback from './ImageWithFallback';

interface ProductCardProps {
  id: string;
  name: string;
  price: string;
  image: string;
  description?: string;
  className?: string;
}

export default function ProductCard({ id, name, price, image, description, className = '' }: ProductCardProps) {
  return (
    <div className={`bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow ${className}`}>
      <div className="h-48 relative bg-gradient-to-br from-gray-100 to-gray-200">
        <ImageWithFallback
          src={image}
          alt={name}
          fill
          className="object-cover"
          sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 25vw"
        />
      </div>
      <div className="p-4">
        <h4 className="font-semibold text-gray-900 mb-2">{name}</h4>
        {description && (
          <p className="text-sm text-gray-600 mb-2 line-clamp-2">{description}</p>
        )}
        <p className="text-2xl font-bold text-green-600">{price}</p>
      </div>
    </div>
  );
} 