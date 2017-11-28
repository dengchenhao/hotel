package com.integration.action.park;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.integration.entity.Order;
import com.integration.entity.Parkcar;
import com.integration.entity.User;
import com.integration.service.OrderService;
import com.integration.service.ParkidService;
import com.opensymphony.xwork2.ActionContext;

public class ParkidAction {
	private ParkidService parkidService;
	private OrderService orderService;
	private Order order;
	private Parkcar parkcar;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ParkidService getParkidService() {
		return parkidService;
	}

	public void setParkidService(ParkidService parkidService) {
		this.parkidService = parkidService;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Parkcar getParkcar() {
		return parkcar;
	}

	public void setParkcar(Parkcar parkcar) {
		this.parkcar = parkcar;
	}

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("parkid", this.parkidService.findAllOrder());
		return "success";
	}

	public String add() {
		HttpServletRequest req = ServletActionContext.getRequest();
		String parkid = req.getParameter("parkid");
		Integer id = Integer.valueOf(parkid);
		Parkcar car = this.parkidService.findParkById(id);
		if (car.getStatus() == 0) {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			car.setUserid(user.getUserid());
			car.setUsername(user.getUsername());
			car.setStatus(1);
			car.setParkid(id);
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String time = sdf.format(date);
			car.setStarttime(time);
			this.parkidService.updateParkcar(car);
			message = "该车位预订成功。";
			return "addSuc";
		} else {
			message = "该车位已经被占用。";
			return "addFail";
		}

	}
}
