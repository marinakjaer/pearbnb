const input = document.getElementById('flat_photos');

if(input) {
  const fileCount = document.getElementById('file-count')
  const label = document.querySelector('.flat-photos')
  label.addEventListener('click', function(event) {
    input.click()
  });

  input.addEventListener('change', function(event){
    fileCount.innerText = input.files.length;
  })
};
