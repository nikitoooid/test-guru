import Rails from '@rails/ujs'

document.addEventListener('turbolinks:load', function(){
  var timer = document.querySelector('.passage_timer')
  

  if (timer && timer.dataset.timer > 0) timerHandler(timer)
})

function timerHandler (control) {
  var time_left = control.dataset.timer
  
  var refresh = setTimeout(function timeout(){
    if(time_left < 0) return stopPassing(control)

    refreshTimerData(control, time_left--)
    refresh = setTimeout(timeout, 1000);
  }, 1000);
}

function refreshTimerData (control, seconds_left) {
  var timer = new Date(seconds_left * 1000).toISOString().substr(11, 8)
  control.textContent = timer
}

function stopPassing (control) {
  Rails.ajax({
    type: "POST",
    url: '/test_passages/' + control.dataset.passageid + '/stop_passing'
  })
}
