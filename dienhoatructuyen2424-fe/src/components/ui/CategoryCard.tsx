'use client';

import ImageWithFallback from './ImageWithFallback';

interface CategoryCardProps {
  id: string;
  name: string;
  image: string;
  description: string;
  className?: string;
}

export default function CategoryCard({ id, name, image, description, className = '' }: CategoryCardProps) {
  return (
    <div className={`bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow cursor-pointer ${className}`}>
      <div className="h-32 relative bg-gradient-to-br from-gray-100 to-gray-200">
        <ImageWithFallback
          src={image}
          alt={name}
          fill
          className="object-cover"
          sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 25vw"
        />
      </div>
      <div className="p-4">
        <h4 className="font-semibold text-gray-900 mb-2 text-sm">{name}</h4>
        <p className="text-xs text-gray-600 line-clamp-2">{description}</p>
      </div>
    </div>
  );
} 