<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../super.jsp"%>
<title>管理员登录</title>
</head>
<body>
	<%@include file="../super.jsp"%>
	<link rel="stylesheet" href="<%=path%>/style/login/adminLogin.css"
		type="text/css"></link>
	<div id="background">
		<div id="login">
			<div id="top">
				<div id="top_left"></div>
				<div id="top_center"></div>
			</div>
			<div id="center">
				<div id="center_left"></div>
				<div id="center_middle">
					<s:form action="adminService" id="form">
						<s:textfield name="admin.username" label="用户名"></s:textfield>
						<s:password name="admin.password" label="密   码"></s:password>
						<s:submit method="login" value="登 录"></s:submit>
						<br />
						<s:a href="/hotel/login.jsp">用户登录</s:a>
						<br />
						<br />
						<br />
					</s:form>
				</div>
				<div id="center_right"></div>
			</div>
			<div id="down">
				<div id="down_left">
					<div id="inf">
						<span class="inf_text">版权信息</span> <span class="copyright"><a
							href="#" target="_blank"><strong>哈尔滨喜洋洋大酒店</strong></a></span>
					</div>
				</div>
				<div id="down_center"></div>
			</div>
		</div>
	</div>
</body>
</html>
