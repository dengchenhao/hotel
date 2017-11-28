<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../super.jsp"%>
<title>房间列表</title>
<script type="text/javascript">
	function del() {
		if (confirm("确定删除房间信息吗?")) {
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
		<font color="red"><center>房间列表</center> </font>
	</h1>
	<s:a href="/hotel/room/add.jsp">增加房间</s:a>
	<table border="1" width="50%" align="center" class="table">
		<tr>
			<td>房间序号</td>
			<td>房间名称</td>
			<td>房间价格</td>
			<td>房间类型</td>
			<td>房间状态</td>
			<td>删除</td>
			<td>更新</td>
			<td>退房</td>
		</tr>
		<s:iterator value="#request.list" id="room">
			<tr>
				<td><s:property value="#room.roomid" /></td>
				<td><s:property value="#room.name" /></td>
				<td><s:property value="#room.price" /></td>
				<td><s:if test="#room.category == 'single'">单人间</s:if> <s:if
						test="#room.category == 'double'">双人间</s:if> <s:if
						test="#room.category == 'three'">三人间</s:if></td>
				<td><s:if test="#room.status == 0">空闲</s:if>
				<s:if test="#room.status == 1">已预订</s:if>
				<s:if test="#room.status == 2">已入住</s:if>
				</td>
				<td><s:a href="deleteRoom.action?room.roomid=%{#room.roomid}"
						onclick="return del();">删除</s:a></td>
				<td><s:a href="updatePRoom.action?room.roomid=%{#room.roomid}">更新</s:a>
				</td>
				<td><s:if test="#room.status == 1">
						<s:a href="resetRoom.action?room.roomid=%{#room.roomid}">退订</s:a>
					</s:if></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>
