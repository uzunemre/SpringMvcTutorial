<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <a class="navbar-brand" href="/e-commerce">
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
                                </span>
                            </span>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row block none-padding-top">
        <div class="col-xs-12">

            <div class="product-list">
                <div class="wrap bg-white">

                    <!-- Header -->
                    <div class="list-header text-uppercase">

                        <div class="check hidden-xs hidden-sm">
                            <div class="checkbox vers-2">
                                <input type="checkbox" id="checkAll">
                                <label for="checkAll">
                                    <i class="icofont icofont-check-alt"></i>
                                </label>
                            </div>
                        </div>

                        <div class="product">
                            Product
                        </div>

                        <div class="price hidden-xs hidden-sm">
                            Price
                        </div>

                        <div class="qnt hidden-xs hidden-sm">
                            Quantity
                        </div>

                        <div class="total hidden-xs hidden-sm">
                            Total
                        </div>

                        <div class="rmv hidden-xs hidden-sm">
                            Remove
                        </div>
                    </div><!-- / Header -->

                    <!-- List body -->

                    <form:form modelAttribute="basketForm" method="post" action="/basket/purchase">
                        <div class="list-body">
                            <c:forEach items="${basketForm.products}" var="product" varStatus="loop">
                                <div class="item">
                                    <div class="check hidden-xs">
                                        <div class="checkbox vers-2">
                                            <input type="checkbox" id="item-check-${loop.index+1}">
                                            <label for="item-check-${loop.index+1}">
                                                <i class="icofont icofont-check-alt"></i>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="product">
                                        <img src="${product.imagePath}" alt="">
                                        <span class="comp-header st-8 text-uppercase">
                                                ${product.name}
                                        </span>
                                    </div>
                                    <div class="price hidden-xs">
                                        <span class="disclam hidden-sm">Sale</span>
                                        <span class="price">
                                            <i class="icofont icofont-cur-dollar"></i>
                                            <span class="prc">
                                                <span>${product.priceIntegerText}</span><small>${product.priceDecimalText}</small>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="qnt">
                                        <span>
                                            <span class="minus">
                                                <i class="icofont icofont-minus"></i>
                                            </span>
                                            <span class="input">
                                                <input type="text" name="products[${loop.index}].quantity"
                                                       value="${product.quantity}">
                                            </span>
                                            <span class="plus">
                                                <i class="icofont icofont-plus"></i>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="total">
                                        <i class="icofont icofont-cur-dollar"></i>
                                        <span>${product.price}</span>
                                    </div>
                                    <div class="rmv text-center">
                                        <button class="remove-btn" onclick="deleteBasket(${product.id})">
                                            <i class="icofont icofont-close-line"></i>
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Footer -->
                        <div class="list-footer bg-blue">

                            <input type="submit" class="btn btn-default btn-material" value="Make a purchase"/>

                        </div>
                        <!-- / Footer -->
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="shared/footer.jsp" %>

</body>

</html>
