<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="myPrefix" uri="myURI" %>
<%@ taglib prefix="myTags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="mySimpleTagURI" prefix="mySimpleTags" %>

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


<h3>8-cSet</h3>

<%
    Map myMap = new HashMap<>();
    request.setAttribute("myMapAttribute", myMap);
%>
<c:set target="${myMapAttribute}" property="key1" value="value1"></c:set>
<c:out value="${myMapAttribute.key1}"></c:out>

<h3>9-Expression Language Function</h3>
${myPrefix:myfunction(5,10) }

<h3>10-C-Out</h3>

<%
    request.setAttribute("test", "test");
%>

<c:out value="${test}" default="i am default"/>
<br/>
<%="<b>Bold</b> tag" %>

<h3>11-C-If</h3>
<c:set var="result" scope="request" value="70"/>

<c:if test="${result > 50}">
<p>You pass exam ! : <c:out value="${result}"/><p>
    </c:if>
    <c:set var="result2" scope="request" value="40"/>
    <c:if test="${result2 lt 50}">
<p>You failed ! ! : <c:out value="${result2}"/><p>
    </c:if>

    <c:set var="myName" scope="request" value="Emre"/>

    <c:if test="${myName eq 'Emre'}">
<p>Hello(eq) , ${myName}<p>
    </c:if>

    <c:if test="${myName =='Emre'}">
<p>Hello(==) , ${myName}<p>
    </c:if>

<h3>11-ForEach</h3>
<c:forEach var="x" begin="5" end="15" step="5">
    <c:out value="${x}"/>
</c:forEach>

<%
    int[] numbers = {5, 10, 15, 20, 25, 30};
    request.setAttribute("numbersAttribute", numbers);
%>
<c:forEach var="number" items="${numbersAttribute}" varStatus="loopTagStatus">
    index:<c:out value="${loopTagStatus.index}"/>
    <c:out value="${number}"/> <br>
</c:forEach>

<h3>12-Catch</h3>

<c:catch var="catchException">
    <% int x = 10 / 0;%>
</c:catch>

<c:if test="${catchException != null}">
    <p>The exception is : ${catchException} <br/>
        There is an exception: ${catchException.message}</p>
</c:if>

<h3>13-Jstl Functions</h3>
<c:set var="myattribute" value="spring-java"/>

<c:if test="${fn:contains(myattribute, 'java')}">
    <p>Founded! java</p>
</c:if>

<c:if test="${fn:containsIgnoreCase(myattribute, 'JAVA')}">
    <p>Founded! JAVA</p>
</c:if>

<%
    String[] myArray = {"test1", "test2", "test3"};
    request.setAttribute("myArray", myArray);

%>

<c:forEach var="x" items="${fn:split('emre,uzun', ',')}">
    <c:out value="${x}"></c:out>
</c:forEach>


<c:set var="string1" value="This <b>is second String.</b>"/>

<p>With escapeXml() Function:</p>

<p>string (1) : ${fn:escapeXml(string1)}</p>

<p>Without escapeXml() Function:</p>

<p>string (1) : ${string1}</p>

<h3>14-Tag</h3>
<myTags:header/>
<myTags:header2 title="Test Parameter Header"></myTags:header2>
</html>

<h3>15-Simple Tag</h3>
<mySimpleTags:mySimpleTagName/>

<c:set var="name" value="Emre Uzun Test"/>

<mySimpleTags:mySimpleTagName2>
    Hello! ${message}
</mySimpleTags:mySimpleTagName2>

