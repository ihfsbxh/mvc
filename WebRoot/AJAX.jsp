<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AJAS.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript">
  	function ajax(){
	  	//1.创建xmlHttpRequest对象
  		var xmlHttpRequest;
  		//IE
  		if(window.ActiveXObject){
  			xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
  		}
  		//DOM
  		else if(window.XMLHttpRequest){
  			xmlHttpRequest = new XMLHttpRequest();
  		}
  		//2.打算开链接
  		xmlHttpRequest.open("post","ajax.do?methodName=AJAX",true);
  		
  		//3.绑定回调函数
  		xmlHttpRequest.onreadystatechange = function(){
  			if(xmlHttpRequest.readyState == 4){
  				if(xmlHttpRequest.status == 200){
  					alert('测试成功');
  				}
  			}
  		}
  		
  		//4.发送请求
  		xmlHttpRequest.send(null);
  	}
  </script>
  </head>
  
  <body>
    <a href="javascript: ajax();">测试</a>
  </body>
</html>
