<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../super.jsp"%>
<title>����Ա��¼</title>
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
						<s:textfield name="admin.username" label="�û���"></s:textfield>
						<s:password name="admin.password" label="��   ��"></s:password>
						<s:submit method="login" value="�� ¼"></s:submit>
						<br />
						<s:a href="/hotel/login.jsp">�û���¼</s:a>
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
						<span class="inf_text">��Ȩ��Ϣ</span> <span class="copyright"><a
							href="#" target="_blank"><strong>������ϲ�����Ƶ�</strong></a></span>
					</div>
				</div>
				<div id="down_center"></div>
			</div>
		</div>
	</div>
</body>
</html>
