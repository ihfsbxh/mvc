<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Goos.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<style type="text/css">
	    .goods{
	        width: 242px;
	        height: 164px;
	        background-color: #faebd7;
	        float: left;
	        margin-left:10px;
	        margin-top: 10px; 
	    }
	    .goods img{
	        width: 242px;
	    }
	    .goods p{
	        font-size: 14px;
	        margin-top: 0px;
	    }
	    .goods b{
	        color: red;font-family: inherit;
	    }
	    .goods a{
	        display: block; float: left;
	        width: 80px;
	        background-color: #df2a4c;
	        font-size: 14px;color: #ffffff;
	        border-radius:3px;font-weight: bolder;
	        margin-left: 19px;text-align: center;
	        text-decoration: none;
	        padding-top: 1px;padding-bottom: 7px;
	        box-shadow: 2px 2px gray;
	    }
	    .goods a:hover{
	        opacity:0.7px;
	    }
	    .bg{
	        position: absolute;top:0;left: 0;
	        width: 100%;height: 100%;
	        background-color: gray;
	        opacity:0.6;z-index:200;
	        display:nome;
	    }
	    .details{
	        width: 311px;height: 181px;
	        background-color: #fof8ff;
	        border-radius:5px;
	        margin-left:350px;margin-top:200px;
	        position: absolute;z-index:201;
	        
	    }
	    .details a{
	        display: block;float: left;
	        width: 40px;background-color: #DE2B50;
	        text-align: center;text-decoration: none;
	        color: #ffffff;
	        border-radius:2px;box-shadow:2px 2px gray;
	    }
	</style>
	<script type="text/javascript">
	    function showDiv(objid){
	        $("#bg").show();
	        $("#details").show();
	        $("#goodsName").text($("#"+objid).text());
	    }
	    function haideDiv(){
	        $("#bg").show();
	        $("#details").show();
	    }
	</script>

  </head>
  
  <body>
  <div class="bg" id="bg"></div>
  <div class="details" id="details">
      <a href="javascript:haideDiv();">X</a>
      <p>商品名称-&gt;<span id="goodsName"></span></p>
  </div>
    <div class="goods">
        <img alt="" src="img/1458784359096338581.jpg">
        <p>
            <span><label id="g1">铸星龙王</label>&nbsp;售价:<b>188</b>元</span>
            <br/>
            <a href="javascript:showDiv(g1);">放入购物车</a>
            <a href="javascript:showDiv();">立即购买</a>
        </p>
    </div>
    <div class="goods">
        <img alt="" src="img/1458845241549143491.jpg">
        <p>
            <span><label id="g2">英雄大礼包</label>&nbsp;售价:<b>188</b>元</span>
            <br/>
            <a href="javascript:showDiv(g2);">放入购物车</a>
            <a href="javascript:showDiv();">立即购买</a>
        </p>
    </div>
    <div class="goods">
        <img alt="" src="img/1458845241549143491.jpg">
        <p>
            <span><label id="g3">英雄大礼包</label>&nbsp;售价:<b>188</b>元</span>
            <br/>
            <a href="javascript:showDiv(g3);">放入购物车</a>
            <a href="javascript:showDiv();">立即购买</a>
        </p>
    </div>
  </body>
</html>
