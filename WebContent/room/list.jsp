<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../super.jsp"%>
<title>�����б�</title>
<script type="text/javascript">
	function del() {
		if (confirm("ȷ��ɾ��������Ϣ��?")) {
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
		<font color="red"><center>�����б�</center> </font>
	</h1>
	<s:a href="/hotel/room/add.jsp">���ӷ���</s:a>
	<table border="1" width="50%" align="center" class="table">
		<tr>
			<td>�������</td>
			<td>��������</td>
			<td>����۸�</td>
			<td>��������</td>
			<td>����״̬</td>
			<td>ɾ��</td>
			<td>����</td>
			<td>�˷�</td>
		</tr>
		<s:iterator value="#request.list" id="room">
			<tr>
				<td><s:property value="#room.roomid" /></td>
				<td><s:property value="#room.name" /></td>
				<td><s:property value="#room.price" /></td>
				<td><s:if test="#room.category == 'single'">���˼�</s:if> <s:if
						test="#room.category == 'double'">˫�˼�</s:if> <s:if
						test="#room.category == 'three'">���˼�</s:if></td>
				<td><s:if test="#room.status == 0">����</s:if>
				<s:if test="#room.status == 1">��Ԥ��</s:if>
				<s:if test="#room.status == 2">����ס</s:if>
				</td>
				<td><s:a href="deleteRoom.action?room.roomid=%{#room.roomid}"
						onclick="return del();">ɾ��</s:a></td>
				<td><s:a href="updatePRoom.action?room.roomid=%{#room.roomid}">����</s:a>
				</td>
				<td><s:if test="#room.status == 1">
						<s:a href="resetRoom.action?room.roomid=%{#room.roomid}">�˶�</s:a>
					</s:if></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>
