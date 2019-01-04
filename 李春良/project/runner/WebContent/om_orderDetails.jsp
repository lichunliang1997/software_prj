<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单详情</title>
     <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="css/om_orderDetails.css" rel="stylesheet" type="text/css"/>
            
    <!-- zui -->
    <link href="css/zui.min.css" rel="stylesheet">
       <!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
    <script src="js/jquery-1.7.min.js"></script>
    <!-- ZUI Javascript组件 -->
    <script src="js/zui.min.js"></script>
    <style type="text/css">
	#container{

		float:left ;
		width:100%;
		height:320px;
		margin-bottom:2%;
		border:2px solid lightgray;
	}
    </style>
    <script src="https://webapi.amap.com/maps?v=1.4.8&key=b6357af7e5eb44585f533ed85e6c238f&callback=init&plugin=AMap.PlaceSearch,AMap.AdvancedInfoWindow,AMap.Walking"></script>
    <script>
    window.init = function(){
    	var position = new AMap.LngLat(114.520803,37.997898);
    	var map = new AMap.Map('container', {
            resizeEnable: true,
            center: position,
            zoom: 15
        });
        var marker1 = new AMap.Marker({
            position:[ ${order.delivery.lnglat}]
       })//快递站点
       var marker2 = new AMap.Marker({
            position: [${order.destLnglat}]
       })//送达地点
       marker1.setLabel({
           //修改label相对于maker的位置
           offset: new AMap.Pixel(20, 0),
           content: "<div class='info'>${order.delivery.name}</div>"
       });
        marker2.setLabel({
            //修改label相对于maker的位置
            offset: new AMap.Pixel(20, 0),
            content: "<div class='info'>${order.receipt}</div>"
        });
       var markerList = [marker1, marker2];
        map.add(markerList)
       map.setFitView();//自适应 
    }
    </script>
	<body>

<c:choose>
<c:when test="${order.status==0&&order.invoiceId.id==user.id}">  <!--   等待接单中 -->
	
		 <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
              
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                        <div class="text"> 等待接单中</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
                <div class="aui-flex">
                    <div class="aui-flex-add">
                        <img src="images/icon-add.png" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h3>
                            &nbsp;运送地点
                        </h3>
                        <p>${order.receipt}</p>
                    </div>
                </div>
                <div class="divHeight"></div>
                <div class="">
              




  <div class="panel ">
    <div class="panel-heading" >
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordionPanels" href="#collapseOne">
          <div class="aui-flex">
                    <div class="aui-shop-item">
                        <img src="images/maplogo.png" alt="">
                    </div > 
                    <div class="aui-shop-item-arrow">查看地图
                    </div>
                </div>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">  <div id="container"></div></div>
    </div>
  </div>



                </div>
                 <div class="aui-flex-box" style="color:#333; font-size:15px;">
                           &nbsp;  &nbsp;配送费：<em style="color:#333">￥${order.money}</em>
                        </div>
                <div class="divHeight b-line"></div>

                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>下单时间:</em>
                            ${order.invoiceTime}
                        </p>
                         
                    </div>
                    
                </div>
                <div class="aui-confirm-flex contact1">
                   
                    <a href="orderChange?status=${order.status}&&oid=${order.id}" class="aui-modify-btn delete">
                        <img class="talkimg" src="images/cancel.png"  alt="">
                       取消订单
                    </a>
                </div>
                <div class="aui-like">
                   
                </div>
               
            </section>
           
        </section>

</c:when>



<c:when test="${order.status==7&&order.invoiceId.id==user.id}">  <!--   等待支付中 -->
	
		 <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
              
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                        <div class="text"> 等待支付中</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
                <div class="aui-flex">
                    <div class="aui-flex-add">
                        <img src="images/icon-add.png" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h3>
                            &nbsp;运送地点
                        </h3>
                        <p>${order.receipt}</p>
                    </div>
                </div>
                <div class="divHeight"></div>
                <div class="">
              




  <div class="panel ">
    <div class="panel-heading" >
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordionPanels" href="#collapseOne">
          <div class="aui-flex">
                    <div class="aui-shop-item">
                        <img src="images/maplogo.png" alt="">
                    </div > 
                    <div class="aui-shop-item-arrow">查看地图
                    </div>
                </div>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">  <div id="container"></div></div>
    </div>
  </div>



                </div>
                 <div class="aui-flex-box" style="color:#333; font-size:15px;">
                           &nbsp;  &nbsp;配送费：<em style="color:#333">￥${order.money}</em>
                        </div>
                <div class="divHeight b-line"></div>

                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>下单时间:</em>
                            ${order.invoiceTime}
                        </p>
                         
                    </div>
                    
                </div>
               <div class="aui-confirm-flex">
                     <a href="orderChange?status=${order.status}&&oid=${order.id}" class="aui-modify-btn delete">
                        <img class="talkimg" src="images/cancel.png"  alt="">
                       取消订单
                    </a>
                    <a href="topay?oid=${order.orderNumber}" class="aui-modify-btn delete">
                       <img src="images/pay.png"   alt="">
                       现在支付
                    </a>
                </div>
                <div class="aui-like">
                   
                </div>
               
            </section>
           
        </section>

