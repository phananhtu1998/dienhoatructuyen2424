import {
  Header,
  Navigation,
  HeroSection,
  FeaturedProducts,
  SpecialProducts,
  TetGifts,
  Footer
} from '../components';

export default function Home() {
  return (
    <div className="min-h-screen bg-white">
      <Header />
      <Navigation />
      <HeroSection />
      <FeaturedProducts />
      <SpecialProducts />
      <TetGifts />
      <Footer />
    </div>
  );
}
