<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
  <h3>도서 정보 목록</h3>
  <%@ include file="dbconn.jsp" %>
  <table class="select">
    <tr>
      <th>no</th>
      <th>도서코드</th>
      <th>저자</th>
      <th>도서명</th>
    </tr>
    <%
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      int no=0;
      try{
    	  String sql="select bookno,author,bookname from bookinfo1031";
    	  pstmt=conn.prepareStatement(sql);
    	  rs=pstmt.executeQuery();
    	  while(rs.next()){
    		  String bookno=rs.getString(1);
    		  String author=rs.getString(2);
    		  String bookname=rs.getString(3);
    		  no++;
   %>
   	
    <tr>
      <td><%=no %></td>
      <td><%=bookno %></td>
      <td><%=author %></td>
      <td><%=bookname %></td>
    </tr>
   <% 
    	  }
      }catch(Exception e){
    	  System.out.println("조회 실패");
    	  e.printStackTrace();
      }
    %>
  </table>
  
</section>
<%@ include file="footer.jsp" %>
</body>
</html>