<%@page import="com.test.book.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="dao" class="com.test.book.BookDAO"/>


<c:set var="book" value="${dao.getBook(param.no)}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세보기</title>
<style type="text/css">
main > h3{text-align:center; }
table {width:fit-content; margin:0.5em auto; padding:1em; border:1px solid black;}
label { display:inline-block; width:5em; padding-right:1em; }
section>div{padding:0.2em;}
div>img { width:200px; }


</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
function cartAdd(){
		
	var obj={};
	obj.no = ${book.no};	/**서버 코드 / 자바  */
	obj.qty = $('#qty').val();	/**클라이언트 / 웹브라우저에서 실행 javascirpt */
    $.ajax({
        url:'cartAdd.jsp',
        method:'post',
        cache:false,
        data:obj,
        dataType:'json',  
        success:function(res){  
            alert(res.cartadded ? '장바구니 성공' : '장바구니 실패');                
        },
        error:function(xhr, status, err){  
            alert('에러:' + err);
        }
    });
}
</script>
</head>
<body>
<main>
<h3>도서 상세보기</h3>
<table>
      <tr><th>번호</th><td>${book.no}</td></tr>
      <tr><th>제목</th><td>${book.title}</td></tr>
      <tr><th>저자</th><td>${book.author}</td></tr>    
      <tr><th>출판사</th><td>${book.publisher}</td></tr>
      <fmt:formatDate var="date" value="${book.pubdate}" pattern="yyyy-MM-dd"/>	
      <tr><th>출판일</th><td> ${date}</td></tr>
      <tr><th>쪽수</th><td>${book.pages}</td></tr>
      <tr><th>가격</th><td>${book.price}</td></tr>
      <tr><th>표지</th><td><img src="../img/${book.cover}"></td></tr>
   </table>
  
 <label for="qty">구매수량</label>
 <input type="number" id="qty" name="qty">  
 <button type="button" onclick="cartAdd()">장바구니</button>
 <a href="showCart.jsp"><button>장바구니 내용보기</button></a>
 </main>
</body>
</html>