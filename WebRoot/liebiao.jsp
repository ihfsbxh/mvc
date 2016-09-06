<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("ss",basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'liebiao.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		function showp(){
			$("#p").show();
			$("div").show();
		}
		$(function(){
			/*$(".dd").click(function(){
				alert("hello");
			});
			$(".dd").mouseover(function(){
				alert("移入");
			});
			$(".dd").hove(function(){
				
			},function(){
				
			});
			$("#div").on("click",".sp",function(){
				alert("hasdha");
			});
			
			$("#div").append("<span class='sp'>测试</span>");
			$("#div").on("click",function(){
				alert("vvsxasd");
			});
			$("#div").on("mouseover","#sp",function(){
				$("#div").append("<sapn c>测试3</sapn>");
			});
			$("#div").append("<sapn id='sp'>测试</sapn>");*/
			//$(".spa").click(function () {
				//$.ajax({
					//url:'${ss}ajax.do?methodName=AJAX',
					//success:function(data){
						//alert(data);
					//}
				//});
			//});
			$(".spa").click(function () {
				/*
				$.ajax({
					type:'post',
					url:'${ss}ajax.do',
					data:{methodName:'AJAX'},
					dataType:'text',
					success:function(f){
						alert(f);
					}
				});
				$.getJSON('${SS}ajax.do',{methodName:'AJAX'},function(data){
					alert(data.addres+data.name);
				});
				
				$.get('${ss}ajax.do',{methodName:'AJAX'},function(data){
					alert(data);
				},'text');});
				$.getJSON('${ss}jaxa.do',{methodName:'AJAX'},function(data){
					alert(data.name+"来自"+data.addres);
				});*/
				
				$.post('${ss}ajax.do',{methodName:'AJAX'},function(data){
					alert(data.name);
				},'json');
				
			/*$(".dd").click(function () {
				$(".spa").trigger("click");
			});
				alert("asdsa");*/
				
				
				
				
			});
		});
	</script>
  </head>
  
  <body>
  	<div id="div">
  		<span class="spa">测试2</span>
  	</div>
  	<span class="dd">点击</span>
    <a href="http://www.baidu.com">百度</a>
  </body>
</html>
