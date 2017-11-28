<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户管理首页</title>
</head>
<body>
	<h1>
		<font color="red">操作菜单</font>
		<%@include file="../super.jsp"%>
	</h1>
	<s:a action="userService!userUpdateInfo">
		<button type="button" class="glyphicon glyphicon-edit">修改密码</button>
	</s:a>
	&nbsp;
	<s:a href="saveOrder.action">
		<button type="button" class="glyphicon glyphicon-star">预定房间</button>
	</s:a>
	&nbsp;
	<s:a href="orderService">
		<button type="button" class="glyphicon glyphicon-search">查看预定信息</button>
	</s:a>
	&nbsp;
	<s:a href="park.action">
		<button type="button" class="glyphicon glyphicon-plane">车位管理</button>
	</s:a>
	&nbsp;
	<s:a href="userService!loginOut">
		<button type="button" class="glyphicon glyphicon-home">退出</button>
	</s:a>
</body>
</html>