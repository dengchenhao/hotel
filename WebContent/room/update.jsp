<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改房间信息</title>
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
		<font color="red"><center>修改房间</center> </font>
	</h1>
	<div id="center1">
		<s:form action="updateRoom" id="center2">
			<table>
				<tr>
					<td><s:hidden name="room.roomid" value="%{room.roomid}"></s:hidden>
					</td>
				</tr>
				<tr>
					<td class="tdLabel">房间名称:</td>
					<td><s:textfield name="room.name" value="%{room.name}"
							theme="simple" readonly="true"></s:textfield></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="tdLabel">房间价格:</td>
					<td><s:textfield name="room.price" value="%{room.price}"
							theme="simple"></s:textfield></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="tdLabel">房间类型:</td>
					<td><select name="room.category">
							<option value="single" selected="selected">单人间</option>
							<option value="double">双人间</option>
							<option value="three">三人间</option>
					</select></td>
				</tr>
				<tr></tr>
				<tr>
					<td class="tdLabel">房间状态:</td>
					<s:if test="room.status == 0">
						<td><select name="room.status">
								<option value="0" selected="selected">空房</option>
								<option value="1">有客人</option>
						</select></td>
					</s:if>
					<s:else>
						<td><select name="room.status">
								<option value="0">空房</option>
								<option value="1" selected="selected">有客人</option>
						</select></td>
					</s:else>
				</tr>
				<tr>
					<td><s:submit value="修改"></s:submit></td>
				</tr>
			</table>
		</s:form>

	</div>

</body>
</html>