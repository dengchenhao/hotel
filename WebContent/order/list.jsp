<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�û���Ԥ�������б�</title>
<script type="text/javascript">
	function sav() {
		if (confirm("��ȷ��Ҫ�޸ķ���״̬��?")) {
			return true;
		}
		return false;
	}
	function del() {
		if (confirm("��ȷ��Ҫ�˶��÷�����?")) {
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
			<center>��Ԥ���ķ����б�</center>
		</font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>�������</td>
			<td>��������</td>
			<td>����۸�</td>
			<td>�����ͺ�</td>
			<td>����״̬</td>
			<td>Ԥ����</td>
			<td>Ԥ��ʱ��</td>
			<td>��סʱ��</td>
			<td style="display: none">�����˱��</td>
			<td style="display: none"><s:property value="#room.userid" /></td>
			<td>����</td>
		</tr>
		<s:iterator value="#request.listAllOrder" id="order">
			<tr>
				<td><s:property value="#order.roomid" /></td>
				<td><s:property value="#order.name" /></td>
				<td><s:property value="#order.price" /></td>
				<td><s:if test="#order.category == 'single'">���˼�</s:if> <s:if
						test="#order.category == 'double'">˫�˼�</s:if> <s:if
						test="#order.category == 'three'">���˼�</s:if></td>
				<td><s:if test="#order.status == 1">��Ԥ��</s:if> <%-- 						<s:elseif test="#room.status == 1">Ԥ��δ��ס</s:elseif> --%>
					<s:else>����ס</s:else></td>
				<td><s:property value="#order.username" /></td>
				<td><s:property value="#order.registertime" /></td>
				<td><s:property value="#order.starttime" /></td>
				<td><s:a
						href="listOrder!add?roomid=%{#order.roomid}&status=%{#order.status}&price=%{#order.price}&userid=%{#order.userid}"
						onclick="return sav();">����Ա����</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>