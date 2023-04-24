<%-- 
    Document   : forgotpass
    Created on : Apr 24, 2023, 9:50:12 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="card text-center" style="width: 300px;">
    <div class="card-header h5 text-white bg-primary">Password Reset</div>
    <div class="card-body px-5">
        <p class="card-text py-2">
            Enter your email address and we'll send you an email with instructions to reset your password.
        </p>
        <div class="form-outline">
            <input type="email" id="typeEmail" class="form-control my-3" />
            <label class="form-label" for="typeEmail">Email input</label>
        </div>
        <a href="#" class="btn btn-primary w-100">Reset password</a>
        <div class="d-flex justify-content-between mt-4">
            <a class="" href="#">Login</a>
            <a class="" href="#">Register</a>
        </div>
    </div>
</div>
