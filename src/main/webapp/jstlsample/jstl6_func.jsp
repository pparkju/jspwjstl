<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%
	request.setCharacterEncoding("utf-8");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jstl6_func</h3>
<h4>split </h4>
<c:set var="str1" value="Java|Android|Spring|Jsp|Servlet"></c:set>
<c:set var="splitStr" value="${fn:split(str1,'|') }"></c:set>

<ul>
	<c:forEach var="str" items="${splitStr }">
		<li>${str }</li>
	</c:forEach>
</ul>
<!-- vertical bar가 있는 요소를 하나하나 잘라서 넣어줌 -->

<br />
<h4>subString</h4>
<c:set var="str1" value="Hello, world!" />
<c:set var="subStr1" value="${fn:substring(str1,0,5) }"></c:set>
<c:set var="subStr2" value="${fn:substring(str1,7,12) }"></c:set>
<c:out value="subStr1 - ${subStr1 }"></c:out> <br />
<br />
<c:out value="subStr2 - ${subStr2 }"></c:out> <br />
<br />

<c:set var="str2" value="This is test string." />
 
    <h3>substringAfter 사용 예제</h3>
    <c:set var="subStr1" value="${fn:substringAfter(str2, 'test') }" />
    <c:set var="subStr2" value="${fn:substringAfter(str2, 'This') }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />

    <h3>substringBefore 사용 예제</h3>
    <c:set var="subStr1" value="${fn:substringBefore(str2, 'test') }" />
    <c:set var="subStr2" value="${fn:substringBefore(str2, 'This') }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />

<!--  -->
</body>
</html>