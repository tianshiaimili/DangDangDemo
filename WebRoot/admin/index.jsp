<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<!-- jQuery Datepicker Plugin -->
<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
</head>
<body>
<div id="body-wrapper">
  <!-- Wrapper for the radial gradient background -->
  <div id="sidebar">
    <div id="sidebar-wrapper">
      <!-- Sidebar with logo and menu -->
      <h1 id="sidebar-title"><a href="#">当当网后台管理系统</a></h1>
      <p align="center">
        <!-- Logo (221px wide) -->
        <a href="#"><img src="resources/images/logo2.png" alt="Simpla Admin logo" width="150" height="53" align="middle" id="logo" /></a></p>
      <div id="profile-links" style="color:white;"> Hello,<s:property value="#session.admin.name"/><br />
        <br />
        <a href="#" title="View the Site"></a>  <a href="../admin/login.jsp" title="Sign Out" style="color:white;">安全退出</a> </div>
      <ul id="main-nav">
        <!-- Accordion Menu -->
        <li> <a href="#" class="nav-top-item current">
          <!-- Add the class "current" to current menu item -->人员管理</a>
          <ul>
            <li><a class="current" href=""../admin/findAllAdmin.action"">管理员管理</a></li>
            <li><a  href="../admin/findAllUser.action">用户管理</a></li>
            <!-- Add class "current" to sub menu items also -->
          </ul>
        </li>
        <li> <a href="#" class="nav-top-item"> 商品及订单管理 </a>
          <ul>
            <li><a href="#">分类管理</a></li>
            <li><a href="#">商品管理</a></li>
			<li><a href="#">订单管理</a></li>
          </ul>
        </li>
        <li> <a href="#" class="nav-top-item"> 其他设置 </a>
          <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </li>
        <li>
          <ul>
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </li>
        <li><ul><li></li>
            <li></li>
          </ul>
        </li>
      </ul>
      <!-- End #main-nav -->
      <div id="messages" style="display: none">
        <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->
        <h3>3 Messages</h3>
        <p> <strong>17th May 2009</strong> by Admin<br />
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. <small><a href="#" class="remove-link" title="Remove message">Remove</a></small> </p>
        <p> <strong>2nd May 2009</strong> by Jane Doe<br />
          Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est. <small><a href="#" class="remove-link" title="Remove message">Remove</a></small> </p>
        <p> <strong>25th April 2009</strong> by Admin<br />
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. <small><a href="#" class="remove-link" title="Remove message">Remove</a></small> </p>
        <form action="#" method="post">
          <h4>New Message</h4>
          <fieldset>
          <textarea class="textarea" name="textfield" cols="79" rows="5"></textarea>
          </fieldset>
          <fieldset>
          <select name="dropdown" class="small-input">
            <option value="option1">Send to...</option>
            <option value="option2">Everyone</option>
            <option value="option3">Admin</option>
            <option value="option4">Jane Doe</option>
          </select>
          <input class="button" type="submit" value="Send" />
          </fieldset>
        </form>
      </div>
      <!-- End #messages -->
    </div>
  </div>
  <!-- End #sidebar -->
  <div id="main-content">
    <!-- Main Content Section with everything -->
    <noscript>
    <!-- Show a notification if the user has disabled javascript -->
    </noscript>
    <!-- Page Head -->
    <h2 align="center"><a href="#"><img src="resources/images/logo1.png" alt="Simpla Admin logo" vspace="5" align="middle" id="logo" /></a></h2>
    <h2> Welcome
      <!-- End .shortcut-buttons-set -->
