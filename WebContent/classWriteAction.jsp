<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="practiceExam1.BoardInfoBean" %>
    <%@ page import="practiceExam1.DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목 추가 액션 </title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- 주의 
체크박스같은 경우에는 값이 여러개가 넘어올 수 있으므로 배열로 받아서 ex(스트림)
넘겨야 하지만 라디오 같은 경우에는 값이 하나만 넘어오므로 따로 작성하지 않아도 된다.-->
<jsp:useBean id="bean" class="practiceExam1.BoardInfoBean">
<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<%
DAO dao = new DAO();
dao.inputList(bean);
response.sendRedirect("index.jsp");
%>



</body>
</html>