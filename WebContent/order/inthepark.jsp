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
		<font color="red"><center>���еĳ�λ�б�</center> </font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>��λ</td>
			<td>ͣ��������</td>
			<td>ͣ���˷����</td>
			<td>��λ״̬</td>

			<td style="display: none">ͣ���˱��</td>
			<td>����</td>
		</tr>
		<s:iterator value="#request.inthepark" id="oder">
			<tr>
				<td><s:property value="#oder.parkid" /></td>
				<td><s:property value="#oder.username" /></td>
				<td><s:property value="#oder.roomid" /></td>
				<td><s:if test="#oder.status == 0">����</s:if> <%-- 						<s:elseif test="#room.status == 2">Ԥ��δ��ס</s:elseif> --%>
					<s:else>��ͣ��</s:else></td>
				<td style="display: none"><s:property value="#oder.userid" />
				</td>
				<td><s:a href="inthepark!leave?parkid=%{#oder.parkid}"
						onclick="return sav();">���øó�λ</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>