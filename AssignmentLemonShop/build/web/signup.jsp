<%-- 
    Document   : signup
    Created on : Apr 23, 2023, 3:29:17 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <link rel="icon" href="https://img.freepik.com/premium-vector/lemon-logo-symbol-idea-graphic-design_193512-161.jpg">
  <style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 500px;
  margin: 50px auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

h1 {
  font-size: 28px;
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="email"] {
  padding: 10px;
  border-radius: 5px;
  border: 1px solid black;
  margin-bottom: 10px;
  width: 100%;
}


button[type="submit"] {
  padding: 10px;
  background-color: #4CAF50;
  border: none;
  color: white;
  border-radius: 5px;
  cursor: pointer;
}

button[type="submit"]:hover {
  background-color: #3e8e41;
}

.message {
  margin-top: 20px;
  font-size: 14px;
  color: red;
}

  </style>
  <link rel="icon" href="https://png.pngtree.com/element_our/20190529/ourlarge/pngtree-cartoon-lemon-png-download-image_1191053.jpg">
</head>
<body>
  <div class="container">
    <form action="signup" method="post" id="signup-form">
      <h1>Sign Up</h1>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
      <label for="repassword">Confirm Password:</label>
      <input type="password"  id="repassword" name="repassword" required>
      <label for="fullname">Full Name:</label>
      <input type="text" id="fullname" name="fullname" required>
      <label for="dob">Date of Birth:</label>
      <input type="date" id="dob" name="dob" required>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
      
      <button onclick ="checkPass()" type="submit">Sign Up</button><span>${message}</span>
      <p class="signup-link">Have an account? <a href="login.jsp">Login here</a></p>
      <p id ="message"class="message"></p>
    </form>
  </div>
  <script>
function checkPass(){
    let password= document.getElementById("password").value;
      let repassword= document.getElementById("repassword").value;
      console.log(password,repassword);
        let password= document.getElementById("message").value;
}
</script>
</body>
</html>

