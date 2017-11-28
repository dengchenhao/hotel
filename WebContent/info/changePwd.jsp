<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户修改密码</title>
</head>
<body>
	<%@include file="../super.jsp"%>
	<style type="text/css">
#userService {
	width: 50%;
	margin: 20% 30% 40%;
}

#updatePassword {
	background: white;
	margin: 10% 30% 40%;
}
</style>
	<div id="updatePassword">
		<h1>
			<font color="red">修改密码</font>
		</h1>
		<s:form action="userService" id="userService">
			<table>
				<tr>
					<td><s:hidden name="user.userid" value="%{user.userid}"></s:hidden>
					</td>
				</tr>
				<tr>
					<td class="tdLabel">用户名</td>
					<td><s:textfield readonly="true" name="user.username"
							value="%{user.username}" theme="simple"></s:textfield></td>
				</tr>
				<tr>
					<td class="tdLabel">密码</td>
					<td>
						<!--<s:password name="user.password" value="%{user.password}" label="密码"></s:password>-->
						<s:textfield name="user.password" value="%{user.password}"
							theme="simple"></s:textfield>
					</td>
				</tr>
				<tr>
					<td class="tdLabel">手机号码</td>
					<td><s:textfield name="user.mobile" theme="simple"></s:textfield>
					</td>
				</tr>
				<tr>
					<td class="tdLabel">身份证号码</td>
					<td><s:textfield name="user.creditnum"
							value="%{user.creditnum}" theme="simple"></s:textfield></td>
				</tr>
				<tr>
					<td><s:submit method="updateUser" value="修改"></s:submit></td>
				</tr>
			</table>
		</s:form>
	</div>

</body>
</html>
