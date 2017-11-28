package com.integration.action.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.integration.entity.Order;
import com.integration.entity.Parkcar;
import com.integration.entity.Room;
import com.integration.service.OrderService;
import com.integration.service.ParkidService;
import com.integration.service.RoomService;
import com.integration.service.UserService;
import com.integration.vo.ParkVo;
import com.opensymphony.xwork2.ActionContext;

public class IntheparkAction {
	private Order order;
	private Room room;
	private OrderService orderService;
	private RoomService roomService;
	private UserService userService;
	private String message;
	private ParkidService parkidService;// xhcj12311

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public RoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

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

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		List<Parkcar> orders = this.parkidService.findAllOrder();
		List<ParkVo> voList = new ArrayList<ParkVo>();
		for (Parkcar parkcar : orders) {
			Order orderByPark = orderService.findOrderByUserid(parkcar
					.getUserid());
			ParkVo vo = new ParkVo();
			vo.setCarnumber(parkcar.getCarnumber());
			vo.setEndtime(parkcar.getEndtime());
			vo.setParkid(parkcar.getParkid());
			if (orderByPark != null) {
				vo.setRoomid(orderByPark.getRoomid());
			}
			vo.setStarttime(parkcar.getStarttime());
			vo.setStatus(parkcar.getStatus());
			vo.setUserid(parkcar.getUserid());
			vo.setUsername(parkcar.getUsername());
			voList.add(vo);
		}
		Map requestList = (Map) ActionContext.getContext().get("request");
		requestList.put("inthepark", voList);
		return "success";

	}

	@SuppressWarnings("unchecked")
	public String leave() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String parkid1 = request.getParameter("parkid");
		Integer parkid = Integer.valueOf(parkid1);
		Parkcar car = new Parkcar();
		car.setParkid(parkid);
		car.setStatus(0);
		this.parkidService.updateParkcar(car);
		List<Parkcar> orders = this.parkidService.findParkByStatus(0);
		Map requestList = (Map) ActionContext.getContext().get("request");
		requestList.put("intheparkfree", orders);
		return "ok";
	}

}
