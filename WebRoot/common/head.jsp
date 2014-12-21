<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!-- <link href="../css/book_head090107.css" rel="stylesheet" type="text/css" /> -->

<!-- 这个是页头顶部 banner引用的css -->
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="all" />

 <%-- <script type="text/javascript" src="../js/jquery1.min.js"></script>  --%>

 <link href="../css/form.css" rel="stylesheet" type="text/css" media="all" /> 
 <link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'> 
 <script type="text/javascript" src="../js/jquery1.min.js"></script> 
<!-- start menu -->
<link href="../css/megamenu.css" rel="stylesheet" type="text/css" media="all" /> 
 <script type="text/javascript" src="../js/megamenu.js"></script>

<script type="text/javascript" >$(document).ready(function(){$(".megamenu").megamenu();});</script> 

 <%-- <script type="text/javascript" src="../js/jquery-1.4.3.js"></script> --%>
	<script type="text/javascript">
	 $(function(){
	 	$("#exit").click(function(){
	 		$.post(
	 		"/dangdang2/user/userExit.action"
	 		);
	 	});
	 });
	</script>
 <script src="../js/jquery.easydropdown.js"></script> 
	
<div class="head_container">
	<%-- <div class="head_welcome">
		<div class="head_welcome_right">
			<span class="head_welcome_text"> </span>
			<span class="head_welcome_text"> <span class="little_n">
					| <a href="#" name="mydangdang" class="head_black12a">我的当当</a> | <a
					href="#" name="helpcenter" class="head_black12a" target="_blank">帮助</a>
					| </span> </span>
			<div class="cart gray4012">
				<a href="/dangdang2/cart/list.action">购物车</a>
			</div>
		</div>
		<span class="head_toutext" id="logininfo">
		<b>您好，<s:property value="#session.user.nickname"/>欢迎光临当当网</b>
		<s:if test="#session.user!=null">
		[ &nbsp;<a href="/dangdang2/user/userExit.action" class="b" id="exit">登出&nbsp;</a>]
		</s:if>
		<s:else>
		[&nbsp;<a href="../user/login_form.jsp" class="b">登录</a>|<a
			href="../user/register_form.jsp" class="b">注册</a>&nbsp;]
		</s:else>
		</span>
	</div> --%>
	
	
	<!-- 这里是页头横幅部分 start -->
	<div class="header-top">
		<div class="wrap">
			<%--  <div class="header-top-left">
				<div class="box">
					<select tabindex="4" class="dropdown">
						<option value="" class="label" value="">Language :</option>
						<option value="1">China</option>
						<option value="2">French</option>
						<option value="3">German</option>
					</select>
				</div>
				<div class="box1">
					<select tabindex="4" class="dropdown" >
						<option value="" class="label" value="">Currency :</option>
						<option value="1">$ Dollar</option>
						<option value="2">€ Euro</option>
					</select>
				</div>
				<div class="clear"></div>
			</div>  --%>

			<div class="cssmenu">
				<ul>
					<li class="active">
					<!-- <a href="login.html">您好，欢迎光临当当网</a> -->
					<a href="">您好，<s:property value="#session.user.nickname"/> 欢迎光临当当网</a>
					</li> |
					<li><a href="/dangdang2/cart/list.action">购物车</a>
					</li> |
					<li>
					<s:if test="#session.user!=null">
					<a href="/dangdang2/user/userExit.action" class="b" id="exit">登出</a>
					</s:if>
					<s:else>
					<a href="../user/login_form.jsp" class="b">登录</a>
					</li> |
					<li>
					<a href="../user/register_form.jsp" class="b">注册</a>
					</li> |
					</s:else>
					
					<!-- <a href="../user/login_form.jsp">登录</a> -->
					
				<!-- 	<li>
					<a href="../user/register_form.jsp">注册</a>
					</li> | -->
					<li><a href="checkout.html">帮助</a>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	
	<%-- 	
	这是原来的页头脚下的菜单部分
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
	<div class="head_search_bg"></div> --%>
	
	
	<!-- 这里是页头横幅部分 over -->
				<!-- 这是新加的页头下面的菜单部分 -->
	<div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
				<div class="logo">
					<a href="../main/main.jsp"><img src="../images/booksaleimg/book_logo.gif" alt=""/></a>
				</div>
				<div class="menu">
	            <ul class="megamenu skyblue">
			<li class="active grid"><a href="index.html">Home</a></li>
			<li><a class="color4" href="#">women</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>Contact Lenses</h4>
								<ul>
									<li><a href="womens.html">Daily-wear soft lenses</a></li>
									<li><a href="womens.html">Extended-wear</a></li>
									<li><a href="womens.html">Lorem ipsum </a></li>
									<li><a href="womens.html">Planned replacement</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Sun Glasses</h4>
								<ul>
									<li><a href="womens.html">Heart-Shaped</a></li>
									<li><a href="womens.html">Square-Shaped</a></li>
									<li><a href="womens.html">Round-Shaped</a></li>
									<li><a href="womens.html">Oval-Shaped</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Eye Glasses</h4>
								<ul>
									<li><a href="womens.html">Anti Reflective</a></li>
									<li><a href="womens.html">Aspheric</a></li>
									<li><a href="womens.html">Bifocal</a></li>
									<li><a href="womens.html">Hi-index</a></li>
									<li><a href="womens.html">Progressive</a></li>
								</ul>	
							</div>												
						</div>
					  </div>
					</div>
				</li>				
				<li><a class="color5" href="#">Men</a>
				<div class="megapanel">
					<div class="col1">
							<div class="h_nav">
								<h4>Contact Lenses</h4>
								<ul>
									<li><a href="mens.html">Daily-wear soft lenses</a></li>
									<li><a href="mens.html">Extended-wear</a></li>
									<li><a href="mens.html">Lorem ipsum </a></li>
									<li><a href="mens.html">Planned replacement</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Sun Glasses</h4>
								<ul>
									<li><a href="mens.html">Heart-Shaped</a></li>
									<li><a href="mens.html">Square-Shaped</a></li>
									<li><a href="mens.html">Round-Shaped</a></li>
									<li><a href="mens.html">Oval-Shaped</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Eye Glasses</h4>
								<ul>
									<li><a href="mens.html">Anti Reflective</a></li>
									<li><a href="mens.html">Aspheric</a></li>
									<li><a href="mens.html">Bifocal</a></li>
									<li><a href="mens.html">Hi-index</a></li>
									<li><a href="mens.html">Progressive</a></li>
								</ul>	
							</div>												
						</div>
					</div>
				</li>
				<li><a class="color6" href="other.html">Other</a></li>
				<li><a class="color7" href="other.html">Purchase</a></li>
			</ul>
			</div>
		</div>
	   <div class="header-bottom-right">
         <div class="search">	  
				<input type="text" name="s" class="textbox" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}">
				<input type="submit" value="Subscribe" id="submit" name="submit">
				<div id="response"> </div>
		 </div>
	  <div class="tag-list">
	    <ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c1" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>sed diam nonummy</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>
			</li>
		</ul>
		<ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>No Products</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>
			</li>
		</ul>
	    <ul class="last"><li><a href="#">Cart(0)</a></li></ul>
	  </div>
    </div>
     <div class="clear"></div>
     </div>
	</div>
	
	
	<%-- <div class="head_head_list">
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
	<div class="head_search_bg"></div> --%>
</div>
