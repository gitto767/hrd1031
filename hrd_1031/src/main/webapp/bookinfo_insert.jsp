<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.bookno.value==""){
		alert("도서코드를 입력하세요.");
		document.form.bookno.focus();
	}else if(document.form.author.value==""){
		alert("저자을 입력하세요.");
		document.form.author.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
  <h3>도서 정보 등록 화면</h3>
  <form name="form" method="post" action="bookinfo_insertProcess.jsp">
  <table>
    <tr>
      <th>도서코드</th>
      <td><input type="text" name="bookno"></td>
    </tr>
     <tr>
      <th>저자</th>
      <td><input type="text" name="author"></td>
    </tr>
     <tr>
      <th>도서이름</th>
      <td><input type="text" name="bookname"></td>
    </tr>
     <tr>
      <td colspan=2 class="last">
      <input class="buttons" type="button" value="저장" onclick="check()" >
      <input class="buttons" type="reset" value="취소">
      </td>
    </tr>
  </table>
  </form>
  
  
</section>
<%@ include file="footer.jsp" %>
</body>
</body>
</html>