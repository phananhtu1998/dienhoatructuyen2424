export interface Product {
  id: string;
  name: string;
  price: string;
  image: string;
  category: string;
  description?: string;
}

export const featuredProducts: Product[] = [
  {
    id: 'SQ0103',
    name: 'SQ0103',
    price: '1,820,000 ₫',
    image: '/images/products/flower-1.jpg',
    category: 'flowers',
    description: 'Bó hoa hồng đỏ sang trọng'
  },
  {
    id: 'SQ742',
    name: 'SQ742',
    price: '2,300,000 ₫',
    image: '/images/products/flower-2.jpg',
    category: 'flowers',
    description: 'Bó hoa hướng dương tươi thắm'
  },
  {
    id: 'SQ0098',
    name: 'SQ0098',
    price: '3,700,000 ₫',
    image: '/images/products/flower-3.jpg',
    category: 'flowers',
    description: 'Bó hoa cúc đa sắc'
  },
  {
    id: 'SQ825',
    name: 'SQ825',
    price: '870,000 ₫',
    image: '/images/products/flower-4.jpg',
    category: 'flowers',
    description: 'Bó hoa hồng phấn nhẹ nhàng'
  }
];

export const specialProducts: Product[] = [
  {
    id: 'FR38',
    name: 'Giỏ trái cây – FR38',
    price: '870,000 ₫',
    image: '/images/products/fruit-basket-1.jpg',
    category: 'fruit-baskets',
    description: 'Giỏ trái cây tươi ngon'
  },
  {
    id: 'Cake17',
    name: 'Bánh kem – Cake 17',
    price: '520,000 ₫',
    image: '/images/products/cake-1.jpg',
    category: 'cakes',
    description: 'Bánh kem sinh nhật đẹp mắt'
  },
  {
    id: 'Cake01',
    name: 'Bánh kem – Cake 01',
    price: '480,000 ₫',
    image: '/images/products/cake-2.jpg',
    category: 'cakes',
    description: 'Bánh kem chocolate thơm ngon'
  },
  {
    id: 'FR28',
    name: 'Giỏ trái cây – FR28',
    price: '1,700,000 ₫',
    image: '/images/products/fruit-basket-2.jpg',
    category: 'fruit-baskets',
    description: 'Giỏ trái cây cao cấp'
  }
];

export const tetGifts: Product[] = [
  {
    id: 'QT001',
    name: 'Giỏ quà – QT001',
    price: '1,200,000 ₫',
    image: '/images/products/tet-gift-1.jpg',
    category: 'tet-gifts',
    description: 'Giỏ quà Tết truyền thống'
  },
  {
    id: 'QT002',
    name: 'Giỏ quà – QT002',
    price: '1,850,000 ₫',
    image: '/images/products/tet-gift-2.jpg',
    category: 'tet-gifts',
    description: 'Giỏ quà Tết cao cấp'
  },
  {
    id: 'QT003',
    name: 'Giỏ quà – QT003',
    price: '3,600,000 ₫',
    image: '/images/products/tet-gift-3.jpg',
    category: 'tet-gifts',
    description: 'Giỏ quà Tết sang trọng'
  },
  {
    id: 'QT004',
    name: 'Giỏ quà – QT004',
    price: '870,000 ₫',
    image: '/images/products/tet-gift-4.jpg',
    category: 'tet-gifts',
    description: 'Giỏ quà Tết tiết kiệm'
  },
  {
    id: 'QT005',
    name: 'Giỏ quà – QT005',
    price: '900,000 ₫',
    image: '/images/products/tet-gift-5.jpg',
    category: 'tet-gifts',
    description: 'Giỏ quà Tết đẹp mắt'
  },
  {
    id: 'QT006',
    name: 'Giỏ quà – QT006',
    price: '2,300,000 ₫',
    image: '/images/products/tet-gift-6.jpg',
    category: 'tet-gifts',
    description: 'Giỏ quà Tết cao cấp'
  }
];

export const categories = [
  {
    id: 'flower-stands',
    name: 'Kệ Hoa Khai Trương',
    image: '/images/categories/flower-stands.jpg',
    description: 'Kệ hoa khai trương đẹp mắt'
  },
  {
    id: 'flower-baskets',
    name: 'Giỏ Hoa Khai Trương, Sinh Nhật',
    image: '/images/categories/flower-baskets.jpg',
    description: 'Giỏ hoa cho mọi dịp'
  },
  {
    id: 'condolence-stands',
    name: 'Kệ Hoa Chia Buồn',
    image: '/images/categories/condolence-stands.jpg',
    description: 'Kệ hoa chia buồn trang trọng'
  },
  {
    id: 'condolence-baskets',
    name: 'Giỏ Hoa Chia Buồn',
    image: '/images/categories/condolence-baskets.jpg',
    description: 'Giỏ hoa chia buồn'
  },
  {
    id: 'birthday-bouquets',
    name: 'Bó Hoa Sinh Nhật, Tình Yêu',
    image: '/images/categories/birthday-bouquets.jpg',
    description: 'Bó hoa sinh nhật và tình yêu'
  },
  {
    id: 'orchids',
    name: 'Lan Hồ Điệp',
    image: '/images/categories/orchids.jpg',
    description: 'Lan hồ điệp cao cấp'
  },
  {
    id: 'fruit-baskets',
    name: 'Giỏ Trái Cây',
    image: '/images/categories/fruit-baskets.jpg',
    description: 'Giỏ trái cây tươi ngon'
  },
  {
    id: 'office-plants',
    name: 'Cây Xanh Văn Phòng',
    image: '/images/categories/office-plants.jpg',
    description: 'Cây xanh văn phòng'
  },
  {
    id: 'cakes',
    name: 'Bánh Kem',
    image: '/images/categories/cakes.jpg',
    description: 'Bánh kem đẹp mắt'
  },
  {
    id: 'graduation-flowers',
    name: 'Hoa Mừng Tốt Nghiệp',
    image: '/images/categories/graduation-flowers.jpg',
    description: 'Hoa mừng tốt nghiệp'
  },
  {
    id: 'wedding-flowers',
    name: 'Hoa Cưới',
    image: '/images/categories/wedding-flowers.jpg',
    description: 'Hoa cưới lãng mạn'
  },
  {
    id: 'tet-gifts',
    name: 'Giỏ Quà Tết',
    image: '/images/categories/tet-gifts.jpg',
    description: 'Giỏ quà Tết truyền thống'
  }
]; 