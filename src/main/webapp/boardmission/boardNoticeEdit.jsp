<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
	request.setCharacterEncoding("utf-8");
	String bno = request.getParameter("c");
	%>

	<%
    
  
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, pw);
	
	//접속성공
	//String sql ="select * from board where bno="+bno;
	String sql ="select * from board where bno=?";
	
	//Statement st = conn.createStatement();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bno);
	
	//ResultSet rs = st.executeQuery(sql); //statement형식 select 실행
	ResultSet rs = pstmt.executeQuery();  //pstmt형식 실행
	rs.next();
	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>boardNoticeEdit.jsp</h3>

<form action="boardNoticeEditProc.jsp" method="post">

<table class="twidth">
	<colgroup>
		<col width=15% />
		<col width=35% />
		<col width=15% />
		<col width=35% />
		
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td><%=rs.getString("bno") %></td>
			<th class="left">조회수</th>
			<td><%=rs.getInt("bcnt") %></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td><%=rs.getString("bwriter") %></td>
			<th class="left">작성시간</th>
			<td><%=rs.getDate("bdate") %></td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3" id="bsubj">
				<input type="text" name="bsubj" value="<%=rs.getString("bsubj") %>" />
			</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="bmemo">
				<textarea class="txt" name="bmemo"><%=rs.getString("bmemo") %></textarea>
			</td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">
				첨부
			</td>
		</tr>
	</tbody>
</table>
<div>
	<input type="hidden" name="c" value="<%=rs.getString("bno") %>" />
	<input type="submit" value="수정" />
	<a href="boardNoticeDetail.jsp?c=<%=rs.getString("bno") %>">취소</a>
</div>
</form>

</body>
</html>