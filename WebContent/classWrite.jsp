<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목추가</title>
</head>
<style>
h1{
text-align:center;
}
table{
margin-bottom:30px;
}
</style>
<body>
<h1>교과목 추가</h1>

<form method="post" action="classWriteAction.jsp">
<table align="center"; border='1';>
<tr>
<td>
교과목코드
</td>
<td>
<input type="text" name="id"></td></tr>
<tr>
<td>
과목명</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
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
<td><input type="text" name="credit"></td>
</tr>
<tr>
<td>요일</td>
<td>
<input type="radio" name="week" value="1">월
<input type="radio" name="week" value="2">화
<input type="radio" name="week" value="3">수
<input type="radio" name="week" value="4">목
<input type="radio" name="week" value="5">금
<input type="radio" name="week" value="6">토
</td>
</tr>
<tr>
<td>시작</td>
<td><input type="text" name="start_hour"></td></tr>

<tr>
<td>종료</td>
<td><input type="text" name="end_end"></td></tr>

<tr>
<td align="center" colspan="2"><a href="index.jsp?center=classList.jsp"><button>목록</button></a>
<input type="submit" value="완료"></td></tr>
</table>
</form>
</body>
</html>