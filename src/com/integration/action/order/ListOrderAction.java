package com.integration.action.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.BasicSliderUI.ActionScroller;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.integration.entity.Room;
import com.integration.entity.Order;
import com.integration.service.RoomService;
import com.integration.service.OrderService;

@SuppressWarnings("serial")
public class ListOrderAction extends ActionSupport {
	private Order order;
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
		// 得到orders的所有用户的订单
		int status = 1;
		List<Order> orders = this.orderService.findOrderByStatus(status);
		// HttpServletRequest request = ServletActionContext.getRequest();
		// String userid = request.getParameter("userid");
		// Integer a = Integer.valueOf(userid);
		// String roomid = request.getParameter("roomid");
		// Integer b = Integer.valueOf(roomid);
		// this.orderService.findOrderByUseridAndRoomid(a, b);
		// List<Order> orders = this.orderService.findAllOrder();
		// 根据用户的order.getRoomid得到用户所定的房间存入hotels
		// LinkedList<Room> rooms = new LinkedList<Room>();
		// if (orders.size() > 0) {
		// for (Order order : orders) {
		// rooms.add((Room) this.roomService.findRoomById(order
		// .getRoomid()));
		// }
		// }
		// 保存用户所定的房间hotels到listAllHotel里面，在jsp里面取出来显示
		Map requestList = (Map) ActionContext.getContext().get("request");

		requestList.put("listAllOrder", orders);
		return SUCCESS;
	}

	public String add() {
		// 判断房间是否开放
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("userid");

		String status = request.getParameter("status");
		Integer a, b, userid;
		String roomid = request.getParameter("roomid");
		a = Integer.parseInt(status); // order 状态
		b = Integer.parseInt(roomid); // 房间号
		userid = Integer.parseInt(id);
		Room roomUser = this.roomService.findRoomById(b);
		if (a == 1) {
			// 根据roomid找到对应的哪条数据
			// Order oder = this.orderService.findOrderById(id);
			// 如果房间状态等于1的时候我们把状态变成2这样订单会显示成已入住
			// oder.setStatus(2);
			// this.orderService.updateOrder(oder);
			// 同样放假信息也修改成已入住状态
			roomUser.setStatus(2);
			this.roomService.updateRoom(roomUser);
			Order oer = orderService.findOrderByUseridAndRoomid(userid, b);
			oer.setStatus(2);// 更新订单
			Date date = new Date();// 获取时间
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String time = sdf.format(date);
			oer.setStarttime(time);
			oer.setMoney("0");
			orderService.updateOrder(oer);

			return "addSuc";
		} else {
			message = "该房间已经有客人入住了。";
			return "addFail";
		}

	}
}