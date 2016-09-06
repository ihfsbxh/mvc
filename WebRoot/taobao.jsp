<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'taobao.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<style type="text/css">
		.div{
			width: 253px;
			height: 200px;
			background-color: #f5fcff;
			float: left;
			margin: 5px;
		}
		.div img{
			width: 253px;
			height: 147px;
		}
		.div p{
			position: relative;
			top: -12px;
			left: 45px;
		}
		.div p{
			font-size: 16px;
		}
		.div b{
			color: red;font-family: inherit;
		}
		.div a{
			display: block;
			float: left;
			width: 80px;
			margin-right: 9px;
			background-color: #5e3880;
			font-size: 14px;
			color: #ffffff;
			border-radius: 60px;
			font-weight: bolder;
			text-align: center;
			text-decoration: none;
			padding-top: 2px;
			padding-bottom: 3px;
		}
		.div a:HOVER{
			background-color: #294cd8;
			box-shadow: 2px 2px gray;
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
	        background-color: #987220;
	        border-radius:5px;
	        margin-left:620px;margin-top:180px;
	        position: absolute;z-index:201;
	        
	    }
	    .details a{
	        display: block;float: left;
	        width: 40px;background-color: #DE2B50;
	        text-align: center;text-decoration: none;
	        color: black;
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
	        $("#bg").hide();
	        $("#details").hide();
	    }
	</script>
  </head>
  	
  <body>
  	<div style="display: none;" class="bg" id="bg"></div>
  	<div style="display: none;" class="details" id="details">
    	  <a href="javascript:haideDiv();">X</a>
    	  <p>商品名称-&gt;<span id="goodsName"></span></p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  			<span><label id="g1">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g1');">放入购物车</a>
  			<a href="javascript:showDiv('g1');">立即购买</a>
  		</p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  		  	<span><label id="g2">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g2');">放入购物车</a>
  			<a href="javascript:showDiv('g2');">立即购买</a>
  		</p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  			<span><label id="g3">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g3');">放入购物车</a>
  			<a href="javascript:showDiv('g3');">立即购买</a>
  		</p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  		  	<span><label id="g4">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g4');">放入购物车</a>
  			<a href="javascript:showDiv('g4');">立即购买</a>
  		</p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  		  	<span><label id="g5">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g5');">放入购物车</a>
  			<a href="javascript:showDiv('g5');">立即购买</a>
  		</p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  		  	<span><label id="g6">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g6');">放入购物车</a>
  			<a href="javascript:showDiv('g6');">立即购买</a>
  		</p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  		  	<span><label id="g7">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g7');">放入购物车</a>
  			<a href="javascript:showDiv('g7');">立即购买</a>
  		</p>
  	</div>
  	<div class="div">
  		<img alt="" src="htt.jpg">
  		<p>
  		  	<span><label id="g8">廉洁糖</label>&nbsp;售价:<b>&nbsp;88888&nbsp;</b>元</span><br />
  			<a href="javascript:showDiv('g8');">放入购物车</a>
  			<a href="javascript:showDiv('g8');">立即购买</a>
  		</p>
  	</div>
  </body>
</html>
