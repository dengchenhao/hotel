<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户所预定房间列表</title>
<script type="text/javascript">
	function sav() {
		if (confirm("你确定要修改房间状态吗?")) {
			return true;
		}
		return false;
	}
	function del() {
		if (confirm("你确定要退订该房间吗?")) {
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
		<font color="red">
			<center>所预定的房间列表</center>
		</font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>房间序号</td>
			<td>房间名称</td>
			<td>房间价格</td>
			<td>房间型号</td>
			<td>房间状态</td>
			<td>预订人</td>
			<td>预定时间</td>
			<td>入住时间</td>
			<td style="display: none">订房人编号</td>
			<td style="display: none"><s:property value="#room.userid" /></td>
			<td>操作</td>
		</tr>
		<s:iterator value="#request.listAllOrder" id="order">
			<tr>
				<td><s:property value="#order.roomid" /></td>
				<td><s:property value="#order.name" /></td>
				<td><s:property value="#order.price" /></td>
				<td><s:if test="#order.category == 'single'">单人间</s:if> <s:if
						test="#order.category == 'double'">双人间</s:if> <s:if
						test="#order.category == 'three'">三人间</s:if></td>
				<td><s:if test="#order.status == 1">已预定</s:if> <%-- 						<s:elseif test="#room.status == 1">预定未入住</s:elseif> --%>
					<s:else>已入住</s:else></td>
				<td><s:property value="#order.username" /></td>
				<td><s:property value="#order.registertime" /></td>
				<td><s:property value="#order.starttime" /></td>
				<td><s:a
						href="listOrder!add?roomid=%{#order.roomid}&status=%{#order.status}&price=%{#order.price}&userid=%{#order.userid}"
						onclick="return sav();">管理员操作</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>