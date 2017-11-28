package com.integration.action.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.integration.entity.Room;
import com.integration.entity.Order;
import com.integration.entity.User;
import com.integration.service.RoomService;
import com.integration.service.OrderService;

@SuppressWarnings("serial")
public class SaveOrderAction extends ActionSupport {
	private Order order;
	private User user;
	private Room room;
	private OrderService orderService;
	private RoomService roomService;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public RoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		Map request = (Map) ActionContext.getContext().get("request");

		request.put("listRoom", this.roomService.findAllRoom());
		return SUCCESS;
	}

	public String add() {
		// �жϷ����Ƿ񿪷�
		Room roomUser = this.roomService.findRoomById(room.getRoomid());
		if (roomUser.getStatus() == 0) {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			order.setUserid(user.getUserid());
			order.setUsername(user.getUsername());
			String name = request.getParameter("name");
			order.setName(name);
			String price = request.getParameter("price");
			order.setPrice(price);
			String category = request.getParameter("category");
			order.setCategory(category);
			String status = request.getParameter("status");
			order.setStatus(1);
			Date date = new Date();// ��ȡʱ��
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String time = sdf.format(date);
			order.setRegistertime(time);
			// ActionContext actionContext = ActionContext.getContext();
			// Map session = actionContext.getSession();
			// User object = (User)session.get("user");
			// String username = object.getUsername();
			// Ԥ��
			this.orderService.saveOrder(order);
			// ���÷���Ϊ�����п��ˣ�
			roomUser.setStatus(1);
			this.roomService.updateRoom(roomUser);
			return "addSuc";
		} else {
			message = "�÷����Ѿ��п�����ס�ˡ�";
			return "addFail";
		}
	}

}