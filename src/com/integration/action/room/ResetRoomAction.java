package com.integration.action.room;

import com.opensymphony.xwork2.ActionSupport;
import com.integration.entity.Order;
import com.integration.entity.Room;
import com.integration.service.OrderService;
import com.integration.service.RoomService;

@SuppressWarnings("serial")
public class ResetRoomAction extends ActionSupport {
	private Room room;
	private RoomService roomService;
	private OrderService orderService;
	

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
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

	@Override
	public String execute() throws Exception {
		this.room = roomService.findRoomById(room.getRoomid());
		room.setStatus(0);
		
		roomService.updateRoom(room);
		Order order = orderService.findOrderByStatusAndRoomid(1, this.room.getRoomid());
		orderService.removeOrder(order);
		return SUCCESS;
	}
}