</c:when>










<c:when test="${(order.status==1||order.status==2)&&order.invoiceId.id==user.id}"><!--  运送中 -->
	
      <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
              
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                           <div class="text"> 接单运送中</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
                <div class="aui-flex">
                    <div class="aui-flex-add">
                        <img src="images/icon-add.png" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h3>
                            &nbsp;运送地点
                        </h3>
                        <p>${order.receipt}</p>
                    </div>
                </div>
                <div class="divHeight"></div>
                <div class="">
              




  <div class="panel ">
    <div class="panel-heading" >
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordionPanels" href="#collapseOne">
          <div class="aui-flex">
                    <div class="aui-shop-item">
                        <img src="images/maplogo.png" alt="">
                    </div > 
                    <div class="aui-shop-item-arrow">查看地图
                    </div>
                </div>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">  <div id="container"></div></div>
    </div>
  </div>



                </div>
                 <div class="aui-flex-box" style="color:#333; font-size:15px;">
                           &nbsp;  &nbsp;配送费：<em style="color:#333">￥${order.money}</em>
                        </div>
                <div class="divHeight b-line"></div>

                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>下单时间:</em>
                            ${order.invoiceTime}
                        </p>
                         
                    </div>
                    
                </div>
                <div class="aui-confirm-flex">
                    <a href="ready?sender=${user.id}&&reciever=${order.receiptId.id}" class="aui-modify-btn modify">
                        <img src="images/talk.png"   alt="">
                        联系代跑侠
                    </a>
                    <a href="wtai://wp/mc;${order.receiptId.information.phone}" class="aui-modify-btn delete">
                       <img src="images/phone.png"   alt="">
                       拨打电话
                    </a>
                </div>
                <div class="aui-like">
                   
                </div>
               
            </section>
           
        </section>
</c:when>

<c:when test="${(order.status==1||order.status==2)&&order.receiptId.id==user.id}"> <!-- 运送中接单方 -->
	
		<section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
              
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                           <div class="text"> 接单运送中</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
                <div class="aui-flex">
                    <div class="aui-flex-add">
                        <img src="images/icon-add.png" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h3>
                            &nbsp;运送地点
                        </h3>
                        <p>${order.receipt}</p>
                    </div>
                </div>
                <div class="divHeight"></div>
                <div class="">
              




  <div class="panel ">
    <div class="panel-heading" >
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordionPanels" href="#collapseOne">
          <div class="aui-flex">
                    <div class="aui-shop-item">
                        <img src="images/maplogo.png" alt="">
                    </div > 
                    <div class="aui-shop-item-arrow">查看地图
                    </div>
                </div>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">  <div id="container"></div></div>
    </div>
  </div>



                </div>
                 <div class="aui-flex-box" style="color:#333; font-size:15px;">
                           &nbsp;  &nbsp;配送费：<em style="color:#333">￥${order.money}</em>
                        </div>
                <div class="divHeight b-line"></div>

                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>下单时间:</em>
                            ${order.invoiceTime}
                        </p>
                        <p>
                            <em>备注:</em>
                            ${order.remarks}
                        </p>
                        <p>
                            <em>发单人姓名:</em>
                            ${order.invoiceId.information.name}
                        </p>
                        <p>
                            <em>发单人手机:</em>
                            ${order.invoiceId.information.phone}
                        </p>
                        <p>
                            <em>取货号:</em>
                            ${order.itemNumber}
                        </p>
                    </div>
                    
                </div>
                <div class="aui-confirm-flex">
                    <a href="ready?sender=${user.id}&&reciever=${order.invoiceId.id}" class="aui-modify-btn modify">
                        <img src="images/talk.png"   alt="">
                        联系用户
                    </a>
                    <a href="wtai://wp/mc;${order.invoiceId.information.phone}" class="aui-modify-btn delete">
                       <img src="images/phone.png"   alt="">
                       拨打电话
                    </a>
                </div>
                </div>
                <div class="aui-like">
                   
                </div>
               
            </section>
           
        </section>


