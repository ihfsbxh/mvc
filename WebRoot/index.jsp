<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>蓝色透明登录界面模板</title>

<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" href="css/loginMy.css"/>

<style>
html,body{width:100%;}
</style>


</head>
<body>

<div class="main">
<h6>${loginError}</h6>
	<div class="center">
		<form action="login.do" id="formOne" method="post" onsubmit="return submitB()" >
			<input type="hidden" name="methodName" value="logon"/>
			<i class="fa fa-user Cone">  | </i>
			<input type="text" name="userName" id="user" placeholder="用户名" onblur="checkUser()"/>
			<span id="user_pass"></span>
			<br/>
			<i class="fa fa-key Cone">  | </i>
			<input type="password" name="password" id="pwd" placeholder="密码" onblur="checkUser1()"/>
			<span id="pwd_pass"></span>
			<br/>
			
			<span id="surePwd_pass" ></span><br/>
			<!-- <a href="javascript: login();">登录</a> -->
			<input type="submit" value="登录" id="submit" name="submit" style="cursor:pointer;">
			<br/>
		</form>
	</div>
	
</div>


<script type="text/javascript" src="js/loginMy.js"></script>
<div style="text-align:center;">
<p>木有账号点击我的小尾巴:::<a href="reg.jsp"" target="_blank">~~~~注册~~~~~</a></p>
</div>
</body>
</html>