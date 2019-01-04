<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>订单管理</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/manageSystem.css">
	<link rel="stylesheet" type="text/css" href="css/pagination.css">
	<script type="text/javascript" src="js/manageSystem.js"></script>
	<script type="text/javascript" src="js/pagination.js"></script>

	<script src="js/jquery.js"></script>
  	<script src="js/layer/layer.js"></script>
</head>
<body>
	<div class="container">
		<div class="left">
			<div class="logo">
				<img src="images/logo.png">
			</div>
			<div class="user">
				<div class="userImg">
					<img src="images/manager.png">
				</div>
				<div class="userName">${sessionScope.manager.username}</div>
			</div>
			<div class="title">后台管理</div>
			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)" id="userTarget">
				<div class="chooseImg">
					<img src="images/user.png">
				</div>
				<div class="chooseText">用户管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)" id="infoTarget">
				<div class="chooseImg">
					<img src="images/info.png">
				</div>
				<div class="chooseText">个人信息管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="stationTarget">
				<div class="chooseImg">
					<img src="images/school.png">
				</div>
				<div class="chooseText">地区管理</div>
			</div>

			<div class="choose" id="orderChoose" id="orderTarget">
				<div class="chooseImg">
					<img src="images/order.png">
				</div>
				<div class="chooseText">订单管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="tranTarget">
				<div class="chooseImg">
					<img src="images/exchange.png">
				</div>
				<div class="chooseText">交易管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="commentTarget">
				<div class="chooseImg">
					<img src="images/comment.png">
				</div>
				<div class="chooseText">评论管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="noticeTarget">
				<div class="chooseImg">
					<img src="images/msg.png">
				</div>
				<div class="chooseText">通知管理管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="exitTarget">
				<div class="chooseImg">
					<img src="images/exit.png">
				</div>
				<div class="chooseText">退出系统</div>
			</div>

			<script type="text/javascript">
				$('#userTarget').on('click',function(){
					window.location.href = "user.jsp";
				})
				$('#infoTarget').on('click',function(){
					window.location.href = "information.jsp";
				})
				$('#stationTarget').on('click',function(){
					window.location.href = "station.jsp";
				})
				$('#orderTarget').on('click',function(){
					window.location.href = "order.jsp";
				})
				$('#tranTarget').on('click',function(){
					window.location.href = "transaction.jsp";
				})
				$('#commentTarget').on('click',function(){
					window.location.href = "comment.jsp";
				})
				$('#noticeTarget').on('click',function(){
					window.location.href = "notice.jsp";
				})
				$('#exitTarget').on('click',function(){
					
				})
			</script>

		</div>
		<div class="right">
			<div class="rightHead">

				<div class="add" id="addOrder">
					添加订单信息
				</div>
				
				<script type="text/javascript">
					var index=null;
					$('#addOrder').on('click', function(){
						index=layer.open({
							  type: 1 
							  ,area: ['650px', '500px']
							  ,title: '修改订单信息'
							  ,shade: 0.6 
							  ,maxmin: true 
							  ,anim: 1 
							  ,content: 
							  	'<div class="addOrder">'
									+'<table>'
										+'<tr><td class="tdLeft">发单人编号:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">接单人编号:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">收获地点:</td><td><input type="" name=""></td>'
										+'</tr>'
										+'<tr><td class="tdLeft">取货地点经纬度:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">佣金:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">备注:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">发单时间:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">预计收货时间:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">接单时间:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">交易成功时间:</td><td><input type="" name=""></td>'
										+'</tr>'
										+'<tr><td class="tdLeft">状态:</td><td><input type="" name=""></td></tr>'
										+'<tr>'
											+'<td class="tdLeft">规格:</td>'
											+'<td>'
												+'<select style="width: 100%;">'
													+'<option value="little">小(&lt;1kg)</option>'
													+'<option value="middle">中(&lt;5kg)</option>'
													+'<option value="large">大(&gt;5kg)</option>'
												+'</select>'
											+'</td>'
										+'</tr>'
										+'<tr><td class="tdLeft" colspan="2"><button class="addOrderInfo">提交</button></td></tr>'
									+'</table>'
								+'</div>'
							});   
						parent.$('.addOrderInfo').on('click',function(){
							layer.close(index);
						});
					});			
				</script>

				<div class="baidu">
				    <div class="input">
				        <input type="text" id="search"><span class="clear" id="cls">X</span>
				    </div>
   				    <button>按订单编号查询</button>
				</div>

			</div>

			<div class="rightContent">
				<div id="firstTr">
					<div>订单编号</div>
					<div>取货地点</div>
					<div>收获地点</div>
					<div>发单时间</div>
					<div>佣金</div>
					<div>编辑</div>
				</div>

				<div class="contentTr">
					<div>1</div>
					<div>菜鸟驿站</div>
					<div>诚朴园一期3号楼</div>
					<div>2018-12-26</div>
					<div>25￥</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修改</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>2</div>
					<div>申通快递站</div>
					<div>诚朴园一期6号楼</div>
					<div>2018-12-26</div>
					<div>30￥</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修改</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>3</div>
					<div>圆通快递站</div>
					<div>启智园一期4号楼</div>
					<div>2018-11-26</div>
					<div>20￥</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修改</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>4</div>
					<div>菜鸟驿站</div>
					<div>诚朴园一期3号楼</div>
					<div>2018-12-26</div>
					<div>25￥</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修改</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>5</div>
					<div>中通快递站</div>
					<div>诚朴园一期3号楼</div>
					<div>2018-12-26</div>
					<div>40￥</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修改</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

			

				<div id="page">
					<div id="pagination" class="pagination"></div>
					<script>
						var index=null;
						$('.updateTr').on('click', function(){
							index=layer.open({
							  type: 1 
							  ,area: ['650px', '500px']
							  ,title: '修改地区信息'
							  ,shade: 0.6 
							  ,maxmin: true 
							  ,anim: 1 
							  ,content: 
							  	'<div class="addOrder">'
									+'<table>'
										+'<tr><td class="tdLeft">发单人编号:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">接单人编号:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">收获地点:</td><td><input type="" name=""></td>'
										+'</tr>'
										+'<tr><td class="tdLeft">取货地点经纬度:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">佣金:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">备注:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">发单时间:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">预计收货时间:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">接单时间:</td><td><input type="" name=""></td></tr>'
										+'<tr><td class="tdLeft">交易成功时间:</td><td><input type="" name=""></td>'
										+'</tr>'
										+'<tr><td class="tdLeft">状态:</td><td><input type="" name=""></td></tr>'
										+'<tr>'
											+'<td class="tdLeft">规格:</td>'
											+'<td>'
												+'<select style="width: 100%;">'
													+'<option value="little">小(&lt;1kg)</option>'
													+'<option value="middle">中(&lt;5kg)</option>'
													+'<option value="large">大(&gt;5kg)</option>'
												+'</select>'
											+'</td>'
										+'</tr>'
										+'<tr><td class="tdLeft" colspan="2"><button class="updateStationInfo">修改</button></td></tr>'
									+'</table>'
								+'</div>'
							});   
							parent.$('.updateStationInfo').on('click',function(){
								layer.close(index);
							});
						});			
						$('.contentTr').on('mouseover',function(){
							$(this).css({'background-color':'#fde756'});
						})
						$('.contentTr').on('mouseout',function(){
							$(this).css({'background-color':'white'});
						})
						window.onload = function () {
						    new myPagination({
						        id: 'pagination',
						        curPage:1, //初始页码
						        pageTotal: 50, //总页数
								pageAmount: 10,  //每页多少条
						        dataTotal: 50, //总共多少条数据
								pageSize: 5, //可选,分页个数
						        showPageTotalFlag:true, //是否显示数据统计
						        showSkipInputFlag:true, //是否支持跳转
						        getPage: function (page) {
						            //获取当前页数
						            console.log(page);
						        }
						    })
							
						}
					</script>
				</div>
			</div>

		</div>
	</div>
</body>
</html>