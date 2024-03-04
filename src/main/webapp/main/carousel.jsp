<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-white rounded" style="padding-top: 1px; padding-bottom: 1px;">
  <a class="navbar-brand" href="/index.jsp" style="margin-left: 80px;"></a>
  <div class="collapse navbar-collapse" id="navbars">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/product/productList">
          <span class="text-truncate"><b>전체상품</b></span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/product/productBest">
          <span class="text-truncate"><b>베스트</b></span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/product/productNew">
          <span class="text-truncate"><b>신상품</b></span>
        </a>
      </li>
    </ul> 
    <style>
      .custom-search-input {
        color: rgb(156, 156, 156);
        font-size: 12px;
      }
    </style>
  </div>
</nav>
  
    <!-- ============================= [[ Carousel section]] ============================= -->
    <div class="container">
      <div
        id="carouselExampleCaptions"
        class="carousel slide"
        data-bs-ride="carousel"
      >
        <div class="carousel-indicators">
          <button
            type="button"
            data-bs-target="#carouselExampleCaptions"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Slide 1"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleCaptions"
            data-bs-slide-to="1"
            aria-label="Slide 2"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleCaptions"
            data-bs-slide-to="2"
            aria-label="Slide 3"
          ></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="/image/캐러샐1.jpg"
              class="d-block w-100"
              alt="one"
            />
            <div class="carousel-caption d-none d-md-block">
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="/image/캐러샐2.jpg"
              class="d-block w-100"
              alt="two"
            />
            <div class="carousel-caption d-none d-md-block">
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="/image/캐러샐3.jpg"
              class="d-block w-100"
              alt="three"
            />
            <div class="carousel-caption d-none d-md-block">
            </div>
          </div>
        </div>
        
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleCaptions"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleCaptions"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <style>
        .carousel-item img{
          height: 400px;
        }
      </style>
    </div>
    <!-- ============================= [[ Carousel section]] ============================= -->