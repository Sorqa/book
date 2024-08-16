<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <jsp:useBean id="cart" class="com.test.book.BookCart" scope="session"/>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:set var="total" value="${cart.total}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 보기</title>
<style type="text/css">
main { width: 80%; margin: auto;}
table { border:1px solid black; border-collapse: collapse; border-spacing: 0}
tr:last-child() {background-color:#BEEFFF;}
th{border-bottom:2px solid black; background-color:#BEEFFF;}
td,th { padding:0.2em 1em; border-right:1px solid black;}
td { border-bottom:1px dashed black;  }
td>a {text-decoration: none; color:blue; }
td.price_cell {text-align:right;font-weight:bolder;}
td.sum_label {text-align:right; font-weight:bolder;}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
function refresh(no){
		
	var obj={};	
	obj.no = no;
	obj.qty = $('#qty'+no).val();	/**클라이언트 / 웹브라우저에서 실행 javascirpt */
    $.ajax({
        url:'updateQty.jsp',
        method:'get',
        cache:false,
        data:obj,
        dataType:'json',  
        success:function(res){  
            alert(res.updated ? '수량 변경 성공' : '수량 변경 실패');      
            if(res.updated) location.href='showCart.jsp';
        },
        error:function(xhr, status, err){  
            alert('에러:' + err);
        }
    });
}

function bookDelete(){
	var arr = $('#cb:checked').map(function(){
		return $(this).val();
		
	});//자바 문자열이 아님
	
	var strValue='';
	for(var i=0;i<arr.length;i++ ){
		strValue += (arr[i]+',');
	}
	var obj = {};
	obj.delitems = strValue;
	alert(obj.delitems);
	$.ajax({
		url:'delItems.jsp',
		method:'post',
		cache:false,
		data:obj,
		dataType:'json',
		success:function(res){
			alert(res.deleted ? '삭제 성공':'실패');
			if(res.deleted) location.href="showCart.jsp";
		},
		error:function(xhr,status,err){
			alert('에러:' +err);
		}
		
	});
   
}
</script>
</head>
<body>
<main>
	<h3>장바구니 보기</h3>
	<table>
	<tr><th>도서번호</th><th>제목</th><th>작성자</th><th>출판사</th><th>출판일</th><th>가격</th><th>수량</th><th><button onClick="bookDelete();">삭제</button></th></tr>
	<c:forEach var="b" items="${cart.items}">
	
	<tr>
	<td> ${b.no}</td>	
	<td>${b.title}</td>		
	<td> ${b.author}</td>
	<td> ${b.publisher}</td>	
	<td> ${b.pubdate}</td>	
	<td class="price_cell"> ${b.price}</td>	
	<td><input type="number" id="qty${b.no}" value="${b.qty}"><button onclick="refresh(${b.no});">적용</button></td>
	<td><input type="checkBox" id="cb" name="cb" value="${b.no}"></td> 
		
	</c:forEach>	
	 
	<fmt:formatNumber var="ttl" value="${total}" type="currency" currencySymbol="\\"/>  
	 <tr>
	 	<th colspan="4">
            <td class="sum-label">합계</td>
            <td class="price-cell">${ttl}</td></td>
        </tr>
	</tr>				
	</table>
	
 
</main>
</body>
</html>