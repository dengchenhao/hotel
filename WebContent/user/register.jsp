<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户注册</title>
<style type="text/css">
body {
	background: #D2D460;
	text-align: center;
}

div {
	width: 778px;
	margin: 0 auto;
	background: #fff;
	text-align: left;
}
</style>
</head>
<body>
	<%@include file="../super.jsp"%>
	<h1>
		<font color="red">用户注册</font>
	</h1>
	<s:form action="saveUser">
		<s:textfield name="user.username" label="用户名"></s:textfield>
		<s:password name="user.password" label="密码"></s:password>
		<s:textfield name="user.mobile" label="手机号码"></s:textfield>
		<s:textfield name="user.creditnum" label="身份证号码"></s:textfield>
		<s:submit value="注 册"></s:submit>
	</s:form>
</body>
</html>