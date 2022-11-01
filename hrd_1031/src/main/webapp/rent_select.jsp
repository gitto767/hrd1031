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
<%@ include file="dbconn.jsp" %>
<h3>도서 예약 정보 조회</h3>
<table class="select">
<tr>
	<th>no</th>
	<th>대출번호</th>
	<th>고객성명</th>
	<th>도서코드</th>
	<th>도서명</th>
	<th>대출일자</th>
	<th>반납일자</th>
	<th>대출상태</th>
	<th>등급</th>
	<th>관리</th>
	
</tr>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	try{
		String sql="select a.lentno,a.custname,a.bookno,to_char(a.outdate,'yyyy-mm-dd'),to_char(a.indate,'yyyy-mm-dd'),a.status,a.class,b.bookname from Reservation1031 a, bookinfo1031 b where a.bookno=b.bookno";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String lentno=rs.getString(1);
			String custname=rs.getString(2);
			String bookno=rs.getString(3);
			String outdate=rs.getString(4);
			String indate=rs.getString(5);
			String status=rs.getString(6);
			String class1=rs.getString(7);
			String bookname=rs.getString(8);
			no++;
%>
<tr>
	<td><%=no %></td>
	<td><a href="reservationUpdate.jsp?lentno=<%=lentno%>"><%=lentno %></a></td>
	<td><%=custname %></td>
	<td><%=bookno %></td>
	<td><%=bookname %></td>
	<td><%=outdate %></td>
	<td><%=indate %></td>
	<td><%=status %></td>
	<td><%=class1 %></td>
	<td><a href="reservationDelete.jsp?lentno=<%=lentno %>">삭제</a></td>
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