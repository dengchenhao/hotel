<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户入住间列表</title>
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
	<%@include file="/info/adminInfo.jsp"%>
	<%@include file="../super.jsp"%>
	<h1>
		<font color="red"><center>所入住的房间列表</center> </font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>房间序号</td>
			<td>房间名称</td>

			<td>房间价格</td>
			<td>房间型号</td>
			<td>入住人</td>
			<td>入住时间</td>
			<td>状态</td>
			<td style="display: none">订房人编号</td>
			<td>操作</td>
		</tr>
		<s:iterator value="#request.listUserOder" id="oder">
			<tr>
				<td><s:property value="#oder.roomid" /></td>
				<td><s:property value="#oder.name" /></td>
				<td><s:property value="#oder.price" /></td>
				<td><s:property value="#oder.category" /></td>
				<td><s:property value="#oder.username" /></td>
				<td><s:property value="#oder.starttime" /></td>
				<td><s:if test="#oder.status == 1">已预定</s:if> <%-- 						<s:elseif test="#room.status == 2">预定未入住</s:elseif> --%>
					<s:if test="#oder.status == 2">已入住</s:if> 
					<s:if test="#oder.status == 3">已结账</s:if> 
				<td style="display: none"><s:property value="#oder.userid" />
				</td>
				<td><s:a
						href="inOrderHotel!bill?roomid=%{#oder.roomid}&status=%{#oder.status}&userid=%{#oder.userid}&price=%{#oder.price}"
						onclick="return sav();">结账</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>