<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f2f2f2;
    }

    .login-form {
      margin: 50px auto;
      max-width: 400px;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    h1 {
      font-size: 28px;
      margin: 0 0 20px 0;
      text-align: center;
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input[type="text"],
    input[type="password"] {
      padding: 10px;
      border-radius: 5px;
      border: 1px solid black;
      width: 100%;
      margin-bottom: 20px;
    }

    .show-pass-btn {
      background-color: #ccc;
      padding: 5px;
      border: none;
      border-radius: 3px;
      margin-left: 5px;
      cursor: pointer;
    }

    .submit-btn {
      background-color: #4CAF50;
      color: #fff;
      border: none;
      padding: 10px;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
      margin-top: 20px;
    }

    .forgot-pass-link {
      display: block;
      text-align: right;
      margin-bottom: 10px;
    }

    .signup-link {
      text-align: center;
    }
    .password-field {
  display: flex;
  align-items: center;
}

.password-field input {
  flex: 1;
  margin-right: 10px;
}

.show-password {
  cursor: pointer;
}
  </style>
</head>
<body>
  <form action="login" method="post" class="login-form">
    <h1>Login Page</h1>
    <label>Username:</label>
    <input type="text" name="username" required>
    <label>Password:</label>
    <div class="password-field">
      <input type="password" name="password" id="password" required>
      <span class="show-password" onclick="togglePasswordVisibility()"> &#128065; </span>
    </div>
    <a href="resetpass.html" class="forgot-pass-link">Forgot Password?</a>
    <input type="submit" value="Login" class="submit-btn">
    <p class="signup-link">Don't have an account? <a href="signup.html">Sign up here</a></p>
  </form>

  <script>
    function togglePasswordVisibility() {
      const passwordInput = document.getElementById("password");
      if (passwordInput.type === "password") {
        passwordInput.type = "text";
        
      } else {
        passwordInput.type = "password";
        
      }
    }
  </script>
</body>
</html>



