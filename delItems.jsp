<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="cart" class="com.test.book.BookCart" scope="session"/>
<c:set var="deleted" value="${cart.deleteItem(param.delitems)}"/>
<jsp:useBean id="jsObj" class="org.json.simple.JSONObject"/>
 
${jsObj.put("deleted",deleted)}
${jsObj.toJSONString()}

 <%--
 	out.print("{\"deleted\":true}");
 --%>
 
<%--
	String[] delItems = request.getParameterValues("delitems");
	/*카트에 전달
	for(int i =0; i<delItems.length;i++){
		System.out.print(delItems[i]);
	}*/
--%>
