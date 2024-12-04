/*document.getElementById('signupForm').addEventListener('submit', function(e) {
   // e.preventDefault();
    
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var passwordError = document.getElementById('passwordError');
    
    if (password !== confirmPassword) {
        passwordError.style.display = 'block';
    } else {
        passwordError.style.display = 'none';
        
    }
});*/

document.getElementById('confirmPassword').addEventListener('input', function() {
    var password = document.getElementById('password').value;
    var confirmPassword = this.value;
    var passwordError = document.getElementById('passwordError');
    
    if (password !== confirmPassword) {
        passwordError.style.display = 'block';
    } else {
        passwordError.style.display = 'none';
    }
});

