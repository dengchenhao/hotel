<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�û��б�</title>
<script type="text/javascript">
	function del() {
		if (confirm("��ȷ��Ҫɾ�����û���?")) {
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
			<center>����ס�ͻ���Ϣ�б�</center>
		</font>
	</h1>
	<s:a href="/hotel/user/add.jsp">
		<button type="button" class="glyphicon glyphicon-plus">�����¿ͻ�</button>
	</s:a>
	<table border="1" class="table">
		<tr>
			<td width="80">�ͻ����</td>
			<td width="80">�ͻ�����</td>
			<td width="100">��ϵ�绰</td>
			<td width="100">���֤����</td>
			<td width="80">�����</td>
			<td width="80">��סʱ��</td>
			<td width="80">�˷�ʱ��</td>
			<td width="80">ɾ��</td>
			<td width="80">�޸�<br></td>
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
						onclick="return del();">ɾ��</s:a></td>
				<td width="80"><s:a
						href="updatePUser.action?user.userid=%{#us.userid}">�޸�</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>