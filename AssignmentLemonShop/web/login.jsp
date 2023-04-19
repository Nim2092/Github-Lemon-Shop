<%-- 
    Document   : login
    Created on : Apr 19, 2023, 11:59:03 PM
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
        <form name="f1" action="login" method="get">
            Enter username: <input type="text"  name="user" 
                           placeholder="the username" value="" required />
            <br/>
            Enter password: <input type="password" name="pass" 
                      placeholder="the password" value="" required/>
            <br/>
            <input type="submit" value="Login"/>
        </form>
        
        <%
        if(request.getAttribute("name") != null){
        String name = (String)request.getAttribute("name");
        
        %>
        <h2>xin chao <%=name%></h2>
        <%
        
            }
        
        %>
        
        <%
        if(request.getAttribute("tb") != null){
            String tb = (String)request.getAttribute("tb");
            %>
            <h2><%=tb%></h2>
            <%    
            }
        
        %>
    </body>
</html>
