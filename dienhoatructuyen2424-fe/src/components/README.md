# Components Structure

## Layout Components

### Header
- **File**: `layout/Header.tsx`
- **Description**: Header component with logo, hotline, and cart button
- **Props**: None
- **Usage**: `<Header />`

### Navigation
- **File**: `layout/Navigation.tsx`
- **Description**: Navigation bar with dropdown menu for product categories using CategoryCard
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
- **Description**: Tet holiday gifts section using ProductCard
- **Props**: None
- **Usage**: `<TetGifts />`

## UI Components

### ProductCard
- **File**: `ui/ProductCard.tsx`
- **Type**: Client Component
- **Description**: Reusable product card component with image support
- **Props**:
  - `id`: string - Product ID
  - `name`: string - Product name
  - `price`: string - Product price
  - `image`: string - Product image path
  - `description?`: string - Optional product description
  - `className?`: string - Optional CSS classes
- **Usage**: `<ProductCard id="SQ0103" name="Product Name" price="1,820,000 ₫" image="/images/products/flower-1.jpg" description="Product description" />`

### CategoryCard
- **File**: `ui/CategoryCard.tsx`
- **Type**: Client Component
- **Description**: Category card component for displaying product categories
- **Props**:
  - `id`: string - Category ID
  - `name`: string - Category name
  - `image`: string - Category image path
  - `description`: string - Category description
  - `className?`: string - Optional CSS classes
- **Usage**: `<CategoryCard id="flowers" name="Hoa Tươi" image="/images/categories/flowers.jpg" description="Các loại hoa tươi" />`

### ImageWithFallback
- **File**: `ui/ImageWithFallback.tsx`
- **Type**: Client Component
- **Description**: Enhanced Image component with fallback handling
- **Props**:
  - `src`: string - Image source
  - `alt`: string - Alt text
  - `fallbackSrc?`: string - Fallback image path (default: '/images/placeholder.jpg')
  - `className?`: string - Optional CSS classes
  - `fill?`: boolean - Whether to fill container
  - `sizes?`: string - Responsive image sizes
  - `width?`: number - Image width
  - `height?`: number - Image height
- **Usage**: `<ImageWithFallback src="/images/product.jpg" alt="Product" fill className="object-cover" />`

## Data Structure

### Products Data
- **File**: `data/products.ts`
- **Description**: Centralized data management for products and categories
- **Exports**:
  - `Product` interface
  - `featuredProducts` array
  - `specialProducts` array
  - `tetGifts` array
  - `categories` array

## Image Structure

### Public Images
- **Path**: `public/images/`
- **Subdirectories**:
  - `products/` - Product images
  - `categories/` - Category images
- **Placeholder**: `placeholder.jpg` - Fallback image for failed loads

## Import Examples

```tsx
// Import individual components
import Header from '../components/layout/Header';
import ProductCard from '../components/ui/ProductCard';
import CategoryCard from '../components/ui/CategoryCard';
import ImageWithFallback from '../components/ui/ImageWithFallback';

// Import from index file
import { Header, Navigation, ProductCard, CategoryCard, ImageWithFallback } from '../components';

// Import data
import { featuredProducts, categories } from '../data/products';

// Import all components
import * as Components from '../components';
```

## Component Reusability

All components are designed to be reusable and modular:

1. **ProductCard**: Can be used in any product listing section with image support
2. **CategoryCard**: Can be used for category displays and navigation
3. **ImageWithFallback**: Reusable image component with error handling
4. **Layout components**: Can be reused across different pages
5. **Section components**: Can be easily modified or extended
6. **Props interface**: All components have proper TypeScript interfaces
7. **Image handling**: Components include fallback for failed image loads

## Styling

All components use Tailwind CSS classes and are fully responsive. The color scheme follows the green theme of the flower shop.

## Image Optimization

- Uses Next.js Image component for optimization
- Responsive image sizing with `sizes` attribute
- Fallback handling for failed image loads
- Proper alt text for accessibility
- Client Components for interactive image handling

## Component Types

### Server Components (Default)
- Header, Footer, HeroSection, FeaturedProducts, SpecialProducts, TetGifts
- Rendered on the server for better performance

### Client Components
- ProductCard, CategoryCard, ImageWithFallback
- Include 'use client' directive for interactive features
- Handle user interactions and state management 