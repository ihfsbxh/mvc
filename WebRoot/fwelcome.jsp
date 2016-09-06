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
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#whole{
			width:1600px;
			heigh:900px;
			background-image: url("tk.jpg");
		}
		#above{
			width:100%;
			height:100px;
		}
		#subject{
			width:100%;
			height:800px;
		}
		#fsubject{
			width:15%;
			height: 100%;
			float:left;
		}
		#rsubject{
			width: 85%;
			height: 100%;
			float:left;
		}
		#ifr{
			width:100%;
			height: 100%;
		}
		#fsubject a:HOVER {
			border-color: black;
			text-decoration: none;
		}
		#oo{
			font-family: 10px;
			color: fuchsia;
		}
		#time{
			margin-right: 100px;
			margin-top: 10px;
			color: highlight;
		}
	</style>
		<script type="text/javascript">
			function test(){
				var d = new Date();
				var y = d.getFullYear();
				var m = d.getMonth();
				var td = d.getDate();
				var h = d.getHours();
				var min = d.getMinutes();
				var s = d.getSeconds();
				var ms = d.getMilliseconds();
				var dsy = d.getDay();
				var str = y+"-"+m+"-"+td+"  "+h+":"+min+":"+s+":"+ms+"    星期"+dsy;;
				
				var span = document.getElementById("time");
				span.innerHTML = str;
		}
			//时间间隔
			setInterval("test();",1);
		</script>
  </head>
  
  <body>
  	<div id="whole">
  		<div id="above">
  			<p id="oo">欢迎你，快乐的${user.userName}</p>
  			<span id="time"></span>
  		</div>
  		<div id="subject">
  			<div id="fsubject">
	  			<ul>
	  				<c:forEach items="${MenuList}" var="m2">
	  					<c:if test="${m2.level==2}">
	  						<li>
	  							<span>${m2.name}</span>
	  							<ul>
	  								<c:forEach items="${MenuList}" var="m3">
	  									<c:if test="${m3.parentid==m2.mid}">
	  										<li><a href="javascript:addTab(<%=basePath%>${m3.url})s" target="ce">${m3.name}</a></li>
	  									</c:if>
	  								</c:forEach>
	  							</ul>
	  						</li>
	  					</c:if>
	  				</c:forEach>
	  			</ul>
  			</div>
  			<div id="rsubject">
  				<iframe name="ce" id="ifr"></iframe>
	  		</div>
	  	</div>
  	</div>
  </body>
</html>
<!-- <P><a href="cc">点击下载</a></P>
  				<P><a href="showusers.do?methodName=ShowUsers" target="ce">用户列表</a></P>
  				<P><a href="qclass.do?methodName=QClass" target="ce">班级列表</a></P>
  				<P><a href="tclass.jsp?methodName=Tclass" target="ce">添加班级</a></P>
  				<P><a href="qstudent.do?methodName=QStudent" target="ce">学生列表</a></P>
  				<P><a href ="tstudent.jsp?methodName=Tstudent" target="ce">添加学生</a></P> -->
