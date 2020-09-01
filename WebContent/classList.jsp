<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="practiceExam1.BoardInfoBean" %>
       <%@ page import="practiceExam1.DAO" %>
            <%@page import="practiceExam1.LectureBean" %>
       <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<style>
a{
text-align:center;
text-decoration:none;
}
.write{
<%--button은 position 으로  // 만약 right면 -800으로 해야됨--%>
position:relative;
left:750px;
margin:10px;
}
</style>
<body>
<%
  DAO dao = new DAO();
 Vector<BoardInfoBean> vec = dao.getList();
%>
<br>
* 총 10개의 교과목이 있습니다.
<br>
<br>
<table align="center"; border='1';>
<tr>
<td>
과목코드
</td>
<td>
과목명
</td>
<td>
학점
</td>
<td>
담당강사
</td>
<td>
요일
</td>
<td>
시작시간
</td>
<td>
종료시간
</td>
<td>
관리
</td>
</tr>

<%
//* tr 앞에 vec.get(i)  중요
for(int i=0; i<vec.size(); i++){
BoardInfoBean bean = vec.get(i);
%>
<tr>

<td>
<%=bean.getId() %>
</td>
<td>
<%=bean.getName() %>
</td>
<td>
<%=bean.getCredit() %>
</td>
<td>
<a href="index.jsp?center=LecturerInfo.jsp?name=<%=bean.getLecturer()%>"><%=bean.getLecturer() %></a>
</td>
<td>
<!-- 여기 쫌 중요 -->
<%
String day = request.getParameter("day");
if(bean.getWeek()==1){
	day="월요일";
}else if(bean.getWeek()==2){
	day="화요일";
}else if(bean.getWeek()==3){
	day="수요일";
}else if(bean.getWeek()==4){
	day="목요일";
}else if(bean.getWeek()==5){
	day="금요일";
}else if(bean.getWeek()==6){
	day="토요일";
}
%>
<%=day %>
</td>
<td>
<%=bean.getStart_hour() %>
</td>
<td>
<%=bean.getEnd_end() %>
</td>

<td>
<a href="index.jsp?center=classUpdate.jsp?id=<%=bean.getId() %>">수정</a> / 
<a href="index.jsp?center=classDelete.jsp">삭제</a>
</td>
</tr>
<%
}
%>
</table>

<a href="index.jsp?center=classWrite.jsp" ><button class="write">작성</button></a>

</body>
</html>