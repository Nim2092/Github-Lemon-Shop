<%-- 
    Document   : infomationproduct
    Created on : Apr 24, 2023, 9:48:46 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap 5 Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">
        <div class="card" style="border-radius: 15px;">
          <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
            data-mdb-ripple-color="light">
            <img src="${product.getImageUrl()}"
              style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid"
              alt="Laptop" />
            <a href="#!">
              <div class="mask"></div>
            </a>
          </div>
          <div class="card-body pb-0">
            <div class="d-flex justify-content-between">
              <div>
                <p><a style="text-decoration: none" href="#!" class="text-dark">${product.getProductName()}</a></p>
                <p class="small text-muted"> ${category.getCategoryName()}</p>
              </div>
              <div>
                <div class="d-flex flex-row justify-content-end mt-1 mb-4 text-danger">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                </div>
                <p class="small text-muted">Rated 4.0/5</p>
              </div>
            </div>
          </div>
          <hr class="my-0" />
          <div class="card-body pb-0">
            <div class="d-flex justify-content-between">
                <p>$<a  style="text-decoration: none" href="#!" class="text-dark">${product.getPrice1()}</a></p>
              
            </div>
            <p class="small text-muted">${product.getDescription()}</p>
          </div>
          <hr class="my-0" />
          <div class="card-body">
            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
              <a href="home" class="text-dark fw-bold">Cancel</a>
              <button type="button" class="btn btn-primary">Buy now</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>
