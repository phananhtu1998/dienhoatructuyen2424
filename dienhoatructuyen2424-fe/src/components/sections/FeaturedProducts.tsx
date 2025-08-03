import ProductCard from '../ui/ProductCard';

const featuredProducts = [
  {
    id: 'SQ0103',
    name: 'SQ0103',
    price: '1,820,000 ₫',
    emoji: '🌹',
    gradientFrom: 'pink-100',
    gradientTo: 'red-100'
  },
  {
    id: 'SQ742',
    name: 'SQ742',
    price: '2,300,000 ₫',
    emoji: '🌻',
    gradientFrom: 'yellow-100',
    gradientTo: 'orange-100'
  },
  {
    id: 'SQ0098',
    name: 'SQ0098',
    price: '3,700,000 ₫',
    emoji: '🌸',
    gradientFrom: 'purple-100',
    gradientTo: 'pink-100'
  },
  {
    id: 'SQ825',
    name: 'SQ825',
    price: '870,000 ₫',
    emoji: '🌺',
    gradientFrom: 'blue-100',
    gradientTo: 'indigo-100'
  }
];

export default function FeaturedProducts() {
  return (
    <section className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h3 className="text-3xl font-bold text-gray-900 mb-8 text-center">SẢN PHẨM BÁN CHẠY</h3>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {featuredProducts.map((product) => (
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