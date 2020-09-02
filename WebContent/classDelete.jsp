<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="practiceExam1.DAO" %>
    <%@page import="practiceExam1.BoardInfoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
DAO dao = new DAO();
dao.deleteInfo(id);

response.sendRedirect("index.jsp");
%>
</body>
</html>