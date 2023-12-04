<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header style="position:fixed; top:0px; height:100px; width:100%; text-align: center; line-height: 100px;
				background-color: blue; color: white; font-size: 25px;">
(과정평가형 정보처리산업기사) 학생 성적처리 프로그램 ver 2022-10
</header>

<nav style="position:fixed; top:100px; height:40px; width:100%; line-height: 40px; background-color: lightblue;">
<a href="<%=request.getContextPath()%>/jsp/studentList.jsp" style="text-decoration: none; margin-left: 20px;">학생현황</a>
<a href="<%=request.getContextPath()%>/jsp/grade.jsp" style="text-decoration: none; margin-left: 20px;">성적입력</a>
<a href="<%=request.getContextPath()%>/jsp/gradeList.jsp" style="text-decoration: none; margin-left: 20px;">성적현황</a>
<a href="<%=request.getContextPath()%>/jsp/subjectList.jsp" style="text-decoration: none; margin-left: 20px;">과목별 성적조회</a>
<a href="<%=request.getContextPath()%>" style="text-decoration: none; margin-left: 20px;">홈으로</a>
</nav>
</body>
</html>