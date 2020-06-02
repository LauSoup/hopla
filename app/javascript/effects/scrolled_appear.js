import AOS from 'aos';
import 'aos/dist/aos.css';

const scrollAnime = () => {
  AOS.init ({
    // Global settings:
    disable: false
  });
};

export { scrollAnime }
