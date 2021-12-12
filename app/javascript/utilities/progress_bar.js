document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress')

  if (progressBar) {
    var progress = progressBar.dataset.progress

    progressBar.children[0].style.width = progress + "%"
  }
})