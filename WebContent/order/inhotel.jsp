<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�û���ס���б�</title>
<script type="text/javascript">
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
		<font color="red"><center>����ס�ķ����б�</center> </font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>�������</td>
			<td>��������</td>

			<td>����۸�</td>
			<td>�����ͺ�</td>
			<td>��ס��</td>
			<td>��סʱ��</td>
			<td>״̬</td>
			<td style="display: none">�����˱��</td>
			<td>����</td>
		</tr>
		<s:iterator value="#request.listUserOder" id="oder">
			<tr>
				<td><s:property value="#oder.roomid" /></td>
				<td><s:property value="#oder.name" /></td>
				<td><s:property value="#oder.price" /></td>
				<td><s:property value="#oder.category" /></td>
				<td><s:property value="#oder.username" /></td>
				<td><s:property value="#oder.starttime" /></td>
				<td><s:if test="#oder.status == 1">��Ԥ��</s:if> <%-- 						<s:elseif test="#room.status == 2">Ԥ��δ��ס</s:elseif> --%>
					<s:if test="#oder.status == 2">����ס</s:if> 
					<s:if test="#oder.status == 3">�ѽ���</s:if> 
				<td style="display: none"><s:property value="#oder.userid" />
				</td>
				<td><s:a
						href="inOrderHotel!bill?roomid=%{#oder.roomid}&status=%{#oder.status}&userid=%{#oder.userid}&price=%{#oder.price}"
						onclick="return sav();">����</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>