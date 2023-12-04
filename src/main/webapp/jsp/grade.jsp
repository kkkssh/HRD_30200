<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>grade</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top:140px; height:100%; width:100%; background-color: lightgray; ">
<h2 style="text-align: center;">성적입력</h2>

<form action="action.jsp" method="post" name="frm"
		style="display: flex; text-align: center; align-content: center; justify-content: center;">

<table border="1">
<tr>
<td>학번</td>
<td><input type="text" name="sid" ></td>
</tr>
<tr>
<td>교과코드</td>
<td>
<select name="subcode">
<option value="A001">A001-자바</option>
<option value="A002">A002-C언어</option>
<option value="A003">A003-데이터베이스</option>
<option value="A004">A004-웹프로그래밍</option>
<option value="A005">A005-영어</option>
</select>
</td>
</tr>
<tr>
<td>중간</td>
<td><input type="number" name="midscore" ></td>
</tr>
<tr>
<td>기말</td>
<td><input type="number" name="finalscore" ></td>
</tr>
<tr>
<td>출석</td>
<td><input type="number" name="attend" ></td>
</tr>
<tr>
<td>레포트</td>
<td><input type="number" name="report" ></td>
</tr>
<tr>
<td>기타</td>
<td><input type="number" name="etc" ></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="등록" onclick="return gradeCheck()">
<input type="button" value="취소" onclick="return res()">

</td>
</tr>



</table>
</form>


</section>

<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="../js/check.js"></script>

</body>
</html>