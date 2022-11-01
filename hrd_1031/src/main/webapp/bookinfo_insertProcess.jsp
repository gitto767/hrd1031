<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
    String bookno=request.getParameter("bookno");
    String author=request.getParameter("author");
    String bookname=request.getParameter("bookname");
    
    PreparedStatement pstmt=null;
    
    try{
    	String sql="insert into bookinfo1031 values(?,?,?)";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, bookno);
    	pstmt.setString(2, author);
    	pstmt.setString(3, bookname);
    	pstmt.executeUpdate();
    	%>
    	<script>
    	  alert("저장완료");
    	  location.href="bookinfo_select.jsp";
    	</script>
    	<%
    }catch(Exception e){
    	System.out.println("저장 실패");
    	e.printStackTrace();
    	}
%>

</body>
</html>