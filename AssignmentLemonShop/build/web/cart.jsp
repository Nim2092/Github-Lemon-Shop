<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap 5 Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:useBean id="product" scope="page" class="DAL.ProductDAO" />
        <jsp:useBean id="category" scope="page" class="DAL.CategoryDAO" />
    </head>
    <body>
        <style>
            @media (min-width: 1025px) {
                .h-custom {
                    height: 100vh !important;
                }
            }

            .card-registration .select-input.form-control[readonly]:not([disabled]) {
                font-size: 1rem;
                line-height: 2.15;
                padding-left: .75em;
                padding-right: .75em;
            }

            .card-registration .select-arrow {
                top: 13px;
            }

            .bg-grey {
                background-color: #eae8e8;
            }

            @media (min-width: 992px) {
                .card-registration-2 .bg-grey {
                    border-top-right-radius: 16px;
                    border-bottom-right-radius: 16px;
                }
            }

            @media (max-width: 991px) {
                .card-registration-2 .bg-grey {
                    border-bottom-left-radius: 16px;
                    border-bottom-right-radius: 16px;
                }
            }</style>
        <section class="h-100 h-custom" style="background-color: #d2c9ff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <form action="order" method="post">
                                    <input hidden type="text" value="${aid}" name="accountid" >
                                    <div class="row g-0">
                                        <div class="col-lg-8">
                                            <div class="p-5">
                                                <div class="d-flex justify-content-between align-items-center mb-5">
                                                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                    <h6 class="mb-0 text-muted"> ${count1} items</h6>
                                                </div>

                                                <c:forEach var="p" items="${list}">
                                                    <hr class="my-4">
                                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                                            <img
                                                                src="${product.getProductById(p.getProductId()).getImageUrl()}"
                                                                class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                        </div>
                                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                                            <input hidden type="text" value="${p.getProductId()}" name="${p.getProductId()}" >
                                                            <h6 class="text-muted">${category.getCategoryById(product.getProductById(p.getProductId()).getCategoryId()).getCategoryName()}</h6>
                                                            <h6 class="text-black mb-0">${product.getProductById(p.getProductId()).getProductName()}</h6>
                                                        </div>
                                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                            <button class="btn btn-link px-2"
                                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                <i class="fas fa-minus"></i>
                                                            </button>

                                                            <input id="form1" min="0" name="quantity${p.getProductId()}" value="1" type="number"
                                                                   class="form-control form-control-sm" />

                                                            <button class="btn btn-link px-2"
                                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                <i class="fas fa-plus"></i>
                                                            </button>
                                                        </div>
                                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                            <h6 class="mb-0">$ ${product.getProductById(p.getProductId()).getPrice1()}</h6>
                                                        </div>
                                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                            <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                                        </div>
                                                    </div>

                                                </c:forEach>


                                                <hr class="my-4">

                                                <div class="pt-5">
                                                    <h6 class="mb-0"><a href="home" class="text-body"><i
                                                                class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 bg-grey">
                                            <div class="p-5">
                                                <h3 class="fw-bold mb-5 mt-2 pt-1">Submit Order</h3>
                                                <hr class="my-4">

                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="text-uppercase"></h5>
                                                    <h5></h5>
                                                </div>


                                                <div class="d-flex justify-content-between mb-5">
                                                    <h5 class="text-uppercase"></h5>
                                                    <h5></h5>
                                                </div>

                                                <button type="submit" class="btn btn-dark btn-block btn-lg"
                                                        data-mdb-ripple-color="dark">Submit</button>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </body>
</html>
