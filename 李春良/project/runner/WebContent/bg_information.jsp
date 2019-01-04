<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人信息管理</title>
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

			<div class="choose" id="informationChoose" id="infoTarget">
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

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="orderTarget">
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

				<div class="baidu">
				    <div class="input">
				        <input type="text" id="search"><span class="clear" id="cls">X</span>
				    </div>
   				    <button>按编号查询</button>
				</div>

				<div class="baidu">
				    <div class="input">
				        <input type="text" id="search"><span class="clear" id="cls">X</span>
				    </div>
   				    <button>按学号查询</button>
				</div>

			</div>

			<div class="rightContent">
				<div id="firstTr">
					<div>用户编号</div>
					<div>姓名</div>
					<div>性别</div>
					<div>年龄</div>
					<div>生日</div>
					<div>编辑</div>
				</div>

				<div class="contentTr">
					<div>1</div>
					<div>黎明</div>
					<div>男</div>
					<div>25</div>
					<div>1997-12-26</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修补</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>2</div>
					<div>黎明</div>
					<div>男</div>
					<div>25</div>
					<div>1997-12-26</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修补</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>3</div>
					<div>黎明</div>
					<div>男</div>
					<div>25</div>
					<div>1997-12-26</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修补</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>4</div>
					<div>黎明</div>
					<div>男</div>
					<div>25</div>
					<div>1997-12-26</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修补</div>
						<div class="deleteTr">删除</div>
					</div>
				</div>

				<div class="contentTr">
					<div>5</div>
					<div>黎明</div>
					<div>男</div>
					<div>25</div>
					<div>1997-12-26</div>
					<!--编辑事件-->
					<div>
						<div class="updateTr">修补</div>
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
							  ,area: ['680px', '600px']
							  ,title: '修改个人信息'
							  ,shade: 0.6 
							  ,maxmin: true 
							  ,anim: 1 
							  ,content: 
							  	'<div class="addInformation">'
								+'<table>'
									+'<tr><td class="tdLeft">姓名:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">性别:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">年龄:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">生日:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">手机号:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">学号:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">专业:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">班级:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">年级:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">学院:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">学校:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">账户余额:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">银行卡号:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">代取押金:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">信用评分:</td><td><input type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">支付密码:</td><td><input type="" name=""></td></tr>'
									+'<tr>'
										+'<td colspan="2"><img src="images/addUserImg.png" width="250px" height="120px" alt="一卡通正面"><img src="images/addUserImg.png" width="250px" height="120px"></td>'
									+'</tr>'
									+'<tr><td class="tdLeft" colspan="2"><button class="updateInformationInfo">提交</button></td></tr>'
								+'</table>'
							+'</div>'
							});   
							parent.$('.updateInformationInfo').on('click',function(){
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