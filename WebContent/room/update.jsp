<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�޸ķ�����Ϣ</title>
</head>
<body>
	<%@include file="/info/adminInfo.jsp"%>
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
	<h1>
		<font color="red"><center>�޸ķ���</center> </font>
	</h1>
	<div id="center1">
		<s:form action="updateRoom" id="center2">
			<table>
				<tr>
					<td><s:hidden name="room.roomid" value="%{room.roomid}"></s:hidden>
					</td>
				</tr>
				<tr>
					<td class="tdLabel">��������:</td>
					<td><s:textfield name="room.name" value="%{room.name}"
							theme="simple" readonly="true"></s:textfield></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="tdLabel">����۸�:</td>
					<td><s:textfield name="room.price" value="%{room.price}"
							theme="simple"></s:textfield></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="tdLabel">��������:</td>
					<td><select name="room.category">
							<option value="single" selected="selected">���˼�</option>
							<option value="double">˫�˼�</option>
							<option value="three">���˼�</option>
					</select></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="tdLabel">����״̬:</td>
					<s:if test="room.status == 0">
						<td><select name="room.status">
								<option value="0" selected="selected">�շ�</option>
								<option value="1">�п���</option>
						</select></td>
					</s:if>
					<s:else>
						<td><select name="room.status">
								<option value="0">�շ�</option>
								<option value="1" selected="selected">�п���</option>
						</select></td>
					</s:else>
				</tr>
				<tr>
					<td><s:submit value="�޸�"></s:submit></td>
				</tr>
			</table>
		</s:form>

	</div>

</body>
</html>