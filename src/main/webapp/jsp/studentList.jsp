<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentList</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top:140px; height:100%; width:100%; background-color: lightgray; ">
<h2 style="text-align: center;">학생정보현황</h2>

<form action="action.jsp" method="post" name="frm"
		style="display: flex; text-align: center; align-content: center; justify-content: center;">
<table border="1">
<tr>
<td>학번</td>
<td>이름</td>
<td>주민번호</td>
<td>학과명</td>
<td>성별</td>
<td>전화번호</td>
<td>이메일</td>
</tr>

<%
Connection conn = null;
PreparedStatement pstmt = null;
String gender = "";

try{
	conn = OracleUtil.getConnection();
	String sql = "select stuid, sname, substr(jumin,1,7)||'-'||substr(jumin,7,13) jumin, dept_name, substr(jumin,7,1) gender, phone, email "+
				"from tbl_student_202210";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		gender = rs.getString(5);
		switch(gender){
		case "3":
			gender = "남자";
			break;
		case "4":
			gender = "여자";
			break;
		}
		
		%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=gender %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>

</tr>
		
		
		
		<%
			
		
		
	}

	
	
}catch(Exception e){
	e.printStackTrace();
}


%>




</table>
</form>


</section>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>