<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="practiceExam1.BoardInfoBean" %>
    <%@page import="practiceExam1.DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목수정</title>
</head>
<style>
h1{
text-align:center;
}
table{
margin-top:20px;
margin-bottom:20px;
}
</style>

<body>

<h1>교과목 수정</h1>

<%
//특정한 값에 해당하는 함수를 불러올 때는
//request.getParameter로 값을 불러와야하며
//dao 메소드 안에는 **따옴표 없이** 처리해줘야
// null값이 나오지 않고 정상적으로 값이 입력됨.
String id = request.getParameter("id");
DAO dao = new DAO();
BoardInfoBean bean = dao.bringId(id);
%>
<form method="post" action="classUpdateAction.jsp">
<table align="center"; border='1';>
<tr>
<td>
교과목코드 
</td>
<td>
<%-- value로 값을 넣어주면 수정가능함.
<input type="text" name="id" value="<%=id %>"> --%>
<!-- value없이 입력가능하면 출력만 가능 -->
<%=bean.getId()%>
</td></tr>
<tr>
<td>과목명</td>
<td><input type="text" name="name" value="<%=bean.getName() %>"></td></tr>
<tr>
<!-- 이것도 마찬가지로 넘어가는 값은 하나기때문에 따로 스트림처리안해줘도됨. -->
<td>담당강사</td>
<td><select name="lecturer">
<option value="김교수">김교수
<option value="이교수">이교수
<option value="박교수">박교수
<option value="우교수" selected>우교수
<option value="최교수">최교수
<option value="강교수">강교수
<option value="황교수">황교수</option></select></td></tr>
<tr>
<td>학점</td>
<td><input type="text" name="credit" value="<%=bean.getCredit() %>"></td></tr>
<tr>
<td>요일</td>
<td>
<input type="radio" name="week" value="1">월
<input type="radio" name="week" value="2">화
<input type="radio" name="week" value="3">수
<input type="radio" name="week" value="4">목
<input type="radio" name="week" value="5">금
<input type="radio" name="week" value="6">토
</td></tr>
<tr>
<td>시작</td>
<td><input type="text" name="start_hour" value="<%=bean.getStart_hour() %>"></td></tr>
<tr>
<td>종료</td>
<td><input type="text" name="end_end" value="<%=bean.getEnd_end()%>"></td></tr>
<tr>
<td align="center" colspan="2">
<!-- button type="button" -->
<a href="index.jsp?center=classList.jsp"><button type="button">목록</button></a>
<!--*** 이 정보 넣어야 classUpdateAction.jsp로 수정한 정보가 넘어감. -->
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="reset" value="취소">
<input type="submit" value="완료"></td></tr>
</table>
</form>
</body>
</html>