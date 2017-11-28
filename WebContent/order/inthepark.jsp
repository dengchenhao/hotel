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
		<font color="red"><center>所有的车位列表</center> </font>
	</h1>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>车位</td>
			<td>停车人姓名</td>
			<td>停车人房间号</td>
			<td>车位状态</td>

			<td style="display: none">停车人编号</td>
			<td>重置</td>
		</tr>
		<s:iterator value="#request.inthepark" id="oder">
			<tr>
				<td><s:property value="#oder.parkid" /></td>
				<td><s:property value="#oder.username" /></td>
				<td><s:property value="#oder.roomid" /></td>
				<td><s:if test="#oder.status == 0">空闲</s:if> <%-- 						<s:elseif test="#room.status == 2">预定未入住</s:elseif> --%>
					<s:else>已停车</s:else></td>
				<td style="display: none"><s:property value="#oder.userid" />
				</td>
				<td><s:a href="inthepark!leave?parkid=%{#oder.parkid}"
						onclick="return sav();">重置该车位</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>