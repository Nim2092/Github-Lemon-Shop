<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : admin
    Created on : Apr 27, 2023, 12:56:55 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${sessionScope.acc.getFullName()}</h1>
        <button onclick="showproduct()">Product manage</button>
        <a href="#"><button>Category mange</button></a>
        <a href="#"><button>Account manage</button></a>
        <div id="category">
            <h1>Category manager</h1>
            <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${listC}">
                    <tr>
                        <td>${c.getCategoryId()}</td>
                        <td>${c.getCategoryName()}</td>
                        <td><a href="deleteCategory?cid=${c.getCategoryId()}">Delete</a>&nbsp;<a href="#">Update</a></td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>
            <form method="post" action="addCategory">
                <h2>Add category</h2>
                <label>Name: </label><input type="text" name="nameCate">
                <input type="submit" value="Add category" />
            </form>
        </div>
        <div id="product" style="display: none">
            <h1>Product manager</h1>
            <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Image_url</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${listP}">
                    <tr>
                        <td>${p.getProductId()}</td>
                        <td>${p.getProductName()}</td>
                        <td>${p.getPrice()}</td>
                        <td>${p.getDescription()}</td>
                        <td>${p.getImageUrl()}</td>
                        
                        <td><a href="delProduct?cid=${p.getProductId()}">Delete</a>&nbsp;<a href="#">Update</a></td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>
        </div>
        <div id="account" style="display: none" >
            <h1>Account manager</h1>
            <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Fullname</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>DOB</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${listA}">
                    <tr>
                        <td>${a.getAccountId()}</td>
                        <td>${a.getUsername()}</td>
                        <td>${a.getPassword()}</td>
                        <td>${a.getEmail()}</td>
                        <td>${a.getFullName()}</td>
                        <td>${a.getPhoneNumber()}</td>
                        <td>${a.getAddress()}</td>
                        <td>${a.getDateOfBirth()}</td>
                        <c:if test="${a.getRole()==1}">
                          <td>Admin</td>  
                        </c:if>
                          <c:if test="${a.getRole()!=1}">
                          <td>Buyer</td>  
                        </c:if>
                        
                        <td><a href="deleteAc?cid=${c.getCategoryId()}">Delete</a>&nbsp;<a href="#">UpdateRole</a></td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>
        </div>
        <script>
             const productM = document.getElementById("product");
             const categoryM = document.getElementById("category");
             const accountM = document.getElementById("account");
            showproduct(){
                productM.style.display = "block";
                categoryM.style.display = "none";
                accountM.style.display = "none";
            }
        </script>
    </body>
    
</html>
