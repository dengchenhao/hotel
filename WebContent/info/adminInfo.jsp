<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员管理首页</title>
</head>
<body>
	<h1>
		<%@include file="../super.jsp"%>
		<font color="red">管理菜单</font>
	</h1>
	<s:a href="/hotel/authorityAdmin/listUser.action">
		<button type="button" class="glyphicon glyphicon-user">客户管理</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/listRoom.action">
		<button type="button" class="glyphicon glyphicon-bed">房间管理</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/listOrder.action">
		<button type="button" class="glyphicon glyphicon-list-alt">订单管理</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/inOrderHotel.action">
		<button type="button" class="glyphicon glyphicon-ok">入住管理</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/inthepark.action">
		<button type="button" class="glyphicon glyphicon-plane">车位信息</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/adminService!loginOut">
		<button type="button" class="glyphicon glyphicon-home">退出</button>
	</s:a>
</body>
</html>