</h2>
    <div class="clear"></div>
    <!-- End .clear -->
    <div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>&nbsp;</h3>
        <ul class="content-box-tabs"><!-- href must be unique and match the id of target div -->
        </ul>
        <div class="clear"></div>
      </div>
      <!-- End .content-box-header -->
      <div class="content-box-content">
        <div class="tab-content default-tab" id="tab1">
          <!-- This is the target div. id must match the href of this div's tab -->
          <table>
            <thead>
              <tr>
                <th>&nbsp;</th>
                <th>用户名</th>
                <th>密码</th>
                <th>管理员等级</th>
                <th>权限</th>
                <th>操作</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <td colspan="6">&nbsp;</td>
              </tr>
            </tfoot>
            <tbody>
            <s:iterator value="admins">
            <s:if test="#session.admin.grade==0">
              <tr>
                <td>&nbsp;</td>
                <td>${name}</td>
                <td><input type="text" name="password" id="p_<s:property value="id"/>" value="<s:property value="password"/>" /></td>
                <td><input type="text" name="grade" id="g_<s:property value="id"/>" value="<s:property value="grade"/>" /></td>
                	<s:if test="grade==0"><td>高级管理员，可进行任何操作</td></s:if>
                	<s:else><td>中级管理员，不可管理其它管理员权限</td></s:else>
                <td>
                  <!-- Icons -->
                  <a href="#" title="Edit"></a> <a href="deleteAdmin.action?id=<s:property value="id"/>" title="Delete"><img src="resources/images/icons/cross.png" alt="Delete" /></a> <a href="javascript:;"
	onclick="location='editAdmin.action?id=<s:property value="id"/>&password='+document.getElementById('p_<s:property value="id"/>').value+'&grade='+document.getElementById('g_<s:property value="id"/>').value;" title="Edit Meta"><img src="resources/images/icons/hammer_screwdriver.png" alt="Edit Meta" /></a> </td>
              </tr>
              </s:if>
              <s:else>
              	<s:if test="#session.admin.id==id">
              	   <tr>
                <td>&nbsp;</td>
                <td>${name}</td>
                <td><input type="text" name="password" id="p_<s:property value="id"/>" value="<s:property value="password"/>" /></td>
                <td><input  disabled="disabled" type="text" name="grade" id="g_<s:property value="id"/>" value="<s:property value="grade"/>" /></td>
                    <s:if test="grade==0"><td>高级管理员，可进行任何操作</td></s:if>
                	<s:else><td>中级管理员，不可管理其它管理员权限</td></s:else>
                <td>
                  <!-- Icons -->
                  <a href="#" title="Edit"></a> <a href="deleteAdmin.action?id=<s:property value="id"/>" title="Delete"><img src="resources/images/icons/cross.png" alt="Delete" /></a> 
<a href="javascript:;"
	onclick="location='editAdmin.action?id=<s:property value="id"/>&password='+document.getElementById('p_<s:property value="id"/>').value+'&grade='+document.getElementById('g_<s:property value="id"/>').value;" title="Edit Meta"><img src="resources/images/icons/hammer_screwdriver.png" alt="Edit Meta" /></a> </td>
           </tr>
              	</s:if>
              	<s:else>
               <tr>
                <td>&nbsp;</td>
                <td>${name}</td>
                 <td><input disabled="disabled" type="password" name="password" id="p_<s:property value="id"/>" value="<s:property value="password"/>" /></td>
                <td><input disabled="disabled" type="text" name="grade" id="g_<s:property value="id"/>" value="<s:property value="grade"/>" /></td>
                                	<s:if test="grade==0"><td>高级管理员，可进行任何操作</td></s:if>
                	<s:else><td>中级管理员，不可管理其它管理员权限</td></s:else>
              </tr>
              </s:else>
              </s:else>
              </s:iterator>
            </tbody>
          </table>
        </div>
        <!-- End #tab1 -->
        <div class="tab-content" id="tab2">
          <form action="#" method="post">
            <fieldset>
            <p>
              <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
            </p>
            <p>&nbsp; </p>
            </fieldset>
            <div class="clear"></div>
            <!-- End .clear -->
          </form>
        </div>
        <!-- End #tab2 -->
      </div>
      <!-- End .content-box-content -->
    </div>
    <!-- End .content-box -->
    <!-- End .content-box -->
    <!-- End .content-box -->
<div class="clear"></div>
    <!-- Start Notifications -->
    <!-- End Notifications -->
<div id="footer"> <small>
      <!-- Remove this notice or replace it with whatever you want -->
      &#169; Copyright 2013 dangdang.LTD | Powered by <a href="#">admin </a> | <a href="#"></a></small></div>
    <!-- End #footer -->
  </div>
  <!-- End #main-content -->
</div>
</body>
<!-- Download From www.exet.tk-->
</html>

