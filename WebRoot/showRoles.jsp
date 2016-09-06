<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showRoles.jsp' starting page</title>
    
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
    <table>
    	<tr>
    		<td>编号</td>
    		<td>角色名称</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach items="${roleList}" var="r">
    		<tr>
    			<td>${r.rid}</td>
    			<td>${r.name}</td>
				<td><a href="updateRoleMenu.do?methodName=updateRoleMenu&rid=${r.rid}">角色权限</a>&nbsp
				<a href="updateUserRole.do?methodName=updateUserRole&rid=${r.rid}">用户角色</a></td>
    		</tr>
    	</c:forEach>
    </table>
  </body>
</html>
