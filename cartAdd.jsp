<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<jsp:useBean id="jsObj" class="org.json.simple.JSONObject"/>

<jsp:useBean id="book" class="com.test.book.Book" scope="page"/>
<jsp:setProperty name ="book" property="*"/>	

<jsp:useBean id="dao" class="com.test.book.BookDAO"/>
<c:set var="b" value="${dao.bookDetail(book)}"/>	

<jsp:useBean id="cart" class="com.test.book.BookCart" scope="session"/>
<c:set var="added" value="${cart.add(b)}"/>
<%--
	웹파라미터 전달된 no,qty을 받아서 Book 인스턴스 생성
	생성된 Book 인스턴스를 장바구니에 저장
	성공/실패 메시지를 이용자에게
 --%>
${jsObj.put("cartadded",added)}
${jsObj.toJSONString()}
