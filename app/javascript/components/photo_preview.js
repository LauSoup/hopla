const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  const photosContainer = document.getElementById('photo-preview');
  if (input.files && input.files[0]) {
    photosContainer.innerHTML = "";
    Array.from(input.files).forEach((file) => {
      const reader = new FileReader();
      reader.onload = (event) => {
        const img = document.createElement("img");
        img.src = event.currentTarget.result;
        img.style.width = "300px";
        photosContainer.appendChild(img);
      }
      reader.readAsDataURL(file);
    })
  }
}

export { previewImageOnFileSelect };
