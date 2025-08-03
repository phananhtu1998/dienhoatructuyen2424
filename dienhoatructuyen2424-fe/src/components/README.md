# Components Structure

## Layout Components

### Header
- **File**: `layout/Header.tsx`
- **Description**: Header component with logo, hotline, and cart button
- **Props**: None
- **Usage**: `<Header />`

### Navigation
- **File**: `layout/Navigation.tsx`
- **Description**: Navigation bar with dropdown menu for product categories
- **Props**: None
- **Usage**: `<Navigation />`

### Footer
- **File**: `layout/Footer.tsx`
- **Description**: Footer with contact info, store system, categories and social links
- **Props**: None
- **Usage**: `<Footer />`

## Section Components

### HeroSection
- **File**: `sections/HeroSection.tsx`
- **Description**: Hero section with title, description and product tags
- **Props**: None
- **Usage**: `<HeroSection />`

### FeaturedProducts
- **File**: `sections/FeaturedProducts.tsx`
- **Description**: Featured products section using ProductCard components
- **Props**: None
- **Usage**: `<FeaturedProducts />`

### SpecialProducts
- **File**: `sections/SpecialProducts.tsx`
- **Description**: Special products section with different background
- **Props**: None
- **Usage**: `<SpecialProducts />`

### TetGifts
- **File**: `sections/TetGifts.tsx`
- **Description**: Tet holiday gifts section
- **Props**: None
- **Usage**: `<TetGifts />`

## UI Components

### ProductCard
- **File**: `ui/ProductCard.tsx`
- **Description**: Reusable product card component
- **Props**:
  - `id`: string - Product ID
  - `name`: string - Product name
  - `price`: string - Product price
  - `emoji`: string - Product emoji
  - `gradientFrom`: string - Tailwind gradient from class
  - `gradientTo`: string - Tailwind gradient to class
- **Usage**: `<ProductCard id="SQ0103" name="Product Name" price="1,820,000 ₫" emoji="🌹" gradientFrom="pink-100" gradientTo="red-100" />`

## Import Examples

```tsx
// Import individual components
import Header from '../components/layout/Header';
import ProductCard from '../components/ui/ProductCard';

// Import from index file
import { Header, Navigation, ProductCard } from '../components';

// Import all components
import * as Components from '../components';
```

## Component Reusability

All components are designed to be reusable and modular:

1. **ProductCard**: Can be used in any product listing section
2. **Layout components**: Can be reused across different pages
3. **Section components**: Can be easily modified or extended
4. **Props interface**: All components have proper TypeScript interfaces

## Styling

All components use Tailwind CSS classes and are fully responsive. The color scheme follows the green theme of the flower shop. 