<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>当当图书 – 全球最大的中文网上书店</title>
<link href="../css/book.css" rel="stylesheet" type="text/css" />
<link href="../css/second.css" rel="stylesheet" type="text/css" />
<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />

<!-- 这是新添加进来的 start -->
<!-- 这个是页头顶部 banner引用的css -->
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/form.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Exo+2'
	rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="../js/jquery1.min.js"></script>
	<!-- start menu -->
	<link href="../css/megamenu.css" rel="stylesheet" type="text/css"
		media="all" />
	<script type="text/javascript" src="../js/megamenu.js"></script>
	<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
	<!--start slider -->
	<link rel="stylesheet" href="../css/fwslider.css" media="all">
		<script src="../js/jquery-ui.min.js"></script>
		<script src="../js/css3-mediaqueries.js"></script>
		<script src="../js/fwslider.js"></script>
		<!--end slider -->
		<script src="../js/jquery.easydropdown.js"></script>
		<!-- 这是新添加进来的 over -->
<script type="text/javascript" src="../js/jquery-1.4.3.js">
		</script>
<script type="text/javascript">
		$(function(){
			$("#new").load("news.action",{"size":8});
			$("#left").load("category.action");
			$("#recommend").load("recommend.action");
			$("#hot").load("hot.action");
			$("#NewProduct_1_o_t").load("hotNew.action");
		});
		</script>

</head>
<body>


	<!-- &nbsp; -->
	<!-- 头部开始 -->
	<%@include file="../common/head.jsp"%>
	<!-- 头部结束 -->
	<div style="width: 962px; margin: auto;">
		<a href="#" target="_blank"><img
			src="../images/default/book_banner_081203.jpg" border="0" /> </a>
	</div>

	<div class="book">

		<!--左栏开始-->
		<div id="left" class="book_left"></div>
		<!--左栏结束-->

		<!--中栏开始-->
		<div class="book_center">

			<!--推荐图书开始-->
			<div class=second_c_border1 id="recommend"></div>

			<!--推荐图书结束-->

			<!--热销图书开始-->
			<div class="book_c_border2" id="hot"></div>
			<!--热销图书结束-->

			<!--最新上架图书开始-->
			<div class="book_c_border2" id="new"></div>

			<!--最新上架图书结束-->

			<div class="clear"></div>
		</div>
		<!--中栏结束-->



		<!--右栏开始-->
		<div class="book_right">
			<div class="book_r_border2" id="__XinShuReMai">
				<div class="book_r_b2_1x" id="new_bang">
					<h2 class="t_xsrm">新书热卖榜</h2>
					<div id="NewProduct_1_o_t" onmouseover="">
						<h3 class="second">
							<span class="dot_r"> </span><a href="#" target="_blank">更多&gt;&gt;</a>
						</h3>
					</div>
				</div>
			</div>
		</div>
		<!--右栏结束-->
		<div class="clear"></div>
	</div>

	<!--页尾开始 -->
	<%@include file="../common/foot.jsp"%>
	<!--页尾结束 -->
</body>
</html>
