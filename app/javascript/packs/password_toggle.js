document.addEventListener('turbolinks:load', () => {
  const passwordField = document.getElementById('inputPassword');
  const toggleButton = document.querySelector('.toggle-password');

  if (passwordField && toggleButton) {
    toggleButton.addEventListener('click', () => {
      const fieldType = passwordField.getAttribute('type');
      const newFieldType = fieldType === 'password' ? 'text' : 'password';
      passwordField.setAttribute('type', newFieldType);
      toggleButton.querySelector('i').classList.toggle('fa-eye');
      toggleButton.querySelector('i').classList.toggle('fa-eye-slash');
    });
  }
});