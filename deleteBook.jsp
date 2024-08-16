<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cart" class="com.test.book.BookCart" scope="session"/>
<%
	String[] delItems = request.getParameterValues("delitems");
	for(int i =0; i<delItems.length;i++){
		System.out.print(delItems[i]);
	}
%>
    
