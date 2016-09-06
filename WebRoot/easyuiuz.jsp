<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'easyuiuz.jsp' starting page</title>
    
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
		function add(){
			$("#fg").tabs('add',{
				title   :title,
				selected:true,
				closable:true,
			});
		}
	</script>
  </head>
  
  <body class="easyui-layout">
  	<div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>   
  	<div data-options="region:'west',title:'West',split:true" style="width:200px;">
  		<div id="aa" class="easyui-accordion" style="width:200px;height:300px;">   
    	<div title="Title1" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">   
        	<ul id="tt" class="easyui-tree">   
    <li>   
        <span>Folder</span>   
        <ul>   
            <li>   
                <span>Sub Folder 1</span>   
                <ul>   
                    <li>   
                        <span><a href="#">File 11</a></span>   
                    </li>   
                    <li>   
                        <span>File 12</span>   
                    </li>   
                    <li>   
                        <span>File 13</span>   
                    </li>   
                </ul>   
            </li>   
            <li>   
                <span>File 2</span>   
            </li>   
            <li>   
                <span>File 3</span>   
            </li>   
        </ul>   
    </li>   
    <li>   
        <span>File21</span>   
    </li>   
</ul> 
    	</div>   
</div> 
  	</div> 
	<div id="fg" class="easyui-tabs" data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>   
  </body>
</html>
