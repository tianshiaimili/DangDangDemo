<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>当当图书 – 全球最大的中文网上书店</title>
		<script type="text/javascript" src="../js/prototype-1.6.0.3.js">
		</script>
		<link href="../css/book.css" rel="stylesheet" type="text/css" />
		<link href="../css/second.css" rel="stylesheet" type="text/css" />
		<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="../css/list.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".goumai").click(function(){
					var id=$(this).attr("id");
					$.post(
					"/dangdang2/cart/buy.action",
					{"id":id},
					function(data){
						if(data){
							alert("购买成功！");
						}else{
							alert("好像已购买过,去购物车看看");
							//window.location="list.action";
						}
					});
					return false;
				});
				
			});
		</script>
	</head>
	<body>
		&nbsp;

		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->

		<div style="width: 962px; margin: auto;">
			<a href="#"><img src="../images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>
		<div class='your_position'>
			您现在的位置:&nbsp;
			<a href='#'>当当图书</a> &gt;&gt;
			<font style='color: #cc3300'><strong>小说</strong> </font>
		</div>

		<div class="book">

			<!--左栏开始-->
			<div id="left" class="book_left">
				<div id="__fenleiliulan">
					<div class=second_l_border2>
						<h2>
							分类浏览
						</h2>
						<ul>
							<li>
								<div>
									<div class=second_fenlei>
										&middot;全部&nbsp;(${totalPnum})
									</div>
								</div>
							</li>
							<div class="clear"></div>
					<s:iterator value="subCats" var="c">
							<!--2级分类开始-->
							<li>
								<div>
									<div class=second_fenlei>
										&middot;
									</div>
								<s:if test="#c.id==cid">
								
									<div class=second_fenlei3>
										<a href="booklist.action?pid=<s:property value="pid"/>&cid=${c.id}">
										${c.name }&nbsp;(${c.pnum })</a>
									</div>
								</s:if>
								<s:else>
									<div class=second_fenlei>
										<a href="booklist.action?pid=<s:property value="pid"/>&cid=${c.id}">${c.name}&nbsp;(${c.pnum})</a>
									</div>
								</s:else>
								</div>
							</li>
						    <div class="clear"></div>
							<!--2级分类结束-->
					</s:iterator>
							<li>
								<div></div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--图书列表开始-->
				<div id="divRight" class="list_right">

					<div id="book_list" class="list_r_title">
						<div class="list_r_title_text">
							排序方式
						</div>
						<select onchange='' name='select_order' size='1'
							class='list_r_title_ml'>
							<option value="">
								按上架时间 降序
							</option>
						</select>
						<div id="divTopPageNavi" class="list_r_title_text3">

							<!--分页导航开始-->
						<s:if test="page>1">
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="booklist.action?pid=${pid }&cid=${cid }&page=${page-1}">
								<img src='../images/page_up.gif' /> </a>
							</div>
	                      </s:if>
	                      <s:else>
							<div class='list_r_title_text3a'>
								<img src='../images/page_up_gray.gif' />
							</div>
				          </s:else>
							<div class='list_r_title_text3b'>
								第${page}页/共${totalPage}页
							</div>
							<s:if test="page<totalPage">
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="booklist.action?pid=${pid }&cid=${cid }&page=${page+1 }">
									<img src='../images/page_down.gif' /> </a>
							</div>
							</s:if>
							<s:else>
							<div class='list_r_title_text3a'>
								<img src='../images/page_down_gray.gif' />
							</div>
							</s:else>
							<!--分页导航结束-->
						</div>
					</div>
					
					<!--商品条目开始-->
				<s:iterator value="pros">
						<div class="list_r_line"></div>
						<div class="clear"></div>

						<div class="list_r_list">
							<span class="list_r_list_book"><a name="link_prd_img" href='#'>
								<img src="../productImages/${productPic}" /> </a> </span>
							<h2>
								<a name="link_prd_name" href='#'>${productName}</a>
							</h2>
							<h3>
								顾客评分：100
							</h3>
							<h4 class="list_r_list_h4">
								作 者:
								<a href='#' name='作者'>${author}</a>
							</h4>
							<h4>
								出版社：
								<a href='#' name='出版社'>${publishing }</a>
							</h4>
							<h4>
								出版时间：
								<s:date name="new java.sql.Date(publishTime)" 
								format="yyyy-MM-dd"/>
								
							</h4>
							<h5>
								${description}
							</h5>
							<div class="clear"></div>
							<h6>
								<span class="del">￥${fixedPrice}</span>
								<span class="red">￥${dangPrice}</span>
								节省：￥${fixedPrice-dangPrice}
							</h6>
							<span class="list_r_list_button"> 
							<a href="#" id="${id}" class="goumai"> 
							<img src='../images/buttom_goumai.gif' /> </a>
							<span id="cartinfo"></span>
						</div>
						<div class="clear"></div>
				</s:iterator>
						<!--商品条目结束-->

					<div class="clear"></div>
					<div id="divBottomPageNavi" class="fanye_bottom">
					</div>

				</div>
				<!--图书列表结束-->

			</div>
			<!--中栏结束-->
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>
