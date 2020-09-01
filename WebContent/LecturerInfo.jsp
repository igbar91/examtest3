<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="practiceExam1.LectureBean" %>
    <%@page import="practiceExam1.DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 정보</title>
</head>
<style>
table{
text-align:center;
margin-top:20px;
margin-bottom:20px;
}
</style>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String name = request.getParameter("name");
DAO dao = new DAO();
LectureBean tbean = dao.lecturerInfo(name);
%>

<table border="1">
<tr>
<td>번호</td><td><%=tbean.getIdx() %></td></tr>
<tr><td>강사명</td><td><%=tbean.getName() %></td></tr>
<tr><td>전공</td><td><%=tbean.getMajor() %></td></tr>
<tr><td>세부전공</td><td><%=tbean.getField() %></td></tr>

</table>



</body>
</html>