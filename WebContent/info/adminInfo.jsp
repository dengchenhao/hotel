<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>����Ա������ҳ</title>
</head>
<body>
	<h1>
		<%@include file="../super.jsp"%>
		<font color="red">����˵�</font>
	</h1>
	<s:a href="/hotel/authorityAdmin/listUser.action">
		<button type="button" class="glyphicon glyphicon-user">�ͻ�����</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/listRoom.action">
		<button type="button" class="glyphicon glyphicon-bed">�������</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/listOrder.action">
		<button type="button" class="glyphicon glyphicon-list-alt">��������</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/inOrderHotel.action">
		<button type="button" class="glyphicon glyphicon-ok">��ס����</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/inthepark.action">
		<button type="button" class="glyphicon glyphicon-plane">��λ��Ϣ</button>
	</s:a>
	&nbsp;
	<s:a href="/hotel/authorityAdmin/adminService!loginOut">
		<button type="button" class="glyphicon glyphicon-home">�˳�</button>
	</s:a>
</body>
</html>
