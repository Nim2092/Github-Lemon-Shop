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
        <script>
            function doDeleteCate(id) {
                if (confirm("Do you want to delete this category?")) {
                    window.location = "deleteCategory?cid=" + id;
                }
            }
            function doDeletePro(id) {
                if (confirm("Do you want to delete this product?")) {
                    window.location = "deleteProduct?pid=" + id;
                }
            }


   
        </script>
        <title>Admin Page</title>
        <jsp:useBean id="product" scope="page" class="DAL.ProductDAO" />
        <jsp:useBean id="category" scope="page" class="DAL.CategoryDAO" />
    </head>
    <body>

        <button onclick="showproduct()">Product manage</button>
        <a href="#"><button>Category mange</button></a>
        <a href="#"><button>Account manage</button></a>
        <div id="category">
            <h3>Category manager</h3>
            <button> Add category</button>
            <table border="1">
                <thead>
                    <tr>
                        <th >ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${listC}">
                        <tr>
                            <td>${c.getCategoryId()}</td>
                            <td>${c.getCategoryName()}</td>
                            <td><input type="button" onclick="doDeleteCate('${c.getCategoryId()}')" value="delete" />
                                &nbsp;<input type="button"  value="update" /></td>
                        </tr>
                    </c:forEach>


                </tbody>
            </table>
            <div>
                <form method="post" action="addCategory">

                    <label>Name: </label><input type="text" name="nameCate">
                    <input type="submit" value="Add category" />
                </form>
            </div>
            <div>
                <h2>Update category</h2><c:forEach var="c" items="${listC}">
                    <div>
                        <form action="updateCategory">
                            <input hidden type="text" value="${c.getCategoryId()}" name="idCate">
                            <input type="text" value="${c.getCategoryName()}" name="nameCate">
                            <input type="submit" value="Update category" />
                        </form>
                    </div>


                </c:forEach>
            </div>



        </div>
        <div id="product" >
            <h1>Product manager</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Category</th>
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
                            <td>${category.getCategoryById(product.getProductById(p.getProductId()).getCategoryId()).getCategoryName()}</td>
                            <td>${p.getImageUrl()}</td>

                            <td><input type="button" onclick="doDeletePro('${p.getProductId()}')" value="delete" />
                                &nbsp;<input type="button"  value="update" />
                                </td>
                        </tr>
                    </c:forEach>


                </tbody>
            </table>
            <div>
                <h2>Add Product</h2>
                <form method="post" action="addProduct">
                    <label>Name Product</label><input type="text" name="nameProduct" value="" />
                    <label>Price</label><input type="text" name="priceProduct" value="" />
                    <label>Description</label><input type="text" name="desProduct" value="" />
                    <label>Category</label><select name="cidProduct">

                        <c:forEach var="c" items="${listC}">
                            <option value="${c.getCategoryId()}" >${c.getCategoryName()}</option>
                        </c:forEach>

                    </select>
                    <label>URL Image</label> <input type="text" name="urlProduct" value="" />
                    <input type="submit" value="Add Product" />
                </form>
            </div>
            <div>
                <h2>Update Product</h2>
                <c:forEach var="p" items="${listP}">
                    <div>
                        <form method="post" action="updateProduct">
                            <input hidden type="text" name="idProduct" value="${p.getProductId()}" />
                            <label>Name Product</label><input type="text" name="nameProduct" value="${p.getProductName()}" />
                            <label>Price</label><input type="text" name="priceProduct" value="${p.getPrice()}" />
                            <label>Description</label><input type="text" name="desProduct" value="${p.getDescription()}" />
                            <label>Category</label><select name="cidProduct">

                                <c:forEach var="c" items="${listC}">
                                    <option <c:if test="${c.getCategoryId()==p.getCategoryId()}">selected</c:if> value="${c.getCategoryId()}">${c.getCategoryName()}</option>
                                </c:forEach>

                            </select>
                            <label>URL Image</label> <input type="text" name="urlProduct" value="${p.getImageUrl()}" />
                            <input type="submit" value="Update Product" />
                        </form>
                    </div>
                </c:forEach>

            </div>

        </div>
        <div id="account"  >
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
                            <td><input type="password"  value="${a.getPassword()}" />
                                </td>
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
