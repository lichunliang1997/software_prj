<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>用户管理</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/manageSystem.css">
	<script type="text/javascript" src="js/manageSystem.js"></script>
	<script src="js/jquery.js"></script>
   	<script src="js/layer/layer.js"></script>
   	
</head>
<style>
	::-webkit-scrollbar{
  display:none;
}
input{
	border:none;
	background: #e3e8ee;
}
#headPortrait{
	margin-top:3px;
	border-radius: 50%;
}
</style>
<body>


<input type="file" name="userFile" id="userFile" style="display: none;" onchange="filechange(event)">
	<div class="container">
		<div class="left">
			<div class="logo">
				<img src="images/logo66.png">
			</div>
			<div class="user">
				<div class="userImg">
					<img src="images/manager.png">
				</div>
				<div class="userName">${sessionScope.manager.username}</div>
			</div>
			<div class="choose" id="userChoose">
				<div class="chooseImg">
					<img src="images/user.png">
				</div>
				<div class="chooseText">用户管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)" id="infoTarget">
				<div class="chooseImg">
					<img src="images/info.png">
				</div>
				<div class="chooseText">个人信息</div>
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

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="tranTarget">
				<div class="chooseImg">
					<img src="images/comment.png">
				</div>
				<div class="chooseText">评论管理</div>
			</div>

			<div class="choose" onmouseover="change(this)" onmouseout="recover(this)"  id="noticeTarget">
				<div class="chooseImg">
					<img src="images/msg.png">
				</div>
				<div class="chooseText">通知管理</div>
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
				
					var filechange=function(event){
						    var files = event.target.files, file;
						    if (files && files.length > 0) {
						        // 获取目前上传的文件
						        file = files[0];// 文件大小校验的动作
						        if(file.size > 1024 * 1024 * 2) {
						            alert('图片大小不能超过 2MB!');
						            return false;
						        }
						        // 获取 window 的 URL 工具
						        var URL = window.URL || window.webkitURL;
						        // 通过 file 生成目标 url
						        var imgURL = URL.createObjectURL(file);
						        //用attr将img的src属性改成获得的url
						        $("#headPortrait").attr("src",imgURL);
						    }
						};
				
			</script>

		</div>
		<div class="right">
			<div class="rightHead">

				<div class="add" id="addUser">
					添加用户
				</div>
				
				<script type="text/javascript">
					var index=null;
					$('#addUser').on('click', function(){
						index=layer.open({
						  type: 1 
						  ,area: ['250px', '330px']
						  ,title: '添加用户信息'
						  ,shade: 0.6 
						  ,maxmin: true 
						  ,anim: 1 
						  ,content: 
						  	'<div id="addUserInfo">'
								+'<table>'
									+'<tr><td class="tdLeft">用户头像:</td><td align="center"><img id="headPortrait" src="images/addUserImg.png" width="70px" height="70px"></td></tr>'
									+'<tr><td class="tdLeft">昵称:</td><td><input  id="nickname" type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">邮箱:</td><td><input  id="email" type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">密码:</td><td><input  id="password" type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">QQ:</td><td><input  id="qq" type="" name=""></td></tr>'
									+'<tr><td class="tdLeft">微信号:</td><td><input  id="weChat" type="" name=""></td></tr>'
									+'<tr><td  class="tdLeft" colspan="2"><button class="addUserInfo">提交</button></td></tr>'
								+'</table>'
							+'</div>'
						});   
						parent.$('.addUserInfo').on('click',function(){
							var jsonObject={
									"id":"null",
									"headPortrait":$('#headPortrait').attr('src'),
									"nickname":$('#nickname').attr('value'),
									"email":$('#email').attr('value'),
									"password":$('#password').attr('value'),
									"qq":$('#qq').attr('value'),
									"weChat":$('#weChat').attr('value')
							}
							
							
								$.ajaxFileUpload({
						            url: 'add/user',
						            fileElementId:'userFile',
						            dataType:'txt',
						            secureuri : false,
						            data:{jsonString:JSON.stringify(jsonObject)},
						            type:'post',
						            success: function (data){
						               alert('添加用户成功');
						               window.location.reload();
						            }
						        });

							
							layer.close(index);
						});
						parent.$('#headPortrait').on('click',function(){
							$('#userFile').click();
						})
					});			
				</script>

				
				
			</div>

			<div class="rightContent">
				<div id="firstTr">
					<div>用户编号</div>
					<div>昵称</div>
					<div>邮箱</div>
					<div>密码</div>
					<div>QQ号</div>
					<div>编辑</div>
				</div>
				
				<div id="container" style="height: 510px;overflow-y: scroll;">
					<div id="box">
					<c:forEach items="${userList}" var="user">
					<div class="contentTr">
						<div class="userId">${user.id}</div>
						<div>${user.nickname}</div>
						<div>${user.email}</div>
						<div>${user.password}</div>
						<div>${user.qq}</div>
						<!--编辑事件-->
						<div>
							<div class="updateTr">修改</div>
							<div class="deleteTr">删除</div>
							<div class="systemNotices">通知</div>
						</div>
					</div>
					</c:forEach>
					</div>
				</div>
				
				<script type="text/javascript">
					$('#searchByEmail').live('click',function(){
						$.post("get/user/email",{Email:$("#inputByEmail").val()},
								function(result){
									if(result==null){
										alert("该邮箱不存在");
									}
									var re=eval("("+result+")");
									$("#box").html('<div class="contentTr">'
										+'<div class="userId">'+re.id+'</div>'
										+'<div>'+re.nickname+'</div>'
										+'<div>'+re.email+'</div>'
										+'<div>'+re.password+'</div>'
										+'<div>'+re.qq+'</div>'
										+'<div>'
										+'<div class="updateTr">修改</div>'
										+'<div class="deleteTr">删除</div>'
										+'<div class="systemNotices">通知</div>'
										+'</div>'
									+'</div>');
						}
								);
					})
				</script>
				
				
				<script type="text/javascript">
					var page=1;
					$('#container').scroll(function(){
						console.log($(this).height()+"  "+$(this).scrollTop()+"  "+$(this).children('#box').height());
						var left=$(this).height()+$(this).scrollTop();
						var right=$(this).children('#box').height()+25;
						if(left>=right){
							$.post("add/more/user",{page:(++page)},
									function(result){
										if(result!=null){
											var re=eval("("+result+")");
											for(var i=0;i<re.length;++i){
												$('#box').append('<div class="contentTr">'
														+'<div class="userId">'+re[i].id+'</div>'
														+'<div>'+re[i].nickname+'</div>'
														+'<div>'+re[i].email+'</div>'
														+'<div>'+re[i].password+'</div>'
														+'<div>'+re[i].qq+'</div>'
														+'<div>'
														+'<div class="updateTr">修改</div>'
														+'<div class="deleteTr">删除</div>'
														+'<div class="systemNotices">通知</div>'
														+'</div>'
													+'</div>');
											}
										}
									}
							)
						}
					});
				</script>
					
				<script type="text/javascript" src="js/ajaxfileupload.js"></script>
					<script>
					
						var index=null;
					
						$('.deleteTr').live('click',function(){
							var id=$(this).parent().parent().children('.userId').html();
							index=layer.open({
								  type: 1 
								  ,area: ['200px', '130px']
								  ,title: '系统提示:'
								  ,shade: 0.6 
								  ,maxmin: true 
								  ,anim: 1 
								  ,content: 
									 '<br><table style="margin: 0px auto;"><tr><td colspan="2" align="center">是否删除用户</td></tr>'
 								+'<tr><td align="center"><button class="yesDelete">确认</button></td><td><button align="center" class="noDelete">取消</button></td></tr></table>'		  				
								});    
							parent.$('.yesDelete').on('click',function(){
								$.post("delete/user",{id:id},
										function(result){
											alert('success');
								});
								layer.close(index);
								window.location.reload();
							});
							parent.$('.noDelete').on('click',function(){
								
								layer.close(index);
							});
						});
					
						$('.systemNotices').live('click',function(){
							
							index=layer.open({
								  type: 1 
								  ,area: ['275px', '160px']
								  ,title: '系统通知'
								  ,shade: 0.6 
								  ,maxmin: true 
								  ,anim: 1 
								  ,content:
									  '<table bgcolor="#e3e8ee" align="center"><tr><td>通知:</td>'
										+'<td><textarea id="textarea" rows="5" cols="30"></textarea></td></tr><tr>'
										+'<td align="center" colspan="2">'
										+'<button class="yesMsg">通知</button>'
										+'<button class="noMsg">取消</button></td>'
										+'</tr></table>'
								});   
							var id=$(this).parent().parent().children('.userId').html();
							parent.$('.yesMsg').on('click',function(){

								var content=$('#textarea').val();
								$.post("send/notice/user",{id:id,content:content},function(){
									
								});
								layer.close(index);
							})
							parent.$('.noMsg').on('click',function(){
								layer.close(index);
							})
						})
						
						$('.updateTr').live('click', function(){
							$.post("get/user/id",{id:$(this).parent().parent().children('.userId').html()},
									function(result){
										var user=eval("("+result+")");
										console.log(user.nickname);
										index=layer.open({
											  type: 1 
											  ,area: ['250px', '330px']
											  ,title: '修改用户信息'
											  ,shade: 0.6 
											  ,maxmin: true 
											  ,anim: 1 
											  ,content: 
											  	'<div id="updateUserInfo">'
													+'<table>'
													+'<tr><td class="tdLeft">用户头像:</td><td align="center"><img id="headPortrait" src="'+user.headPortrait+'" width="70px" height="70px"></td></tr>'
													+'<tr><td class="tdLeft">昵称:</td><td><input id="nickname" type="text" name="" value="'+user.nickname+'"></td></tr>'
													+'<tr><td class="tdLeft">邮箱:</td><td><input id="email" type="text" name="" value="'+user.email+'"></td></tr>'
													+'<tr><td class="tdLeft">密码:</td><td><input id="password" type="text" name="" value="'+user.password+'"></td></tr>'
													+'<tr><td class="tdLeft">QQ:</td><td><input id="qq" type="text" name="" value="'+user.qq+'"></td></tr>'
													+'<tr><td class="tdLeft">微信号:</td><td><input id="weChat" type="text" name="" value="'+user.weChat+'"></td></tr>'
													+'<tr><td  class="tdLeft" colspan="2"><button class="updateUserInfo">修改</button></td></tr>'
													+'</table>'
												+'</div>'
											});   
											parent.$('.updateUserInfo').on('click',function(){
												  
												var jsonObject={
														id:user.id,
														headPortrait:user.headPortrait,
														nickname:$('#nickname').attr('value'),
														email:$('#email').attr('value'),
														password:$('#password').attr('value'),
														qq:$('#qq').attr('value'),
														weChat:$('#weChat').attr('value')
												}
												
												$.ajaxFileUpload({
										            url: 'update/user',
										            fileElementId:'userFile',
										            dataType:'txt',
										            secureuri : false,
										            data:{jsonString:JSON.stringify(jsonObject)},
										            type:'post',
										            success: function (data){
										               alert('修改用户成功');
										            }
										        });
												
												layer.close(index);
												window.location.reload();
											});
											parent.$('#headPortrait').on('click',function(){
												$('#userFile').click();
											})
									}
								)
							
						});			
						$('.contentTr').on('mouseover',function(){
							$(this).css({'background-color':'#e3e8ee'});
						})
						$('.contentTr').on('mouseout',function(){
							$(this).css({'background-color':'white'});
						})
						window.onload = function () {
						
						}
					</script>
									
			</div>

		</div>
	</div>
</body>
</html>