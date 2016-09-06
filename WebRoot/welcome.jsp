<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/jquery-easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath%>/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jquery-easyui/jquery.easyui.min.js"></script>
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
	<style type="text/css">
		#a{
			text-decoration: none;
		}
	</style>
  </head>
  
  <body class="easyui-layout">
    <div title="Tab1" data-options="region:'north',title:'欢迎来到华夏人才网',split:true" style="height:100px;"></div>   
    <div data-options="region:'west',title:'权限列表',split:true" style="width:150px;">
    	<div id="aa" class="easyui-accordion" style="width:300px;height:500px;" data-options="fit:true">   
    		<div title="Title3" data-options="fit:true">
    	  		<ul id="tt" class="easyui-tree">   
					<c:forEach items="${MenuList}" var="m2">
						<c:if test="${m2.level==2}">
							<li>
								<span>${m2.name}</span>
								<ul>
									<c:forEach items="${MenuList}" var="m3">
										<c:if test="${m3.parentid==m2.mid}">
											<li>
												<a id="a" href="javascript:void(0);" onclick="addTab('${m3.name}','<%=basePath%>${m3.url}')">${m3.name}</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</c:if>
					</c:forEach>
				</ul> 
    		</div>   
		</div> 
	</div>   
    <div id="ac" class="easyui-tabs" data-options="region:'center'" style="padding:0px;background:#eee;"></div>   
</body>
</html>
