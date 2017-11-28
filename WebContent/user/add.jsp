<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户注册</title>
<%@include file="/info/adminInfo.jsp"%>
<%@include file="../super.jsp"%>
<style type="text/css">
#saveUser {
	width: 50%;
	margin: 5% 20% 60%;
}

#add {
	background: white;
	margin: 0% 10% 60%;
}

div {
	width: 778px;
	margin: 0 auto;
	background: #fff;
	text-align: left;
}

.label {
	color: black;
	margin-left: 5px
}
</style>
</head>
<body>
	<div id="add">
		<h1>
			<font color="red">添加用户</font>
		</h1>
		<s:form action="saveUser">
			<s:textfield name="user.username" label="用户名"></s:textfield>
			<s:password name="user.password" label="密码"></s:password>
			<s:textfield name="user.mobile" label="手机号码"></s:textfield>
			<s:textfield name="user.creditnum" label="身份证号码"></s:textfield>
			<s:submit value="增 加"></s:submit>
		</s:form>
	</div>

</body>
</html>