</c:when>

<c:when test="${order.status==3&&order.invoiceId.id==user.id}"> <!-- 已送达 未评价 -->
	  <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
               
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                          <div class="text"> 订单已送达</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
                <div class="aui-flex">
                    <div class="aui-flex-add">
                        <img src="images/icon-add.png" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h3>
                            送达地点
                        </h3>
                        <p>${order.receipt}</p>
                    </div>
                </div>
                <div class="divHeight"></div>
               
                
                <div class="aui-cp-edu b-line">
                    <div class="aui-san-sml"></div>
                    
                        <div class="aui-flex-box" style="color:#333; font-size:15px;">
                            配送费：<em style="color:#333">￥${order.money}</em>
                        </div>
                    </div>
                </div>
                <div class="divHeight b-line"></div>
                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>下单时间:</em>
                            ${order.invoiceTime}
                        </p>
                         <p>
                            <em>送达时间:</em>
                            ${order.successTime}
                        </p>
                         <p>
                            <em>备注:</em>
                            ${order.remarks}
                        </p>
                    </div>
                    
                </div>
               
                   <div class="aui-confirm-flex">
                    <a href="ready?sender=${user.id}&&reciever=${order.receiptId.id}" class="aui-modify-btn modify">
                        <img src="images/talk.png"   alt="">
                        联系代跑侠
                    </a>
                    <a href="om_evaluation.jsp?oid=${order.id}&&status=${order.status}&&uId=${order.receiptId.id}&&commentatorId=${order.invoiceId.id}" class="aui-modify-btn delete">
                       立即评价
                    </a>
                </div>
                <div class="aui-like">
    					 <img src="images/footerimg.jpg" alt="">
                </div>
               
            </section>
            <div class="aui-like">
                  
                </div>
        </section>
		
		</c:when>

<c:when test="${order.status==4&&order.invoiceId.id==user.id}"> <!-- 已取消 -->
		   <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
                
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                           <div class="text"> 取消订单</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
               
                   
                </div>
               
                
                <div class="aui-commodity-bg">
                  
                </div>
              
                <div class="aui-cp-edu b-line">
                    <div class="aui-san-sml"></div>
                    订单已取消
                    </div>
                </div>
                <div class="divHeight b-line"></div>
                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>发布时间:</em>
                            ${order.invoiceTime}
                        </p>
                            <p>
                            <em>设置赏金:</em>
                            ¥3
                        </p>

                         <p>
                            <em>备注:</em>
                            ${order.remarks}
                        </p>
                    </div>
                    
                </div>
                <div class="aui-confirm-flex">
                   
                   
                </div>
                <div class="aui-like">
                    <img src="images/footerimg.jpg" alt="">
                </div>
               
            </section>
         <div class="aui-like">
                   
                </div>
        </section>
		
		</c:when>
		
<c:when test="${order.status==5&&order.invoiceId.id==user.id}"><!-- 已过期 -->
		  <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
                
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                           <div class="text"> 过期订单</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
               
                   
                </div>
               
                
                <div class="aui-commodity-bg">
                  
                </div>
              
                <div class="aui-cp-edu b-line">
                    <div class="aui-san-sml"></div>
                    订单已过期
                    </div>
                </div>
                <div class="divHeight b-line"></div>
                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>发布时间:</em>
                            ${order.invoiceTime}
                        </p>
                            <p>
                            <em>设置赏金:</em>
                            ¥3
                        </p>

                         <p>
                            <em>备注:</em>
                            ${order.remarks}
                        </p>
                    </div>
                    
                </div>
                <div class="aui-confirm-flex">
                   
                   
                </div>
                <div class="aui-like">
                    <img src="images/footerimg.jpg" alt="">
                </div>
               
            </section>
         <div class="aui-like">
                   
                </div>
        </section>
		
		</c:when>
		
