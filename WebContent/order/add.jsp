<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>������ס��Ϣ</title>
<script type="text/javascript">
	function sav() {
		if (confirm("��ȷ��Ҫ��ס�÷�����?")) {
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<%@include file="/info/userInfo.jsp"%>
	<%@include file="../super.jsp"%>
	<h1>
		<font color="red"><center>������ס��Ϣ</center> </font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td colspan="6">
				<h2>
					<font color="red"><center>
							<br>�����б�
						</center> </font>
				</h2>
			</td>
		</tr>
		<tr>
			<td>�����</td>
			<td>��������</td>
			<td>����۸�</td>
			<td>��������</td>
			<td>����״̬</td>
			<td>����</td>
		</tr>
		<s:iterator value="#request.listRoom" id="room">
			<tr>
				<td><s:property value="#room.roomid" /></td>
				<td><s:property value="#room.name" /></td>
				<td><s:property value="#room.price" /></td>
				<td><s:if test="#room.category == 'single'">���˼�</s:if> <s:if
						test="#room.category == 'double'">˫�˼�</s:if> <s:if
						test="#room.category == 'three'">���˼�</s:if></td>
				<td><s:if test="#room.status == 0">����</s:if> <s:elseif
						test="#room.status == 1">Ԥ��δ��ס</s:elseif> <s:else>����ס</s:else></td>
				<td><s:if test="#room.status == 0"><s:a
						href="saveOrder!add?order.roomid=%{#room.roomid}&room.roomid=%{#room.roomid}&name=%{#room.name}&price=%{#room.price}&category=%{#room.category}"
						onclick="return sav();">Ԥ��</s:a></s:if></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>