<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>当当网后台管理系统</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="resources/scripts/facebox.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
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
				    	return;
				    }
			    var usernameFormat=/^[a-zA-Z0-9_]{4,20}$/;
				    if(!usernameFormat.test(username)){
				  	  $("#nameMsg").html("用户名格式不正确！");
				  	  return;
				    }
					flag.username=true;
				});
				
			//密码验证
			
				$("#txtPassword").blur(function(){
					$("#passMsg").html("");
					var password=$("#txtPassword").val();
					if(password==""){
						$("#passMsg").html("密码不能为空");
						return;
					}
					var passwordFormat=/^[a-zA-Z0-9_]{6,20}$/;
					if(!passwordFormat.test(password)){
						$("#passMsg").html("密码格式错误！");
						return;
					}
					flag.password=true;
				})
			});
			//确定控制
			$(function(){
				$("#ct").submit(function(){
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
<body id="login">
<div id="login-wrapper" class="png_bg">
  <div id="login-top">
    <h1>当当网后台管理系统</h1>
    <!-- Logo (221px width) -->
    <a href="#"><img id="logo" src="resources/images/logo.png" alt="Simpla Admin logo" /></a> </div>
  <!-- ���� #logn-top -->
  <div id="login-content">
    <form id="ct" action="../admin/checkAdmin.action" method="post"  >
      <div class="notification information png_bg">
        <div> 请输入管理员用户名，密码登陆后台. </div>
      </div>
      <p>
        <label>用户名</label>
        <input class="text-input" type="text"  name="name" id="txtUsername"/>
       </p>
       <p>
     
      </p>
      <div class="clear"></div>
      <p>
        <label>密码</label>
        <input class="text-input" type="password" name="password" id="txtPassword"/>
      </p>
      <div class="clear"></div>
      <p id="remember-password">
        <input type="checkbox" />
        记住用户名 </p>
      <div class="clear"></div>
      <p>
        <input class="button" type="submit" value="登陆" />
      </p>
</form>
  </div>
  <!-- End #login-content -->
</div>
<!-- End #login-wrapper -->
</body>
</html>
