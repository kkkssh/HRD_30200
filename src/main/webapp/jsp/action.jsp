<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;
String sid = request.getParameter("sid");
String subcode = request.getParameter("subcode");
String midscore = request.getParameter("midscore");
String finalscore = request.getParameter("finalscore");
String attend = request.getParameter("attend");
String report = request.getParameter("report");
String etc = request.getParameter("etc");

try{
	conn = OracleUtil.getConnection();
	String sql = "insert into tbl_score_202210 values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sid);
	pstmt.setString(2, subcode);
	pstmt.setString(3, midscore);
	pstmt.setString(4, finalscore);
	pstmt.setString(5, attend);
	pstmt.setString(6, report);
	pstmt.setString(7, etc);
	
	pstmt.executeUpdate();
	
	%>
	<jsp:forward page="grade.jsp"></jsp:forward>
	<%	
	
}catch(Exception e){
	e.printStackTrace();
}


%>

</body>
</html>