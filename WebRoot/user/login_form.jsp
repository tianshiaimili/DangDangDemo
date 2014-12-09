<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>登录 - 当当网</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="/dangdang2/admin/resources/css/style.css"
			type="text/css" media="screen" />
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
		<script type="text/javascript">
			var flag={"username":false,"password":false};
			$(function(){
			//用户名验证
			
				$("#txtUsername").blur(function(){
				    $("#nameMsg").html("");
				    var username=$("#txtUsername").val();
				    if(username==""){
				    	$("#nameMsg").html("用户名不能为空！");
				    	$("#email_null").css("display","block");
						$("#email_error").css("display","none");
						$("#email_success").css("display","none");
						$("#email_zhanyong").css("display","none");
				    	return;
				    }
				    var usernameFormat=/\b(^['_A-Za-z0-9-]+(\.['_A-Za-z0-9-]+)*@([A-Za-z0-9-])+(\.[A-Za-z0-9-]+)*((\.[A-Za-z0-9]{2,})|(\.[A-Za-z0-9]{2,}\.[A-Za-z0-9]{2,}))$)\b/;
				    if(!usernameFormat.test(username)){
				  	  $("#nameMsg").html("用户名格式不正确！");
				    	$("#email_null").css("display","none");
						$("#email_error").css("display","block");
						$("#email_success").css("display","none");
						$("#email_zhanyong").css("display","none");				  	  

				  	  return;
				    }
				   		 $("#email_null").css("display","none");
						$("#email_error").css("display","none");
						$("#email_success").css("display","block");
						$("#email_zhanyong").css("display","none");	
					flag.username=true;
				});
				
			//密码验证
			
				$("#txtPassword").blur(function(){
					$("#passMsg").html("");
					var password=$("#txtPassword").val();
					if(password==""){
						$("#passMsg").html("密码不能为空");
						$("#password_null").css("display","block");
						$("#password_error").css("display","none");
						$("#password_success").css("display","none");	
						return;
					}
					var passwordFormat=/^[a-zA-Z0-9_]{6,20}$/;
					if(!passwordFormat.test(password)){
						$("#passMsg").html("密码格式错误！");
						$("#password_null").css("display","none");
						$("#password_error").css("display","block");
						$("#password_success").css("display","none");	
						return;
					}
						$("#password_null").css("display","none");
						$("#password_error").css("display","none");
						$("#password_success").css("display","block");
					flag.password=true;
				})
			});
			//确定控制
			$(function(){
				$("#ctl00").submit(function(){
					if(flag.username&&flag.password){
						return true;
					}else{
						alert("请检查用户名或密码格式！");
						return false;
					}
				});
			});
		
		</script>
	</head>
	<body>


		<%@include file="../common/head1.jsp"%>

		<div class="enter_part">

			<%@include file="../common/introduce.jsp"%>

			<div class="enter_in">
				<div class="bj_top"></div>
				<div class="center">
					<div style="height: 30px; padding: 5px; color: red"
						id="divErrorMssage">

					</div>
					<div class="main">
						<h3>
							登录当当网
						</h3>

						<form method="post" action="/dangdang2/user/checkUser.action"
							id="ctl00">
							<ul>
								<li>
									<span>请输入Email地址：</span>
									<input type="text" name="user.email" id="txtUsername"
										class="textbox" />

								</li>
								<li>
									<div id="email_null" class="notification information png_bg"
										style="height: 30px;padding-left: 0px;margin: 0px;display: none">
										<div style="height: 20px;padding-left:30px;margin: 0px;">
											Email不能为空!
										</div>
									</div>
									<div id="email_error" class="notification error png_bg"
										style="height: 30px;padding-left: 0px;margin: 0px;display: none">
										<div style="height: 20px;padding-left:30px;margin: 0px;">
											Email格式有问题!
										</div>
									</div>
									<div id="email_zhanyong" class="notification attention png_bg"
										style="height: 30px;padding: 0px;margin: 0px;display: none">
										<div style="height: 20px;padding-left:30px;margin: 0px;">
											Email已被占用
											<a href="login_form.jsp">点击登陆</a>!
										</div>
									</div>
									<div id="email_success" class="notification success png_bg"
										style="height: 30px;padding: 0px;margin: 0px;display: none">
										<div style="height: 20px;padding-left:30px;margin: 0px;">
											Email格式正确!
										</div>
									</div>
								</li>
								<div style="margin-top: 10px;">
									<li>
										<span class="blank">密码：</span>
										<input type="password" name="user.password" id="txtPassword"
											class="textbox" />
									</li>
									<li>
										<div id="password_null"
											class="notification information png_bg"
											style="height: 30px;padding-left: 0px;margin: 0px;display: none">
											<div style="height: 20px;padding-left:30px;margin: 0px;">
												密码不能为空!
											</div>
										</div>
										<div id="password_error" class="notification error png_bg"
											style="height: 30px;padding-left: 0px;margin: 0px;display: none">
											<div style="height: 20px;padding-left:30px;margin: 0px;">
												密码格式有问题!
											</div>
										</div>
										<div id="password_zhanyong"
											class="notification attention png_bg"
											style="height: 30px;padding: 0px;margin: 0px;display: none">
											<div style="height: 20px;padding-left:30px;margin: 0px;">
												密码已被占用!
												<a href="login_form.jsp">点击登陆</a>!
											</div>
										</div>
										<div id="password_success" class="notification success png_bg"
											style="height: 30px;padding: 0px;margin: 0px;display: none">
											<div style="height: 20px;padding-left:30px;margin: 0px;">
												密码格式正确!
											</div>
										</div>
									</li>
									<div style="margin-top: 10px;">
										
											<li>
												<input type="submit" id="btnSignCheck" class="button_enter"
													value="登 录" />


											</li>
											
							</ul>
							<input type="hidden" name="uri" value="${uri}" />
						</form>
					</div>
					<div class="user_new">

						<p class="set_up">
							还不是当当网用户？<a href="register_form.jsp">创建一个新用户&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>

	</body>
</html>

