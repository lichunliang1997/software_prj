
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单管理</title>
    <!-- zui -->
    <link href="css/zui.min.css" rel="stylesheet">
	<link href="css/orderManage.css" rel="stylesheet">
	<script src="js/jquery-1.7.min.js"></script>
	<script src="js/toastr.min.js"></script>
	<script src="https://cdn.goeasy.io/goeasy.js"></script>
  </head>
  <link href="css/toastr.min.css" rel="stylesheet"/>
	<body>
	<input style="display:none;" value="${user.id}" id="channel">
  
		<div class="body">
		<script type="text/javascript">
  	var goEasy=new GoEasy({
  		appkey:"BC-0d6ab878a0a24864a0c5c0e5251e50df"
  	});
  	goEasy.subscribe({
  		channel:$('#channel').val(),
  		onMessage:function(message){
  			var re=eval("("+message.content+")");
  			toastr.options={
  					"positionClass": "toast-top-full-width"
  			};
  			toastr.info(re.talkerId.nickname+"给你发消息啦!");
  		}
  	})
  </script>
		    <!-- 在此处编码你的创意 -->
			<div class="choose dropdown dropdown-hover">
		   		<div class="backIcon">
					<a class="backa" href="showMassages">
						<i class="icon icon-chevron-left "></i>
					</a>	
				</div>
				<font class="fontwei" size="4px" >我的订单</font>	
			</div>
		</div>
		<div class="guide">
			<ul class="nav nav-secondary nav-justified ">
			  <li class=""><a href="orderIndex">全部</a></li>
			  <li><a href="orderIndex?status=0">未接单 <span class="label label-badge label-success"></span></a></li>
			  <li><a href="orderIndex?status=1">运送中<span class="label label-badge label-success"></span></a></li>
			  <li><a href="orderIndex?status=2">已完成<span class="label label-badge label-success"></span></a></li>
			  <li><a href="orderIndex?status=3">其他 <span class="label label-badge label-success"></span></a></li>
			</ul>
		</div>
		<div class="orderBox">
			<c:forEach items="${orderlist }" var= "ca" >
				<c:choose>
					<c:when test="${ca.status==0&&ca.invoiceId.id==user.id}">
						<div class="panel panel-warning">
							<div class="panel-heading panel-warning">
						   		订单类型：等待接单中<i class="icon icon-spinner-snake "></i>
						  	</div>
						  	<div class="panel-body panel-info">
						  		<div class="orderContent">
									<div class="ordDetailsYellow">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime}<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						  		</div>
						 	 </div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
								 	<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
									<a href="orderChange?status=${ca.status}&&oid=${ca.id}">
									 	<button class="btn cancel" type="button">&nbsp;取消此单&nbsp;</button>
								 	</a>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==1&&ca.invoiceId.id==user.id}">
						<div class="panel  panel-danger">
							<div class="panel-heading  panel-danger">
								订单类型：运送中<i class="icon icon-rocket "></i>
							</div>
						  	<div class="panel-body panel-info">
						  		<div class="orderContent">
								  	<div class="ordPic"> <img src="${ca.receiptId.headPortrait}" width="40px" height="40px" class="img-circle" alt="圆形图片"> &nbsp;&nbsp;&nbsp;配送人员：${ca.receiptId.nickname}
										<button class=" btn btn-sm call " type="button" value="${ca.receiptId.id}">联系代跑侠&nbsp;<span class=" icon  icon-chat"></span></button>
								  	</div>
									<div class="ordDetailsOrg">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime}<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						  		</div>
							</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
									<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==2&&ca.invoiceId.id==user.id}">
						<div class="panel  panel-danger">
							<div class="panel-heading  panel-danger">
						   		订单类型：运送中<i class="icon icon-rocket "></i>
						  	</div>
						  	<div class="panel-body panel-info">
						  		<div class="orderContent">
						  			<div class="ordPic"> <img src="${ca.receiptId.headPortrait}" width="40px" height="40px" class="img-circle" alt="圆形图片"> &nbsp;&nbsp;&nbsp;配送人员：${ca.receiptId.nickname}
						  				<button class=" btn btn-sm call " type="button" value="${ca.receiptId.id}">联系代跑侠&nbsp;<span class=" icon  icon-chat"></span></button>
						  			</div>
									<div class="ordDetailsOrg">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime}<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						    	</div>
							</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
								 	<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								 	<a href="orderChange?status=${ca.status}&&oid=${ca.id}"><button  class="btn sended" type="button">&nbsp;确认送达&nbsp;</button></a>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==3&&ca.invoiceId.id==user.id}">
						<div class="panel panel-info">
		  					<div class="panel-heading panel-info">
		   						订单类型：已送达<i class="icon icon-checked "></i>
		  					</div>
		 					<div class="panel-body panel-info">
		  						<div class="orderContent">
		  							<div class="ordPic"> 
		  								<img src="${ca.receiptId.headPortrait}" width="40px" height="40px" class="img-circle" alt="圆形图片"> &nbsp;&nbsp;&nbsp;配送人员：${ca.receiptId.nickname}
		  								<button class=" btn btn-sm call " type="button" value="${ca.receiptId.id}">联系代跑侠&nbsp;<span class=" icon  icon-chat"></span></button>
		  							</div>
									<div class="ordDetailsBlue">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime }<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
		  						</div>
		  					</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
									<button  class=" btn btn-link" type="button">更多详情&nbsp; <span class="icon-fast-forward"></span></button>
								</a> 
								<div class="jude">
									<font size="1">订单已完成，评价一下</font> 
									<a href="om_evaluation.jsp?oid=${ca.id}&&status=${ca.status}&&uId=${ca.receiptId.id}&&commentatorId=${ca.invoiceId.id}">
				 						<button class="btn" type="button">&nbsp;评&nbsp;&nbsp;价&nbsp;</button>
									</a>
				 				</div>
			 				</div>
						</div>
					</c:when>
					<c:when test="${ca.status==4&&ca.invoiceId.id==user.id}">
						<div class="panel panel-success">
						  	<div class="panel-heading panel-success">
						   		订单类型：已取消<i class="icon  "></i>
						  	</div>
						  	<div class="panel-body panel-info">
						 		<div class="orderContent">
									<div class="ordDetailsGreen">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime }<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						  		</div>
						  	</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
									<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==5&&ca.invoiceId.id==user.id}">
						<div class="panel panel-success">
						  	<div class="panel-heading panel-success">
						   		订单类型：已过期<i class="icon  "></i>
						 	</div>
						  	<div class="panel-body panel-info">
						  		<div class="orderContent">
									<div class="ordDetailsGreen">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime }<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						 		 </div>
						  	</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
									<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==6&&ca.invoiceId.id==user.id}">
						<div class="panel panel-info">
							<div class="panel-heading panel-info">
							 	订单类型：已送达<i class="icon icon-checked "></i>
							</div>
							<div class="panel-body panel-info">
								<div class="orderContent">
								  	<div class="ordPic"> 
								  		<img src="${ca.receiptId.headPortrait}" width="40px" height="40px" class="img-circle" alt="圆形图片"> &nbsp;&nbsp;&nbsp;配送人员：${ca.receiptId.nickname}
								  		<button class=" btn btn-sm call " type="button" value="${ca.receiptId.id}">联系用户&nbsp;<span class=" icon  icon-chat"></span></button>
								  	</div>
									<div class="ordDetailsBlue">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime }<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
								</div>
							</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
								 <button class=" btn btn-link" type="button">更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==7&&ca.invoiceId.id==user.id}">
						<div class="panel panel-warning">
						  	<div class="panel-heading panel-warning">
						   		订单类型：等待支付中<i class="icon icon-spinner-snake "></i>
						  	</div>
						  	<div class="panel-body panel-info">
						  		<div class="orderContent">
									<div class="ordDetailsYellow">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime}<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						  		</div>
						  	</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
								 	<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
									<a href="topay?oid=${ca.orderNumber}">
									 	<button class="btn cancel" type="button">&nbsp;现在支付&nbsp;</button>
								 	</a>
								 	<a href="orderChange?status=${ca.status}&&oid=${ca.id}">
										<button class="btn cancel" type="button">&nbsp;取消此单&nbsp;</button>
									</a>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==1&&ca.receiptId.id==user.id}">
						<div class="panel panel-primary">
						  	<div class="panel-heading panel-primary">
						   		订单类型：接单运送中<i class="icon  icon-rocket "></i>
						  	</div>
						  	<div class="panel-body .panel-primary">
						  		<div class="orderContent">
						  			<div class="ordPic"> 
								  		<button class=" btn btn-sm call " type="button" value="${ca.invoiceId.id}">联系用户&nbsp;<span class=" icon  icon-chat"></span></button>
								  	</div>
									<div class="ordDetailsDeepBlue">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime }<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						 		 </div>
						  	</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
								 	<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								 	<a href="orderChange?status=${ca.status}&&oid=${ca.id}"><button class="btn confirm" type="button">&nbsp;确认送达&nbsp;</button></a>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==2&&ca.receiptId.id==user.id}">
						<div class="panel panel-primary">
						  	<div class="panel-heading panel-primary">
						   		订单类型：等待发单方确认<i class="icon  icon-rocket "></i>
						  	</div>
						  	<div class="panel-body .panel-primary">
						  		<div class="orderContent">
						  			<div class="ordPic"> 
								  		<button class=" btn btn-sm call " type="button" value="${ca.invoiceId.id}">联系用户&nbsp;<span class=" icon  icon-chat"></span></button>
								  	</div>
									<div class="ordDetailsDeepBlue">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime }<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						 		 </div>
						  	</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
								 	<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==3&&ca.receiptId.id==user.id}">
						<div class="panel panel-primary">
						  	<div class="panel-heading panel-primary">
						   		已送达<i class="icon  icon-checked "></i>
						  	</div>
						  	<div class="panel-body .panel-primary">
						  		<div class="orderContent">
									<div class="ordDetailsDeepBlue">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime}<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						  		</div>
						  	</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
									<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${ca.status==6&&ca.receiptId.id==user.id}">
						<div class="panel panel-primary">
						  	<div class="panel-heading panel-primary">
						   		已送达<i class="icon  icon-checked "></i>
						  	</div>
						  	<div class="panel-body .panel-primary">
						  		<div class="orderContent">
									<div class="ordDetailsDeepBlue">
										<div class="box1">
											订单编号：${ca.orderNumber }<br>
											发布时间：${ca.invoiceTime}<br>
											快递站点：${ca.delivery.name }<br>
											送达地点：${ca.receipt} <br>
										</div>
										<div class="box2">
											<span style="font-size:15px;">${ca.money}元</span>
										</div>
									</div>
						  		</div>
						 	</div>
							<div class="more">
								<a href="orderDetail?orderid=${ca.orderNumber}">
								 	<button class=" btn btn-link" type="button" >更多详情&nbsp;<span class="icon-fast-forward"></span></button>
								</a>
								<div class="jude">
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</body>
  	<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
    <script src="js/jquery-1.7.min.js"></script>
    <!-- ZUI Javascript组件 -->
    <script src="js/zui.min.js"></script>
    <script type="text/javascript">
	    $('.sending').on('click', function() {
		    new $.zui.Messager('确认货物已送达', {
		        icon: 'bell' // 定义消息图标
		    }).show();
		});
	    $('.sended').on('click', function() {
		    new $.zui.Messager('确认货物已送达', {
		        icon: 'bell' // 定义消息图标
		    }).show();
		});
	    $('.cancel').on('click', function() {
		    new $.zui.Messager('订单已取消', {
		        icon: 'bell' // 定义消息图标
		    }).show();
		});
	    $(".call").live('click',function(){
	   	 window.location.href="ready?sender="+$('#channel').val()+"&reciever="+$(this).val();
	   	 /*
	   	 $.post("chat",{channel:$(this).val(),content:"测试用例"},function(result){
	   		 
	   	 });*/
	    })
	</script>
</html>





