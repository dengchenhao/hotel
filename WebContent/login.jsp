<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<%@include file="../super.jsp"%>
	<link rel="stylesheet" href="<%=path%>/style/login/login.css"
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
					<s:form action="userService" id="form">
						<s:textfield name="user.username" label="�û���" required="true"></s:textfield>
						<s:password name="user.password" label="����" required="true"></s:password>
						<s:submit method="login" value="�� ¼"></s:submit>
						<br />
						<s:a href="/hotel/adminLogin.jsp">����Ա��¼</s:a>
						<br>
						<s:a href="/hotel/register.jsp">���û�ע��</s:a>
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
