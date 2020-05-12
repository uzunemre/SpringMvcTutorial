<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Form</title>
</head>
<body>
<section>
    <div class="jumbotron">
        <div class="container">
            <p>Add User</p>
        </div>
    </div>
</section>
<section class="container">
    <!-- watch out modelAttribute ! -->
    <form:form modelAttribute="newUser" class="form-horizontal" method="post">
        <fieldset>
            <div class="form-group">
                <label class="control-label col-lg-2" for="firstName">First Name</label>
                <div class="col-lg-10">
                    <form:input id="firstName" path="firstName" type="text" class="form:input-large"/>
                </div>
                <label class="control-label col-lg-2" for="firstName">Last Name</label>
                <div class="col-lg-10">
                    <form:input id="lastName" path="lastName" type="text" class="form:input-large"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" id="btnAdd" class="btn btn-primary" value="Add"/>
                </div>
            </div>

        </fieldset>
    </form:form>
</section>
</body>
</html>
