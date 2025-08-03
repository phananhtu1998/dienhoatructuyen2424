interface ProductCardProps {
  id: string;
  name: string;
  price: string;
  emoji: string;
  gradientFrom: string;
  gradientTo: string;
}

export default function ProductCard({ id, name, price, emoji, gradientFrom, gradientTo }: ProductCardProps) {
  return (
    <div className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow">
      <div className={`h-48 bg-gradient-to-br from-${gradientFrom} to-${gradientTo} flex items-center justify-center`}>
        <span className="text-4xl">{emoji}</span>
      </div>
      <div className="p-4">
        <h4 className="font-semibold text-gray-900 mb-2">{name}</h4>
        <p className="text-2xl font-bold text-green-600">{price}</p>
      </div>
    </div>
  );
} 