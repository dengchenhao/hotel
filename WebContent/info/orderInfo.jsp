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
	function del() {
		if (confirm("你确定要退订该房间吗?")) {
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
		<font color="red"><center>所预定的房间列表</center> </font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>房间序号</td>
			<td>房间名称</td>

			<td>房间价格</td>
			<td>房间型号</td>
			<td>预订人</td>
			<td>状态</td>
			<td style="display: none">订房人编号</td>
			<td>操作</td>
		</tr>
		<s:iterator value="#request.listUserOrder" id="order">
			<tr>
				<td><s:property value="#order.roomid" /></td>
				<td><s:property value="#order.name" /></td>
				<td><s:property value="#order.price" /></td>
				<td><s:if test="#order.category == 'single'">单人间</s:if> <s:if
						test="#order.category == 'double'">双人间</s:if> <s:if
						test="#order.category == 'three'">三人间</s:if></td>
				<td><s:property value="#order.username" /></td>
				<td><s:if test="#order.status == 1">已预定</s:if> <%-- 						<s:elseif test="#room.status == 2">预定未入住</s:elseif> --%>
					<s:if test="#order.status == 2">已入住</s:if> 
					<s:if test="#order.status == 3">已退房</s:if> 
				<td style="display: none"><s:property value="#room.userid" />
				</td>
				<td><s:if test="#order.status == 1"><s:a
						href="/hotel/orderService!delete?order.orderid=%{#order.orderid}"
						onclick="return del();">退订</s:a></td></s:if>
			</tr>
		</s:iterator>
	</table>
</body>
</html>
