<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改用户资料</title>
</head>
<body>
	<%@include file="/info/adminInfo.jsp"%>
	<h1>
		<font color="red"><center>修改用户</center> </font>
	</h1>
	<style type="text/css">
#center1 {
	width: 50%;
	margin: 20% 30% 40%;
}

#center2 {
	background: white;
	margin: 10% 30% 40%;
}
</style>
	<div id="center1">
		<s:form action="updateUser" id="center2">
			<table>
				<tr>
					<td><s:hidden name="user.userid" value="%{user.userid}"></s:hidden>
					</td>
				</tr>
				<tr>
					<td class="tdLabel">用户名:</td>
					<td><s:textfield name="user.username" value="%{user.username}"
							theme="simple" readonly="true"></s:textfield></td>
				</tr>
				<tr>
					<td class="tdLabel">密码</td>
					<td>
						<!--<s:password name="user.password" value="%{user.password}" label="密码"></s:password>-->
						<s:textfield name="user.password" theme="simple"
							value="%{user.password}"></s:textfield>
					</td>
				</tr>
				<tr>
					<td class="tdLabel">手机号码:</td>
					<td><s:textfield name="user.mobile" theme="simple"
							value="%{user.mobile}"></s:textfield></td>
				</tr>
				<tr>
					<td class="tdLabel">身份证号码:</td>
					<td><s:textfield name="user.creditnum" theme="simple"
							value="%{user.creditnum}"></s:textfield></td>
				</tr>
				<tr>
					<td><s:submit value="修改"></s:submit></td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>