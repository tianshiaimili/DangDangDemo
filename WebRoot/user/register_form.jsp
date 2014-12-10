<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 当当网</title>
		<!-- Main Stylesheet -->
		<link rel="stylesheet" href="../admin/resources/css/style.css" type="text/css" media="screen" />
		<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
		<script type="text/javascript">
			var flag = {"email":false,"nickname":false,"password":false,"password1":false,"number":false};
			$(function(){
				//邮箱验证
				$("#txtEmail").blur(function(){
				$("#email\\.info").html("");
				var emailTxt =  $(this).val();
					if($("#txtEmail").val()==""){
						$("#email\\.info").html("Email不能为空！");
						
						$("#email_null").css("display","block");
						$("#email_error").css("display","none");
						$("#email_success").css("display","none");
						$("#email_zhanyong").css("display","none");
						return;
					}
					var emailFormat=/\b(^['_A-Za-z0-9-]+(\.['_A-Za-z0-9-]+)*@([A-Za-z0-9-])+(\.[A-Za-z0-9-]+)*((\.[A-Za-z0-9]{2,})|(\.[A-Za-z0-9]{2,}\.[A-Za-z0-9]{2,}))$)\b/;
					if(!emailFormat.test(emailTxt)){
						$("#email\\.info").html("Email格式不正确！");
						$("#email_null").css("display","none");
						$("#email_error").css("display","block");
						$("#email_success").css("display","none");
						$("#email_zhanyong").css("display","none");
						return;
					}
					$.post(
					"validEmail.action",
					{"email":emailTxt},
					function(data){
						if(data){
							$("#email\\.info").html("Email地址可以使用！");
							$("#email_null").css("display","none");
							$("#email_error").css("display","none");
							$("#email_success").css("display","block");
							$("#email_zhanyong").css("display","none");
							flag.email=true;
					//		alert(flag.email)
						}else{
							$("#email\\.info").html("Email已被占用！");
							$("#email_null").css("display","none");
							$("#email_error").css("display","none");
							$("#email_success").css("display","none");
							$("#email_zhanyong").css("display","block");
						}
					}
					);
				});
				//用户名验证
				$("#txtNickname").blur(function(){
					$("#name\\.info").html("");
					var nicknameTxt=$("#txtNickname").val();
					if(nicknameTxt==""){
						$("#name\\.info").html("昵称不能为空！");
						$("#nick_null").css("display","block");
						$("#nick_error").css("display","none");
						$("#nick_success").css("display","none");
						$("#nick_zhanyong").css("display","none");
						return;
					}
					var nicknameFormat=/^[a-zA-Z0-9_]{4,20}$/;
					if(!nicknameFormat.test(nicknameTxt)){
						$("#name\\.info").html("昵称格式不正确！");
						$("#nick_null").css("display","none");
						$("#nick_error").css("display","block");
						$("#nick_success").css("display","none");
						$("#nick_zhanyong").css("display","none");
						return;
					}
					$.post(
					"validNickname.action",
					{"nickname":nicknameTxt},
					function(data){
						if(data){
							$("#name\\.info").html("昵称可以使用！");
							$("#name\\.info").html("昵称格式不正确！");
							$("#nick_null").css("display","none");
							$("#nick_error").css("display","none");
							$("#nick_success").css("display","block");
							$("#nick_zhanyong").css("display","none");
							flag.nickname=true;
						//	alert(flag.nickname)
						}else{
							$("#name\\.info").html("昵称以被占用！");
							$("#nick_null").css("display","none");
							$("#nick_error").css("display","none");
							$("#nick_success").css("display","none");
							$("#nick_zhanyong").css("display","block");
						}
					}
					);
				});
				//密码验证 非空,6-20个字符
				$("#txtPassword").blur(function(){
					$("#password\\.info").html("");
					var passwordTxt=$("#txtPassword").val();
					if(passwordTxt==""){
						$("#password\\.info").html("密码不能为空！");
						$("#password_null").css("display","block");
						$("#password_error").css("display","none");
						$("#password_success").css("display","none");			
						return;
					}
					var passwordFormat=/^[a-zA-Z0-9_]{6,20}$/;
					if(!passwordFormat.test(passwordTxt)){
						$("#password\\.info").html("密码格式不正确！");
						$("#password_null").css("display","none");
						$("#password_error").css("display","block");
						$("#password_success").css("display","none");							
						return;
					}else{
						$("#password\\.info").html("密码可以使用！");
						$("#password_null").css("display","none");
						$("#password_error").css("display","none");
						$("#password_success").css("display","block");							
						flag.password=true;
					//	alert(flag.password)
						return;
					}
				});
				//重复输入密码验证 非空 与第一次输入的密码一致。
				$("#txtRepeatPass").blur(function(){
					$("#password1\\.info").html("");
					var password1Txt=$("#txtRepeatPass").val();
					if(password1Txt==""){
						$("#password1\\.info").html("再次输入密码不能为空！");
						$("#password1_null").css("display","block");
						$("#password1_zhanyong").css("display","none");
						$("#password1_success").css("display","none");							
						return;
					}
					var passwordTxt=$("#txtPassword").val();
					if(passwordTxt!=password1Txt){
						$("#password1\\.info").html("两次输入的密码不一致！");
						$("#password1_null").css("display","none");
						$("#password1_zhanyong").css("display","block");
						$("#password1_success").css("display","none");							
						return;
					}else{
						$("#password1\\.info").html("输入正确！");
						$("#password1_null").css("display","none");
						$("#password1_zhanyong").css("display","none");
						$("#password1_success").css("display","block");							
						flag.password1=true;
					//	alert(flag.password1)
						return;
					}
				});
				$("#txtVerifyCode").blur(function(){
					$("#number\\.info").html("");
					var numberTxt=$(this).val();
					if(numberTxt==""){
						$("#number\\.info").html("验证码不能为空！");
						$("#code_null").css("display","block");
						$("#code_error").css("display","none");
						$("#code_success").css("display","none");								
						return;
					}
					$.post(
					"checkNumber.action",
					{"code":numberTxt},
					function(data){
						if(data){
							$("#number\\.info").html("验证码输入正确！");
							$("#code_null").css("display","none");
							$("#code_error").css("display","none");
							$("#code_success").css("display","block");								
							flag.number=true;
						//	alert(flag.number)
						}else{
							$("#number\\.info").html("验证码错误！");
							$("#code_null").css("display","none");
							$("#code_error").css("display","block");
							$("#code_success").css("display","none");	
						}
				}
				);
				});
				
			
			});
			//注册按钮控制
			$(function(){
				$("#f").submit(function(){
					var ok=flag.email&&flag.nickname&&flag.password&&flag.password1&&flag.number;
					if(ok){
						return true;
					}else{
					//	alert(ok);
					//	alert("请检查表单项数据格式");
					$("#txtEmail").blur();
					$("#txtNickname").blur();
					$("#txtPassword").blur();
					$("#txtRepeatPass").blur();
					$("#txtVerifyCode").blur();
						return false;
					}
				});
			});
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			注册步骤:
			<span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
		</div>
		<div class="fill_message">
			<form name="ctl00" method="post" action="register.action" id="f">
				<h2>
					以下均为必填项
				</h2>
				<table class="tab_login" >
					<tr >
						<td  valign="top" class="w1">
							请填写您的Email地址：
						</td>
						<td >
							<input name="user.email" type="text" id="txtEmail" class="text_input"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。
								</p>
							<div   id="email_null" class="notification information png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >Email不能为空!</div>
  						    </div>
  						    <div   id="email_error" class="notification error png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >Email格式有问题!</div>
  						    </div>
							<div id="email_zhanyong" class="notification attention png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >Email已被占用<a href="login_form.jsp">点击登陆</a>!</div>
  						    </div>
  						    <div id="email_success" class="notification success png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >Email格式正确!</div>
  						    </div>
						

  						    </div>
						</td>
						

					</tr>
					<tr>
						<td valign="top" class="w1">
							设置您在当当网的昵称：
						</td>
						<td>
							<input name="user.nickname" type="text" id="txtNickname" class="text_input" />
							<div class="text_left" id="nickNameValidMsg">
								<p>
									您的昵称可以由小写英文字母、中文、数字组成，
								</p>
								<p>
									长度4－20个字符，一个汉字为两个字符。
								</p>
							<div   id="nick_null" class="notification information png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >昵称不能为空!</div>
  						    </div>
  						    <div   id="nick_error" class="notification error png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >昵称格式有问题!</div>
  						    </div>
							<div id="nick_zhanyong" class="notification attention png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >昵称已被占用!</div>
  						    </div>
  						    <div id="nick_success" class="notification success png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >昵称格式正确!</div>
  					
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置密码：
						</td>
						<td>
							<input name="user.password" type="password" id="txtPassword"
								class="text_input" />
							<div class="text_left" id="passwordValidMsg">
								<p>
									您的密码可以由大小写英文字母、数字组成，长度6－20位。
								</p>
								<div   id="password_null" class="notification information png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >密码不能为空!</div>
	  						    </div>
	  						    <div   id="password_error" class="notification error png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >密码格式有问题!</div>
	  						    </div>
								<div id="password_zhanyong" class="notification attention png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >密码已被占用!<a href="login_form.jsp">点击登陆</a>!</div>
	  						    </div>
	  						    <div id="password_success" class="notification success png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >密码格式正确!</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							再次输入您设置的密码：
						</td>
						<td>
							<input name="password1" type="password" id="txtRepeatPass"
								class="text_input"/>
							<div class="text_left" id="repeatPassValidMsg">
								<div   id="password1_null" class="notification information png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >再次输入密码不能为空!</div>
	  						    </div>
	  						    <div   id="password1_error" class="notification error png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >再次输入密码格式有问题!</div>
	  						    </div>
								<div id="password1_zhanyong" class="notification attention png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >两次输入的密码不一致!</div>
	  						    </div>
	  						    <div id="password1_success" class="notification success png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >格式正确!</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							验证码：
						</td>
						<td>
							<img class="yzm_img" id='imgVcode' src="code.action" />
							<input name="number" type="text" id="txtVerifyCode"
								class="yzm_input"/>
							<div class="text_left t1">
								<p class="t1">
									<span id="vcodeValidMsg">请输入图片中的内容。</span>
									<a href="javascript:;" onclick="document.getElementById('imgVcode').src = 'code?'+Math.random()">看不清楚？换个图片</a>
								<div   id="code_null" class="notification information png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none; float: left;" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >验证码不能为空!</div>
	  						    </div>
	  						    <div   id="code_error" class="notification error png_bg" style="height: 30px;padding-left: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >验证码错误!</div>
	  						    </div>
	  						    <div id="code_success" class="notification success png_bg" style="height: 30px;padding: 0px;margin: 0px;display: none" >
	    						 	<div style="height: 20px;padding-left:30px;margin: 0px;" >验证码正确!</div>
								</div>
		
									
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">

					<input id="btnClientRegister" class="button_1" name="submit"  type="submit" value="注 册"/>
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

