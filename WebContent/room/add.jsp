<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>增加房间</title>
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
		<font color="red"><center>增加房间</center> </font>
	</h1>
	<div id="center1">
		<s:form action="saveRoom" id="center2">
			<tr>
				<td class="tdLabel">房间名称:</td>
				<td><s:textfield name="room.name" theme="simple"></s:textfield>
				</td>
			</tr>
			<tr>
				<td class="tdLabel">房间价格:</td>
				<td><s:textfield name="room.price" theme="simple"></s:textfield>
				</td>
			</tr>
			<tr>
				<td class="tdLabel">房间类型:</td>
				<td><select name="room.category">
						<option value="single" selected="selected">单人间</option>
						<option value="double">双人间</option>
						<option value="three">三人间</option>
				</select></td>
			</tr>
			<tr>
				<td class="tdLabel">房间状态:</td>
				<td><select name="room.status">
						<option value="0" selected="selected">空闲</option>
						<option value="1">预定未入住</option>
						<option value="2">已入住</option>
				</select></td>
			</tr>
			<s:submit value="增 加"></s:submit>
		</s:form>
	</div>
</body>
</html>