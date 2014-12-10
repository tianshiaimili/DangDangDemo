<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link href="../css/book_head090107.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
	<script type="text/javascript">
	 $(function(){
	 	$("#exit").click(function(){
	 		$.post(
	 		"../user/userExit.action"
	 		);
	 	});
	 });
	</script>	
<div class="head_container">
	<div class="head_welcome">
		<div class="head_welcome_right">
			<span class="head_welcome_text"> </span>
			<span class="head_welcome_text"> <span class="little_n">
					| <a href="#" name="mydangdang" class="head_black12a">我的当当</a> | <a
					href="#" name="helpcenter" class="head_black12a" target="_blank">帮助</a>
					| </span> </span>
			<div class="cart gray4012">
				<a href="../cart/list.action">购物车</a>
			</div>
		</div>
		<span class="head_toutext" id="logininfo">
		<b>您好，<s:property value="#session.user.nickname"/>欢迎光临当当网</b>
		<s:if test="#session.user!=null">
		[ &nbsp;<a href="../user/userExit.action" class="b" id="exit">登出&nbsp;</a>]
		</s:if>
		<s:else>
		[&nbsp;<a href="../user/login_form.jsp" class="b">登录</a>|<a
			href="../user/register_form.jsp" class="b">注册</a>&nbsp;]
		</s:else>
		</span>
	</div>
	<div class="head_head_list">
		<div class="head_head_list_left">
			<span class="head_logo"><a href="../main/main.jsp" name="backtobook"><img
						src="../images/booksaleimg/book_logo.gif" /> </a> </span>
		</div>
		<div class="head_head_list_right">

			<div class="head_head_list_right_b">
			</div>
		</div>
	</div>
	<div class="head_search_div">

	</div>
	<div class="head_search_bg"></div>
</div>
