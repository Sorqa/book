<%@page import="com.test.book.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="dao" class="com.test.book.BookDAO"/>

<c:set var="books" value="<%=dao.getBooks()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<style type="text/css">
table { border:1px solid black; border-collapse: collapse; border-spacing: 0}
tr:nth-child(odd) {background-color:#BEEFFF;}
th{border-bottom:2px solid black;}
td,th { padding:0.2em 1em; border-right:1px solid black;}
td { border-bottom:1px dashed black; }
td>a {text-decoration: none; color:blue; }
</style>

</head>
<body>
<table>
<tr><th>번호</th><th>제목</th><th>작성자</th><th>출판사</th><th>출판일</th><th>쪽수</th><th>가격</th></tr>
<c:forEach var="books" items="${books}" varStatus="status">
	<tr>
	<td><div> ${books.no}</div></td>	
	<td><a href="bookDetail.jsp?no=${books.no}"><div> ${books.title}</div></td>		
	<td><div> ${books.author}</div></td>
	<td><div> ${books.publisher}</div></td>
	<fmt:formatDate var="date" value="${books.pubdate}" pattern="yyyy-MM-dd"/>
	<td><div> ${date}</div></td>
	<td><div> ${books.pages}</div></td>
	<fmt:formatNumber var="price" value="${books.price}" pattern="###,###"/>
	<td><div> ${price}</div></td>	
	</tr>
</c:forEach>
</table>
</body>
</html>