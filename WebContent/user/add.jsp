<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�û�ע��</title>
<%@include file="/info/adminInfo.jsp"%>
<%@include file="../super.jsp"%>
<style type="text/css">
#saveUser {
	width: 50%;
	margin: 5% 20% 60%;
}

#add {
	background: white;
	margin: 0% 10% 60%;
}

div {
	width: 778px;
	margin: 0 auto;
	background: #fff;
	text-align: left;
}

.label {
	color: black;
	margin-left: 5px
}
</style>
</head>
<body>
	<div id="add">
		<h1>
			<font color="red">����û�</font>
		</h1>
		<s:form action="saveUser">
			<s:textfield name="user.username" label="�û���"></s:textfield>
			<s:password name="user.password" label="����"></s:password>
			<s:textfield name="user.mobile" label="�ֻ�����"></s:textfield>
			<s:textfield name="user.creditnum" label="���֤����"></s:textfield>
			<s:submit value="�� ��"></s:submit>
		</s:form>
	</div>

</body>
</html>
