<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
<h3>jstl1_token</h3>

<%-- <c:forTokens items="이름1,이름1,이름1,이름1,이름1" delims=",">
	<br />반복
</c:forTokens> --%>

<%-- <c:forTokens items="이름1,이름2,이름3,이름4,이름5" delims="," var="name"> <!-- items에서 요소를 구분자 ,로 해서 var=name을 통해 변수 전달 -->
	${name } <br />
</c:forTokens> --%>

<%-- <c:forTokens items="이름1,이름2,이름3,이름4,이름5" delims="," var="name" varStatus="st"> 
	index : ${st.index } <br />
	current : ${st.current } <br />
	count : ${st.count } <br />
	first : ${st.first } <br />
	last : ${st.last } <br />
	begin : ${st.begin } <br />
	end : ${st.end } <br />
	<hr />
	
</c:forTokens> --%>
	<!-- st를 통해 각각의 값에 맞는 내용 출력 first는 첫번째 index만 true 나머지 false-->
	
<%-- <c:forTokens items="이름1,이름2,이름3,이름4,이름5" delims="," var="name" 
begin="1" end="3" varStatus="st"> 
	index : ${st.index } <br />
	current : ${st.current } <br />
	count : ${st.count } <br />
	first : ${st.first } <br />
	last : ${st.last } <br />
	begin : ${st.begin } <br />
	end : ${st.end } <br />
	<hr />
	
</c:forTokens> --%>

<c:forTokens items="이름1/20,이름2/30,이름3/40,이름4/50,이름5/60" delims=",/" var="name" 
step="2" varStatus="st"> 
	index : ${st.index } <br />
	current : ${st.current } <br />
	count : ${st.count } <br />
	first : ${st.first } <br />
	last : ${st.last } <br />
	begin : ${st.begin } <br />
	end : ${st.end } <br />
	step : ${st.step } <br />
	<hr />
	
</c:forTokens>
<!-- step="2"는 index값이 2씩 건너뜀 delimeter는 구분자를 두개 다 사용하겠다는 의미-->
</body>
</html>