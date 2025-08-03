import ProductCard from '../ui/ProductCard';
import { tetGifts } from '../../data/products';

export default function TetGifts() {
  return (
    <section className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center mb-8">
          <h3 className="text-3xl font-bold text-gray-900">Giỏ Quà Tết</h3>
          <a href="#" className="text-green-600 hover:text-green-700 font-semibold">Xem tất cả &gt;&gt;</a>
        </div>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-6 gap-4">
          {tetGifts.map((gift) => (
            <ProductCard
              key={gift.id}
              id={gift.id}
              name={gift.name}
              price={gift.price}
              image={gift.image}
              description={gift.description}
              className="h-32"
            />
          ))}
        </div>
      </div>
    </section>
  );
} 