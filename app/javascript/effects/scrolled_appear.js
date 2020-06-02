import AOS from 'aos';
import 'aos/dist/aos.css';

const scrollAnime = () => {
  console.log("AOS being initialised.");
  AOS.init ({
    // Global settings:
    disable: false
  });
  console.log("AOS done");
};

export { scrollAnime }
