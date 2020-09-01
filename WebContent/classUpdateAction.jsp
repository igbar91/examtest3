<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="practiceExam1.BoardInfoBean" %>
    <%@page import="practiceExam1.DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="practiceExam1.BoardInfoBean">
<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<!-- void type =
dao.saveUpdate(bean);  -->
<%
DAO dao = new DAO();
dao.saveUpdate(bean);
response.sendRedirect("index.jsp");
%>

</body>
</html>