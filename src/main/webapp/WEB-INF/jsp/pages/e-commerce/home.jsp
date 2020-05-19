<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<%@include file="shared/header.jsp" %>

<body>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                <img src="../../../../../resources/images/main-brand.png" alt="" class="brand">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right info-panel">
                <li class="profile">
                            <span class="wrap">
                                <span class="image bg-white">
                                    <span class="icon">
                                        <i class="icofont icofont-user-alt-4 text-blue"></i>
                                    </span>
                                </span>
                                <span class="info">
                                    <span class="name text-uppercase">Emre Uzun</span>
                                    <a href="/basket">Order</a>
                                </span>
                            </span>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="clearfix">
            <div class="owl-carousel slideshow">
                <c:forEach items="${banners}" var="product">
                    <div class="item">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-md-5 hidden-xs hidden-sm">
                                    <h2 class="header text-uppercase text-blue">${product.name}</h2>
                                    <p>
                                            ${product.description}
                                    </p>
                                </div>
                                <div class="col-xs-10 col-xs-offset-1 col-md-7 col-md-offset-0">
                                    <div class="img">
                                        <img src="${product.imagePath}" alt="">
                                    </div>

                                    <!-- todo product nesnesinde isHota erişim yapılarak değiştirilmeli -->
                                    <c:if test="${product.infoEnum.message =='Hot'}">
                                   <span class="sale-badge bg-red text-uppercase">
                                           Hot!
                                       </span>
                                    </c:if>

                                    <c:if test="${product.infoEnum.message =='New'}">
                                   <span class="sale-badge bg-green text-uppercase">
                                           new
                                       </span>
                                    </c:if>

                                    <span class="price hidden-xs">
                                           <span class="wrap text-red">
                                             $${product.priceIntegerText}<small> ${product.priceDecimalText}</small>-
                                           </span>
                                       </span>
                                    <span class="text-center visible-xs">
                                            <span class="sdw-wrap">
                                                <a href="#" class="sdw-hover btn btn-lg btn-material btn-primary"><i
                                                        class="icon icofont icofont-basket"></i><span
                                                        class="body">${product.priceIntegerText}<small>${product.priceDecimalText}</small></span></a>
                                                <span class="sdw"></span>
                                            </span>
                                       </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="clearfix">
            <div class="substrate-wrap">
                <div class="substrate parallax-block"
                     data-speed-direction=".3"
                     data-default-pos="-600"
                     data-parallax-block="true">
                    <div class="text text-darkness">
                        IN TREND
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container block">
    <div class="row">
        <div class="col-xs-12">
            <div class="block-header text-uppercase">
                <h2 class="header">Features</h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="owl-carousel owl-default features nav-top-left">

                <c:forEach items="${features}" var="product">
                    <div class="shop-item hover-sdw">
                        <div class="wrap">
                            <div class="body">
                                <div class="comp-header st-4 text-uppercase">
                                        ${product.name}
                                    <div class="rate">
                                        <ul class="stars">
                                            <c:forEach var="i" begin="1" end="${product.averageStar}">
                                                <li class="active">
                                                    <i class="icofont icofont-star"></i>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>

                                    <c:if test="${product.infoEnum.message =='New'}">
                                   <span class="sale-badge item-badge text-uppercase bg-green">
                                            New
                                        </span>
                                    </c:if>

                                    <c:if test="${product.infoEnum.message =='Hot'}">
                                      <span class="sale-badge item-badge text-uppercase bg-red">
                                            Hot!
                                        </span>
                                    </c:if>
                                </div>
                                <!-- Image -->
                                <div class="image">
                                    <img class="main" src="${product.imagePath}" alt="">
                                </div>
                                <!-- Caption -->
                                <div class="caption">
                                    <!-- Rate -->
                                    <div class="rate">
                                        <ul class="stars">
                                            <c:forEach var="i" begin="1" end="${product.averageStar}">
                                                <li class="active">
                                                    <i class="icofont icofont-star"></i>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="info">
                                <a class="btn-material btn-price">
                                    <span class="price">
                                            <span class="curr">
                                                $
                                            </span>
                                            <c:if test="${product.campaign}">
                                                   <span class="sale">
                                                <span> ${product.oldPriceIntegerText}<small>${product.oldPriceDecimalText}</small></span>
                                            </span>
                                            </c:if>
                                            <span class="price">
                                                ${product.priceIntegerText}<small>${product.priceDecimalText}</small>
                                            </span>
                                        </span>
                                    <!-- Quantity -->
                                    <span class="qnt-select">
                                            <span class="plus">
                                                <i class="icofont icofont-plus"></i>
                                            </span>
                                            <span class="view-sum">
                                                01
                                            </span>
                                            <span class="minus">
                                                <i class="icofont icofont-minus"></i>
                                            </span>
                                        </span>

                                    <!-- Icon card -->
                                    <span onclick="addToBasket(${product.id})" class="icon-card">
                                            <i class="icofont icofont-cart-alt"></i>
                                        </span>
                                </a>
                                <a class="favorite-link active">
                                    <i class="icofont icofont-star"></i>
                                    to favorite
                                </a>
                                <a class="more-link">More info</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<%@include file="shared/footer.jsp" %>

</body>

</html>
