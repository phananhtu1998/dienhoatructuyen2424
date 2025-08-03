import ProductCard from '../ui/ProductCard';

const specialProducts = [
  {
    id: 'FR38',
    name: 'Giỏ trái cây – FR38',
    price: '870,000 ₫',
    emoji: '🍎',
    gradientFrom: 'green-100',
    gradientTo: 'emerald-100'
  },
  {
    id: 'Cake17',
    name: 'Bánh kem – Cake 17',
    price: '520,000 ₫',
    emoji: '🎂',
    gradientFrom: 'pink-100',
    gradientTo: 'rose-100'
  },
  {
    id: 'Cake01',
    name: 'Bánh kem – Cake 01',
    price: '480,000 ₫',
    emoji: '🎂',
    gradientFrom: 'yellow-100',
    gradientTo: 'amber-100'
  },
  {
    id: 'FR28',
    name: 'Giỏ trái cây – FR28',
    price: '1,700,000 ₫',
    emoji: '🍊',
    gradientFrom: 'orange-100',
    gradientTo: 'red-100'
  }
];

export default function SpecialProducts() {
  return (
    <section className="py-16 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h3 className="text-3xl font-bold text-gray-900 mb-8 text-center">SẢN PHẨM NỔI BẬT</h3>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {specialProducts.map((product) => (
            <ProductCard
              key={product.id}
              id={product.id}
              name={product.name}
              price={product.price}
              emoji={product.emoji}
              gradientFrom={product.gradientFrom}
              gradientTo={product.gradientTo}
            />
          ))}
        </div>
      </div>
    </section>
  );
} 