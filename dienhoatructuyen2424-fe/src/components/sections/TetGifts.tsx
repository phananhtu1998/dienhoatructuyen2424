export default function TetGifts() {
  const tetGifts = Array.from({ length: 6 }, (_, i) => ({
    id: `QT${String(i + 1).padStart(3, '0')}`,
    name: `Giỏ quà – QT${String(i + 1).padStart(3, '0')}`,
    price: `${Math.floor(Math.random() * 2000 + 500)}.000 ₫`,
    emoji: '🎁'
  }));

  return (
    <section className="py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center mb-8">
          <h3 className="text-3xl font-bold text-gray-900">Giỏ Quà Tết</h3>
          <a href="#" className="text-green-600 hover:text-green-700 font-semibold">Xem tất cả &gt;&gt;</a>
        </div>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-6 gap-4">
          {tetGifts.map((gift) => (
            <div key={gift.id} className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow">
              <div className="h-32 bg-gradient-to-br from-red-100 to-yellow-100 flex items-center justify-center">
                <span className="text-3xl">{gift.emoji}</span>
              </div>
              <div className="p-3">
                <h4 className="font-semibold text-gray-900 mb-1 text-sm">{gift.name}</h4>
                <p className="text-lg font-bold text-green-600">{gift.price}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
} 