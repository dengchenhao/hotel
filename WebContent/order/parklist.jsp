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
		if (confirm("��ȷ��ҪԤ�ó�λ��?")) {
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
		<font color="red"><center>���г�λ</center> </font>
	</h1>
	<%-- 		<s:form action="park!add"> --%>
	<%-- 		<s:textfield name="admin.username" label="�û���"></s:textfield> --%>
	<%-- 			<s:password name="admin.password" label="����"></s:password> --%>
	<%-- 			<s:submit value="�� ��"></s:submit> --%>
	<%-- 		</s:form> --%>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>��λ�����</td>

			<td>��λ״̬</td>
			<td>�Ƿ�Ԥ��</td>
		</tr>
		<s:iterator value="#request.parkid" id="parkcar">
			<tr>
				<td><s:property value="#parkcar.parkid" /></td>

				<td><s:if test="#parkcar.status == 0">����</s:if> <s:elseif
						test="#room.status == 2">Ԥ��δ��ס</s:elseif> <s:else>��ռ��</s:else></td>
				<td><s:a href="park!add?parkid=%{#parkcar.parkid}"
						onclick="return sav();">Ԥ��</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>