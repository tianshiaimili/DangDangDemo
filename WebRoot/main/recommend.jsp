<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<h2>

	编辑推荐
</h2>
<div id=__bianjituijian/danpin>
	<div class=second_c_02>
	<!--开始 -->
	<s:iterator value="recommentBooks" var="book">
		<div class=second_c_02_b1>
			<div class=second_c_02_b1_1>
				<a href='#' target='_blank'><img src="../productImages/<s:property value="#book[1]"/>" width=70 border=0 /> </a>
			</div>
			
			<div class=second_c_02_b1_2>
				<h3>
					<a href='#' target='_blank' title='输赢'><s:property value="#book[0]"/></a>
				</h3>
				<h4>
					作者：<s:property value="#book[2]"/>著
					<br />
					出版社：<s:property value="#book[3]"/>&nbsp;&nbsp;&nbsp;&nbsp;出版时间：<s:date name="new java.sql.Date(#book[4])" 
								format="yyyy-MM-dd"/>
				</h4>
				<h5>
					<s:property value="book#[7]"/>
				</h5>
				<h6>
					定价：￥<s:property value="#book[5]"/>&nbsp;&nbsp;当当价：￥<s:property value="#book[6]"/>
				</h6>
				<div class=line_xx></div>
			</div>
		</div>
		</s:iterator>
	<!-- 结束 -->
</div>
</div>
