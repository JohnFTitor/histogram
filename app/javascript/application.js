// Entry point for the build script in your package.json
import "chartkick/chart.js"

fileField = document.querySelector('#file');
fileSelected = document.querySelector('#file-selected');

fileField.addEventListener('change', (e) => {
  if (e.target.files[0]) {
    fileSelected.textContent = `Selected file: ${e.target.files[0].name}`;
  } else {
    fileSelected.textContent = "No file has been uploaded"
  }
});
