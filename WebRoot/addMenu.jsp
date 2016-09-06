<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addMenu.jsp' starting page</title>
    
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
  <p>${Fail}</p>
    <form action="addMenu.do" method="post">
    	<input type="hidden" name="methodName" value="addMenuTO" />
    	<label>菜单名称:</label>
    	<input type="text" name="name"/><br/>
    	<label>链接地址:</label>
    	<input type="text" name="url"/><br/>
    	<label>是否展示:</label>
    	<input type="radio" name="isshow" value="1"/>可展示
    	<input type="radio" name="isshow" value="0"/>不展示<br/>
    	<label>父类级别:</label>
    	<select name="parentid">
    		<c:forEach items="${list}" var="l">
    			<option value="${l.mid}">
	   				<c:if test="${l.level==1}">一级菜单--${l.name}</c:if>
	   				<c:if test="${l.level==2}">二级菜单--${l.name}</c:if>
    			</option>
	 		</c:forEach>
    	</select><br/>
    	<input type="submit" value="提交"/>
    	<input type="reset" value="重置"/>
    </form>
  </body>
</html>
