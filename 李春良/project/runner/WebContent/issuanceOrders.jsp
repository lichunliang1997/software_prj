<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发布订单</title>
    <link href="css/navigation.css" rel="stylesheet">
    <link href="css/debit.css" rel="stylesheet">
    <script src="https://webapi.amap.com/maps?v=1.4.8&key=b6357af7e5eb44585f533ed85e6c238f&callback=init&plugin=AMap.PlaceSearch,AMap.AdvancedInfoWindow"></script>
    <!-- zui -->
    <link href="css/zui.css" rel="stylesheet">
    <script src="js/jquery-1.7.min.js"></script>
    <script src="js/zui.js"></script>
    <!-- 图标js -->
    <script src="js/iconfont.js"></script>
	<script src="js/toastr.min.js"></script>
	<script src="https://cdn.goeasy.io/goeasy.js"></script>
  </head>
  <link href="css/toastr.min.css" rel="stylesheet"/>
  <body class="body">
  <input style="display:none;" value="${user.id}" id="channel">
  <script type="text/javascript">
  	var goEasy=new GoEasy({
  		appkey:"BC-0d6ab878a0a24864a0c5c0e5251e50df"
  	});
  	goEasy.subscribe({
  		channel:$('#channel').val(),
  		onMessage:function(message){
  			var re=eval("("+message.content+")");
  			toastr.info(re.talkerId.nickname+"给你发消息啦!");
  		}
  	})
  </script>
      <!-- title -->
      <h2 class="title container-fluid">
		    <div class="top-title">发布订单</div>
      </h2>
      <!-- 主要内容 -->
      <form action="sendOrder" method="post">
      <div class="container-fluid address">
        
        <div class="input-control has-label-left">
            <select class="form-control " id="school" name="school">
              <option value="" class="schoolName"></option>
              <option value="燕山大学">燕山大学</option>
              <option value="河北科技大学">河北科技大学</option>
              <option value="河北师范大学">河北师范大学</option>
            </select>
            
          <label for="school" class="input-control-label-left text-left"><i class="icon icon-map-marker">学校:</i></label>
        </div>
      	<div class="input-control has-label-left">
            <select class="form-control " id="site" name="tsite">
             
            </select>
    		  <label for="post" class="input-control-label-left text-left">起始地:</label>
    		</div>
    	<div class="map input-control" style="margin-bottom:8px;">
    		  <div id="container" style="width:100%;height:100%;border:1px solid #D0D0D0;-webkit-border-radius:10px;
	-moz-border-radius:10px;
	border-radius: 5px;"></div>
        </div>
        <input type="hidden" id = "position" name="position">
  		  <div class="input-control has-label-left">
    		  <input id="dest" type="text" class="form-control" placeholder="填写您的收获地址"  name="destination">
    		  <label for="dest" class="input-control-label-left text-left">送达目的地:</label>
    		</div>
      </div>
      
    	<div class="container-fluid information">
    		<div class="input-control has-label-left-lg  form-time information">
    		  <input class="form-control text-right" id="time"type="time" name="time" >
    		  <label for="time" class="input-control-label-left text-left">送达时间:</label>
    		</div>
    		
    		<div class="input-control has-label-left information">
    		  <input name="fee" id="fee" type="number" class="form-control text-right" placeholder="请输入佣金"  value="">
    		  <label for="fee" class="input-control-label-left text-left">佣金:</label>
    		</div>
    		<div class="input-control has-label-left information">
    			<li class="form-control" id="weight" > 
    				<label class="radio-inline">
    				  <input class="we" type="radio" name="radio"  value="2">＞5kg
    				</label>

    				<label class="radio-inline">
    				  <input class="we" type="radio" name="radio" value="1">1-5kg
    				</label>
    				<label class="radio-inline">
    				  <input class="we" type="radio" name="radio" value="0" checked>＜1kg
    				</label>
    			</li>
    		  <label for="weight" class="input-control-label-left text-left">规格:</label>
    		</div>
   		
			<div class="input-control has-label-left information">
    		  <input name="itemNumber" id="itemNumber" type="text" class="form-control text-right" placeholder="" value="">
    		  <label for="itemNumber" class="input-control-label-left text-left">取货码:</label>
    		</div>
        
    		<div class="input-control has-label-left information">
    		  <input name="remark" id="remark" type="text" class="form-control text-right" placeholder="" value="">
    		  <label for="remark" class="input-control-label-left text-left">备注:</label>
    		</div>
    	</div>	
    
    	<div class="pay container-fluid">
    		<input type="submit" value="确认发布" id="pay" class="btn btn-block btn-primary ">
    	</div>
</form>
      <!-- 下方导航 -->
      <div class="menu">
        <ul class="nav nav-primary">
          <li class="">
            <a href="index.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-shouye-xianxing"></use> 
              </svg> 
              <div class="menu-text">
              首页
              </div>
            </a>
          </li>
          <li class="">
            <a href="oc_orderCenter.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-baoguofahuo-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                代取
              </div>
            </a>
          </li>
          <li class="active">
            <a href="issuanceOrders.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-jijianfasong-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                发单
              </div>
            </a>
          </li>
          <li class="">
            <a href="showChat">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-liaotianduihua-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                消息
              </div>
            </a>
          </li>
          <li class="">
            <a href="showMassages">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-yonghu-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                我
              </div>
            </a>
          </li>
        </ul>
      </div>
      <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.11&key=096c6a488c034c4cd5c11a51fb5f542d"></script>
	<script src="js/mapAll.js"></script>
	<script src="js/ajaxfileupload.js"></script>
  </body>
</html>