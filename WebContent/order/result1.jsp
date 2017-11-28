<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>房间退订成功</title>
</head>
<body>
	<%@include file="/info/adminInfo.jsp"%>
	<br />
	<br />
	<br /> 提示：您需要支付
	<red> <s:property value="message" /> </red>
	人民币的房费，欢迎您的下次光临。
</body>
</html>