<c:when test="${order.status==6&&order.invoiceId.id==user.id}"> <!-- 已完成 已评价 -->
		    <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
               
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                            <div class="text"> 订单已送达</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
                <div class="aui-flex">
                    <div class="aui-flex-add">
                        <img src="images/icon-add.png" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h3>
                            送达地点
                        </h3>
                        <p>${order.receipt}</p>
                    </div>
                </div>
                <div class="divHeight"></div>
               
                
                <div class="aui-cp-edu b-line">
                    <div class="aui-san-sml"></div>
                    
                        <div class="aui-flex-box" style="color:#333; font-size:15px;">
                            配送费：<em style="color:#333">￥${order.money}</em>
                        </div>
                    </div>
                </div>
                <div class="divHeight b-line"></div>
                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>下单时间:</em>
                            ${order.invoiceTime}
                        </p>
                         <p>
                            <em>送达时间:</em>
                            ${order.successTime}
                        </p>
                         <p>
                            <em>备注:</em>
                            ${order.remarks}
                        </p>
                    </div>
                    
                </div>
               
                 <div class="aui-confirm-flex">
                    <a href="ready?sender=${user.id}&&reciever=${order.receiptId.id}" class="aui-modify-btn modify">
                        <img src="images/talk.png"   alt="">
                        联系代跑侠
                    </a>
                    <a href="wtai://wp/mc;${order.receiptId.information.phone}" class="aui-modify-btn delete">
                       <img src="images/phone.png"   alt="">
                       拨打电话
                    </a>
                </div>
                <div class="aui-like">
                   <img src="images/footerimg.jpg" alt="">
                </div>
               
            </section>
            <div class="aui-like">
                    
                </div>
        </section>
            
           </c:when> 

<c:when test="${(order.status==3||order.status==6)&&order.receiptId.id==user.id}"> <!-- 已完成 已评价 接单方-->
		    <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="orderIndex" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    订单详情
                
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
               
            </header>
            <section class="aui-scrollView">
                <div class="aui-pay-change">
                    <div class="aui-flex">
                        <div class="aui-flex-box">
                            <div class="text"> 订单已送达</div>
                            <p></p>
                        </div>
                        <div class="aui-pay-zfb">
                            <img src="images/logo.png"  height="50px" width="50px" alt="">
                        </div>
                    </div>
                </div>
                <div class="aui-flex">
                    <div class="aui-flex-add">
                        <img src="images/icon-add.png" alt="">
                    </div>
                    <div class="aui-flex-box">
                        <h3>
                            送达地点
                        </h3>
                        <p>${order.receipt}</p>
                    </div>
                </div>
                <div class="divHeight"></div>
               
                
                <div class="aui-cp-edu b-line">
                    <div class="aui-san-sml"></div>
                    
                        <div class="aui-flex-box" style="color:#333; font-size:15px;">
                            配送费：<em style="color:#333">￥${order.money}</em>
                        </div>
                    </div>
                </div>
                <div class="divHeight b-line"></div>
                <div class="aui-flex aui-flex-text-sml b-line">
                    <div class="aui-flex-box">
                        <p>
                            <em>快递规格:</em>
                            <c:if test="${order.size==0}">小型快递</c:if>
                            <c:if test="${order.size==1}">中型快递</c:if>
                            <c:if test="${order.size==2}">大型快递</c:if>
                        </p>
                        <p>
                            <em>订单编号:</em>
                            ${order.orderNumber}
                        </p>
                        <p>
                            <em>快递站点:</em>
                           ${order.delivery.name}
                        </p>
                        <p>
                            <em>下单时间:</em>
                            ${order.invoiceTime}
                        </p>
                         <p>
                            <em>送达时间:</em>
                            ${order.successTime}
                        </p>
                         <p>
                            <em>备注:</em>
                            ${order.remarks}
                        </p>
                    </div>
                    
                </div>
               
                 <div class="aui-confirm-flex">
                    <a href="ready?sender=${user.id}&&reciever=${order.invoiceId.id}" class="aui-modify-btn modify">
                        <img src="images/talk.png"   alt="">
                        联系用户
                    </a>
                    <a href="wtai://wp/mc;${order.invoiceId.information.phone}" class="aui-modify-btn delete">
                       <img src="images/phone.png"   alt="">
                       拨打电话
                    </a>
                </div>
                <div class="aui-like">
                     <img src="images/footerimg.jpg" alt="">
                </div>
               
            </section>
            <div class="aui-like">
                  
                </div>
        </section>
        </c:when> 
	</c:choose>


	</body>




</html>
