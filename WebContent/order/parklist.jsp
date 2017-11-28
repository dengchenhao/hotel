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
		if (confirm("你确定要预该车位吗?")) {
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
		<font color="red"><center>所有车位</center> </font>
	</h1>
	<%-- 		<s:form action="park!add"> --%>
	<%-- 		<s:textfield name="admin.username" label="用户名"></s:textfield> --%>
	<%-- 			<s:password name="admin.password" label="密码"></s:password> --%>
	<%-- 			<s:submit value="添 加"></s:submit> --%>
	<%-- 		</s:form> --%>
	<table border="1" width="80%" align="center" class="table">
		<tr>
			<td>车位号序号</td>

			<td>车位状态</td>
			<td>是否预定</td>
		</tr>
		<s:iterator value="#request.parkid" id="parkcar">
			<tr>
				<td><s:property value="#parkcar.parkid" /></td>

				<td><s:if test="#parkcar.status == 0">空闲</s:if> <s:elseif
						test="#room.status == 2">预定未入住</s:elseif> <s:else>已占用</s:else></td>
				<td><s:a href="park!add?parkid=%{#parkcar.parkid}"
						onclick="return sav();">预定</s:a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>