package com.integration.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.integration.entity.Admin;
import com.integration.util.SessionUtil;

@SuppressWarnings("serial")
public class AdminInterceptor extends AbstractInterceptor {
	@SuppressWarnings("unchecked")
	@Override
	// ����Ա��¼������
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		SessionUtil sessionUtil = new SessionUtil();
		Admin admin = null;
				//(Admin)sessionUtil.getObject("admin");
		if (admin != null) {
			return invocation.invoke();
		}
		context.put("message", "����û�е�¼�����¼ϵͳ��");
		return Action.LOGIN;
	}
}