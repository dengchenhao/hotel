<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>���ӷ���</title>
<%@include file="/info/adminInfo.jsp"%>
<%@include file="../super.jsp"%>
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
</head>
<body>
	<h1>
		<font color="red"><center>���ӷ���</center> </font>
	</h1>
	<div id="center1">
		<s:form action="saveRoom" id="center2">
			<tr>
				<td class="tdLabel">��������:</td>
				<td><s:textfield name="room.name" theme="simple"></s:textfield>
				</td>
			</tr>
			<tr>
				<td class="tdLabel">����۸�:</td>
				<td><s:textfield name="room.price" theme="simple"></s:textfield>
				</td>
			</tr>
			<tr>
				<td class="tdLabel">��������:</td>
				<td><select name="room.category">
						<option value="single" selected="selected">���˼�</option>
						<option value="double">˫�˼�</option>
						<option value="three">���˼�</option>
				</select></td>
			</tr>
			<tr>
				<td class="tdLabel">����״̬:</td>
				<td><select name="room.status">
						<option value="0" selected="selected">����</option>
						<option value="1">Ԥ��δ��ס</option>
						<option value="2">����ס</option>
				</select></td>
			</tr>
			<s:submit value="�� ��"></s:submit>
		</s:form>
	</div>
</body>
</html>