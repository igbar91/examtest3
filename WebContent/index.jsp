<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
<%-- margin auto 가 align center보다나음--%>
div{
border:1px solid black;
padding-top:30px;
padding-bottom:30px;
margin:auto;
text-align:center;
margin-bottom:10px;
margin-top:10px;
}
table{

text-align:center;
margin:auto;
}
h1{
align:center;
}
table tr td{
padding-right:10px;
padding-left:10px;
}
section{
border:1px solid black;
}
</style>
<body>
<%
String center = request.getParameter("center");

if(center==null){
	center = "classList.jsp";
}
%>
<top>
<div>수강신청 도우미사이트</div>
</top>
<section>
<jsp:include page="<%=center %>"></jsp:include>
</section>



<footer>
<div>Copyright (C) 2018 정보처리산업기사 All Right Reserved</div>
</footer>
</body>
</html>