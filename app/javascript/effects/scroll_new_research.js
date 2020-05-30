const scrollNewResearch = () => {
  const newResearchButton = document.querySelector(".back");
  if (newResearchButton) {
    window.addEventListener('scroll', function() {
      console.log("scrolled")
      console.log( document.body.scrollTop )
    });
  };
};

export { scrollNewResearch }
