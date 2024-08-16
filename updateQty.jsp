<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="jsObj" class="org.json.simple.JSONObject"/>

<jsp:useBean id="b" class="com.test.book.Book" />
<jsp:setProperty name ="b" property="*"/>	


<jsp:useBean id="cart" class="com.test.book.BookCart" scope="session"/>
<c:set var= "updated" value="${cart.updateQty(b)}"/>
<c:set var="total" value="${cart.total}"/>

${jsObj.put("updated",updated)}
${jsObj.toJSONString()}
