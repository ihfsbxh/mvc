<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//List<Object[]> list = (List<Object[]>)request.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Showuser.jsp' starting page</title>
    
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
    <h3>用户列表</h3>
    <fmt:formatDate value="${date}" pattern="yyyy-MM-dd hh:mm:ss"/>
    <table>
    	<tr>
    		<td>编号</td>
    		<td>用户名</td>
    		<td>性别</td>
    		<td>邮箱</td>
    		<td>学历</td>
    		<td>爱好</td>
    		<td>简介</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach items="${user}" var="u">
    		<tr>
    			<td>${u[0]}</td>
    			<td>${u[1]}</td>
    			<td>
    				<c:if test="${u[3]==1}">男</c:if>
    				<c:if test="${u[3]==0}">女</c:if>
    			</td>
    			<td>${u[4]}</td>
    			<td>
    				<c:if test="${u[5]==-1}">未知</c:if>
    				<c:if test="${u[5]==1}">高中</c:if>
    				<c:if test="${u[5]==2}">大专</c:if>
    				<c:if test="${u[5]==3}">本科</c:if>
    				<c:if test="${u[5]==4}">研究生</c:if>
    			</td>
    			<td>${u[6]}</td>
    			<td>${u[7]}</td>
    			<td>
    	 			<a href='query.do?tid=${u[0]}'>查询</a>&nbsp;
    	 			<a href='delete.do?tid=${u[0]}''>删除</a>
    	 		</td>
    		</tr>
    	</c:forEach>

    </table>
  </body>
</html>
