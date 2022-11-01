<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.lentno.value==""){
		alert("대출번호를 입력하세요.");
		document.form.lentno.focus();
	}else if(document.form.custname.value==""){
		alert("고객성명을 입력하세요.");
		document.form.custname.focus();
	}else if(document.form.bookno.value==""){
		alert("도서코드를 입력하세요.");
		document.form.bookno.focus();
	}else{
		form.action="rent_insertProcess.jsp"
	}
}
function changesubmit(){
	document.form.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="dbconn.jsp" %>
<% 
   String bookno =request.getParameter("bookno");
   String lentno=request.getParameter("lentno");
   String custname=request.getParameter("custname"); 
   String outdate=request.getParameter("outdate");
   String indate=request.getParameter("indate");
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   String bookname="";
   int sel=0;
   if(lentno==null){
	   lentno="";
   }
   if(custname==null){
	   custname="";
   }
   if(outdate==null){
	   outdate="";
   }
   if(indate==null){
	   indate="";
   }
   if(bookno==null){
	   bookno="";
   }else{
	   
   
   try{
	   String sql="select bookname from bookinfo1031 where bookno=?";
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1,  bookno);
	   rs=pstmt.executeQuery();
	   if(rs.next()){
		   bookname=rs.getString(1);
		   System.out.println("bookname:"+bookname);
	   }else{
		   bookname="";
	%>
	<script>
	  alert("등록되지않은 도서코드입니다.");
	  history.back(-1)
	</script>
	<%
   }
	   }catch(Exception e){
		   e.printStackTrace();
		  }
   }
%>
<h3>도서 대출 정보 등록 화면</h3>
  <form name="form" method=post action="rent_insert.jsp">
  <table>
    <tr>
	  <th >대출번호</th>
	  <td><input type="text" name="lentno" value="<%=lentno %>"></td>
	  <th>고객성명</th>
	  <td><input type="text" name="custname" value="<%=custname %>"></td>
    </tr>
    <tr>
	  <th>도서코드</th>
	  <td><input type="text" name="bookno" value="<%=bookno %>" onchange="changesubmit()"></td>
	  <th>도서이름</th>
	  <td><input type="text" name="bookname" value="<%=bookname %>"></td>
    </tr>
    <tr>
	  <th>대출일자</th>
	  <td><input type="text" name="outdate" value="<%=outdate%>"></td>
	  <th>반납일자</th>
	  <td><input type="text" name="indate" value="<%=indate%>" onchange="changesubmit()"
	  <%if(indate==""){sel=1;}else{sel=0;} %>
	  ></td>
    </tr>
    <tr>
	  <th>대출상태</th>
	  <td class="radio">
	    <input type="radio" value="1" name="status" <%if(sel==1){%> checked<%}%>>대출
	    <input type="radio" value="2" name="status" <%if(sel==0){%> checked<%}%>>반납
	  </td>
	  <th>등급</th>
	  <td>
	    <select name="class">
		  <option value="S" selected>S : 30</option>
		  <option value="A">A : 20</option>
		  <option value="B">B : 10</option>
		  <option value="C">C : 7</option>
		</select>
	  </td>
    </tr>
    <tr>
	  <td colspan=4 class="last">
	    <input class="buttons" type="submit" id=btn1 value="저장" onclick="check()">
	    <input class="buttons" type="reset" id=btn1 value="취소">
	  </td>
    </tr>
  </table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>