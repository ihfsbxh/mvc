<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table{
			margin:auto;
			width:500px;
			height:300px;
		}
		#formDiv{
			border:1px soid #000;
			width:500px;
			heig:300px;
			margin:auto;
			margin-top:150px;
		}
		.lab{text-align:right;}
		.in{
			width:200px;height:30px;border:1px solid #008B8B;
			border-radius:4px;
		}
		.in:hover{
			border:2px solid #00ffcc;
		}
		.tex{
			width:200px;height:150px;border:1px solid #008B8B;
			border-radius:4px;
		}
		#hbody{
			background-image: url("htt.jpg");
		}
	</style>
  </head>
  
  <body id="hbody">
    <form action="zhuce.do" method="post">
    <input type="hidden" name="methodName" value="reg"/>
    <div id="formDiv">
  	<table border="0" bgcolor="" cellpadding="0" cellspacing="0" style="margin:auto">
  		<tr>
  			<td class="lab"><label>账号:</label></td>
  			<td><input class="in" type="text" name="userName"/></td>
  		</tr>
  		<tr>
  			<td class="lab"><label>密码:</label></td>
  			<td><input class="in" type="password" name="password"/></td>
  		</tr>
  		<tr>
  			<td class="lab">邮箱:</td>
  			<td>
  				<input class="in" type="text" name="email"/>
  			</td>
  		</tr>
  		<tr>
  			<td class="lab">性别:</td>
  			<td>
  				<input name="sex" type="radio" value="1"/>男
  				<input name="sex" type="radio" value="0"/>女
  			</td>
  		</tr>
  		<tr>
  			<td class="lab">爱好:</td>
  			<td>
  				<input type="checkbox" name="hobby" value="1"/>篮球
  				<input type="checkbox" name="hobby" value="2"/>足球
  				<input type="checkbox" name="hobby" value="3"/>LOL
  				<input type="checkbox" name="hobby" value="4"/>嘻哒哒
  			</td>
  		</tr>
  		<tr>
  			<td class="lab"><label>学历:</label></td>
  			<td>
	  			<select name="education">
	  				<option value="1">高中</option>
	  				<option value="2">专科</option>
	  				<option value="3">本科</option>
	  				<option value="4">研究生</option>
	  			</select>
  			</td>
  		</tr>
  		<tr>
  			<td class="lab">自我介绍:</td>
  			<td>
  				<textarea class="tex" cols="20" rows="5" name="synopsis"></textarea>
  			</td>
  		</tr>
  		<tr>
  			<td>${yzc}</td>
  		</tr>
  		<tr>
  			<td colspan="2" style="text-align: center;">
  				<input type="submit" value="提交"/>
  			</td>
  		</tr>
  	</table>
  	
    </div>
  </form>
 <!--   <%
    String f = (String)application.getAttribute("yzc");
    if(f !=null)
    if(f !=null)
    out.println(f);
     %> --> 
  </body>
</html>
