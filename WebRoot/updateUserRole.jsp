<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateUserRole.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<h1>${userRole}</h1>
  	<form action="updateUserRoles.do" method="post">
  		<input type="hidden" name="methodName" value="updateUserRoles" />
  		<input type="hidden" name="rid" value="${role.rid}" />
  		<P>角色名称:${role.name},编辑人物角色</P>
  		<c:forEach items="${objectList}" var="u">
  			<input type="checkbox" name="uids" value="${u[0]}" <c:if test="${u[2]==1}">checked</c:if> />${u[1]}<br/>
  		</c:forEach>
  		<input type="submit" value="确认修改" />
  	</form>
  </body>
</html>



