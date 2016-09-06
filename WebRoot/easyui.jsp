<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'easyui.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/jquery-easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath%>/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jquery-easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		.a{
			text-decoration: none;
		}
	</style>
	<script type="text/javascript">
		function addTab(title,url){
			$("#ac").tabs('add',{
				title   :title,
				selected:true,
				closable:true,
				content :"<iframe style='height:100%; width:100%;' src='"+url+"'></iframe>",
			});
		}
	</script>
  </head>
  
  <body class="easyui-layout">
    <div title="Tab1" data-options="region:'north',title:'欢迎来到华夏人才网',split:true" style="height:100px;"></div>   
    <div data-options="region:'west',title:'权限列表',split:true" style="width:150px;">
    	<div id="aa" class="easyui-accordion" style="width:300px;height:500px;" data-options="fit:true">   
    		<div title="Title1" data-options="iconCls:'icon-save',fit:'true'" style="overflow:auto;padding:10px;"></div>   
    		<div title="Title2" data-options="iconCls:'icon-reload',selected:true,fit:'true'" style="padding:10px;"></div>   
    		<div title="Title3" data-options="fit:true">
    	  		<ul id="tt" class="easyui-tree">   
				    <li>   
				        <span>休闲一刻</span>   
			                <ul>   
			                    <li>   
			                        <span><a href="javascript:addTab('百度','http://www.baidu.com');">百度</a></span>   
			                    </li>   
			                    <li>   
			                        <span><a href="javascript:addTab('网易','http://www.163.com');">网易</a></span>   
			                    </li>   
			                    <li>   
			                        <span><a href="javascript:addTab('淘宝','http://www.taobao.com');">淘宝网</a></span>   
			                    </li>
			                    <li>   
			                        <span><a href="javascript:addTab('优酷','http://www.youku.com');">优酷</a></span>   
			                    </li>
			                    <li>   
			                        <span><a href="javascript:addTab('新浪','http://www.sina.com.cn');">新浪</a></span>   
			                    </li> 
			                </ul>   
				    </li>   
				</ul> 
    		</div>   
		</div> 
	</div>   
    <div id="ac" class="easyui-tabs" data-options="region:'center'" style="padding:0px;background:#eee;"></div>   
</body>
</html>
    	<!-- <div id="aa" class="easyui-tabs" style="width: 100%;height: 100%;" data-options="fit:true"></div> -->