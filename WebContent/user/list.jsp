<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户列表</title>
<script type="text/javascript">
	function del() {
		if (confirm("你确定要删除该用户吗?")) {
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<%@include file="/info/adminInfo.jsp"%>
	<%@include file="../super.jsp"%>

	<h1>
		<font color="red">
			<center>已入住客户信息列表</center>
		</font>
	</h1>
	<s:a href="/hotel/user/add.jsp">
		<button type="button" class="glyphicon glyphicon-plus">增加新客户</button>
	</s:a>
	<table border="1" class="table">
		<tr>
			<td width="80">客户编号</td>
			<td width="80">客户姓名</td>
			<td width="100">联系电话</td>
			<td width="100">身份证号码</td>
			<td width="80">房间号</td>
			<td width="80">入住时间</td>
			<td width="80">退房时间</td>
			<td width="80">删除</td>
			<td width="80">修改<br></td>
		</tr>
		<s:iterator value="#request.list" id="us">
			<tr>
				<td width="80"><s:property value="#us.userid" /></td>
				<td width="80"><s:property value="#us.username" /></td>
				<td width="100"><s:property value="#us.mobile" /></td>
				<td width="100"><s:property value="#us.creditnum" /></td>
				<td width="100"><s:property value="#us.roomname" /></td>
				<td width="80"><s:property value="#us.starttime" /></td>
				<td width="80"><s:property value="#us.endtime" /></td>
				<td width="80"><s:a
						href="deleteUser.action?user.userid=%{#us.userid}"
						onclick="return del();">删除</s:a></td>
				<td width="80"><s:a
						href="updatePUser.action?user.userid=%{#us.userid}">修改</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>