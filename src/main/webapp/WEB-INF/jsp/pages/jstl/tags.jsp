<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Jstl</title>
</head>
<body>
<h3>
    1-ForEach
</h3>
<c:forEach var="i" begin="1" end="80">
    <c:out value="i:${i}"/></c:forEach>
</body>
<h3>2-choose,when,otherwise</h3>
<c:set var="sonuc" value="${100}"/>
<c:choose>
    <c:when test="${sonuc <= 69}">
        Bad
    </c:when>
    <c:when test="${sonuc <=79}">
        Good
    </c:when>
    <c:when test="${sonuc <=89}">
        Very Good
    </c:when>
    <c:otherwise>
        Excellent
    </c:otherwise>
</c:choose>
<h3>3-forTokens</h3>
<c:forTokens var="liste" items="elma,agac&,kalem,silgi" delims=",">
    <c:out value="${liste}"/>
</c:forTokens>
<h3>4-fmt parseNumber</h3>
<fmt:parseNumber var="sayi" integerOnly="true" value="123123,256"/>
<c:out value="${sayi}"/>
<h3>5-formatDate</h3>
<c:set var="bugun" value="<%=new java.util.Date()%>"/>

<p>Time: <fmt:formatDate type="time" value="${bugun}"/></p>
<p>Date <fmt:formatDate type="date" value="${bugun}"/></p>
<p>DateTime <fmt:formatDate type="both" value="${bugun}"/></p>
<p>DateTime (Short):
    <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${bugun}"/>
</p>
<p>DateTime (Medium) :
    <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${bugun}"/>
</p>
<p>DateTime (Long):
    <fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${bugun}"/>
</p>
<p>Date (yyyy-MM-dd):
    <fmt:formatDate pattern="yyyy-MM-dd" value="${bugun}"/>
</p>
<p>Date (MM-dd-yyy):
    <fmt:formatDate pattern="MM-dd-yyyy" value="${bugun}"/>
</p>
<p>Date (dd-MM-yyyy):
    <fmt:formatDate pattern="dd-MM-yyyy" value="${bugun}"/>
</p>

<h3>6-contains</h3>
<p>Sentence: Emre Uzun</p>
<c:set var="sentence" value="Emre Uzun"/>
<c:set var="word" value="Emre"/>
<c:if test="${fn:contains(sentence, word)}">
    <c:out value="There is a word(Emre) in sentence"/>
</c:if>
<h3>7-uppercase</h3>
<c:set var="name" value="emre uzun"></c:set>
<c:out value="${fn:toUpperCase(name)}"></c:out>

</html>
