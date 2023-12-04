<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subjectList</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top:140px; height:100%; width:100%; background-color: lightgray; ">
<h2 style="text-align: center;">과목별성적조회</h2>

<form  name="frm2"
		style="display: flex; text-align: center; align-content: center; justify-content: center;">
<table border="1">

<tr>
<td>과목코드</td>
<td><input type="text" name="subcode"></td>
<td><input type="button" value="조회" onclick="return search()"></td>
</tr>

</table>
</form>
<br><br>
<form  name="frm"
		style="display: flex; text-align: center; align-content: center; justify-content: center;">
<table border="1">


<tr>
<td>학번</td>
<td>성명</td>
<td>학과</td>
<td>과목</td>
<td>중간</td>
<td>기말</td>
<td>출석</td>
<td>레포트</td>
<td>기타</td>
<td>총점</td>
<td>학점</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
String subcode = request.getParameter("subcode");

try{
	conn = OracleUtil.getConnection();
	String sql = "select t.stuid, sname, dept_name, subname, midscore, finalscore, attend, report, etc,	"+
			"to_char((midscore*0.3) + (finalscore*0.3) + (attend*0.2)+(report*0.1)+(etc*0.1),'999.9') sum,	"+
			"(midscore*0.3) + (finalscore*0.3) + (attend*0.2)+(report*0.1)+(etc*0.1) grade	"+
		"from tbl_score_202210 c, tbl_subject_202210 u, tbl_student_202210 t "+
		"where c.subcode = u.subcode "+
		"and t.stuid = c.sid "+
		"and c.subcode = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, subcode);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		int sum = rs.getInt(11);
		String grade;
		if(sum>=95) grade = "A+";
		else if(sum>=90) grade = "A";
		else if(sum>=85) grade = "B+";
		else if(sum>=80) grade = "B";
		else if(sum>=75) grade = "C+";
		else if(sum>=70) grade = "C";
		else if(sum>=65) grade = "D+";
		else if(sum>=60) grade = "D";
		else  grade = "F";
		
		
		
		%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(10) %></td>
<td><%=grade %></td>

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
<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>