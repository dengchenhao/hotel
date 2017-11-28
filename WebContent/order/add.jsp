<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>增加入住信息</title>
<script type="text/javascript">
	function sav() {
		if (confirm("你确定要入住该房间吗?")) {
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
		<font color="red"><center>新增入住信息</center> </font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td colspan="6">
				<h2>
					<font color="red"><center>
							<br>房间列表
						</center> </font>
				</h2>
			</td>
		</tr>
		<tr>
			<td>房间号</td>
			<td>房间名称</td>
			<td>房间价格</td>
			<td>房间类型</td>
			<td>房间状态</td>
			<td>操作</td>
		</tr>
		<s:iterator value="#request.listRoom" id="room">
			<tr>
				<td><s:property value="#room.roomid" /></td>
				<td><s:property value="#room.name" /></td>
				<td><s:property value="#room.price" /></td>
				<td><s:if test="#room.category == 'single'">单人间</s:if> <s:if
						test="#room.category == 'double'">双人间</s:if> <s:if
						test="#room.category == 'three'">三人间</s:if></td>
				<td><s:if test="#room.status == 0">空闲</s:if> <s:elseif
						test="#room.status == 1">预定未入住</s:elseif> <s:else>已入住</s:else></td>
				<td><s:if test="#room.status == 0"><s:a
						href="saveOrder!add?order.roomid=%{#room.roomid}&room.roomid=%{#room.roomid}&name=%{#room.name}&price=%{#room.price}&category=%{#room.category}"
						onclick="return sav();">预定</s:a></s:if></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>