<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�û�������ҳ</title>
</head>
<body>
	<h1>
		<font color="red">�����˵�</font>
		<%@include file="../super.jsp"%>
	</h1>
	<s:a action="userService!userUpdateInfo">
		<button type="button" class="glyphicon glyphicon-edit">�޸�����</button>
	</s:a>
	&nbsp;
	<s:a href="saveOrder.action">
		<button type="button" class="glyphicon glyphicon-star">Ԥ������</button>
	</s:a>
	&nbsp;
	<s:a href="orderService">
		<button type="button" class="glyphicon glyphicon-search">�鿴Ԥ����Ϣ</button>
	</s:a>
	&nbsp;
	<s:a href="park.action">
		<button type="button" class="glyphicon glyphicon-plane">��λ����</button>
	</s:a>
	&nbsp;
	<s:a href="userService!loginOut">
		<button type="button" class="glyphicon glyphicon-home">�˳�</button>
	</s:a>
</body>
</html>