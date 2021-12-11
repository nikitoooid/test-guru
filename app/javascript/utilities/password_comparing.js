document.addEventListener('turbolinks:load', function(){
  var form = document.querySelector('#user_password_confirmation')

  if (form) { form.addEventListener('input', comparePasswords) }
})

function comparePasswords() {
  var pass1 = document.querySelector('#user_password').value
  var pass2 = document.querySelector('#user_password_confirmation').value

  if(!pass2) {
    document.querySelector('#user_password_confirmation').classList.remove('invalid', 'valid')
    return
  }
  
  if (pass1 != pass2) {
    document.querySelector('#user_password_confirmation').classList.add('invalid')
    document.querySelector('#user_password_confirmation').classList.remove('valid')
  } else {
    document.querySelector('#user_password_confirmation').classList.add('valid')
    document.querySelector('#user_password_confirmation').classList.remove('invalid')
  } 
}