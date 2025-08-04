import ProductCard from '../ui/ProductCard';
import { featuredProducts } from '../../data/products';
import Link from 'next/link';

const MAX_DISPLAY_ITEMS = 8;

export default function FeaturedProducts() {
  const displayProducts = featuredProducts.slice(0, MAX_DISPLAY_ITEMS);
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
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {displayProducts.map((product) => (
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
      </div>
    </section>
  );
} 