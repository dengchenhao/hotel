package com.integration.action.order;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class InOrderHotelAction {
	private Order order;
	private Room room;
	private OrderService orderService;
	private RoomService roomService;
	private ParkidService parkidService;
	private String message;

	public ParkidService getParkidService() {
		return parkidService;
	}

	public void setParkidService(ParkidService parkidService) {
		this.parkidService = parkidService;
	}

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

	@SuppressWarnings("unchecked")
	public String execute() throws Exception {
		List<Order> orders = this.orderService.findOrderByStatus(2);
		Map requestList = (Map) ActionContext.getContext().get("request");
		requestList.put("listUserOder", orders);
		return "success1";

	}

	// 结账
	public String bill() throws ParseException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String str1 = request.getParameter("roomid");
		String str2 = request.getParameter("price");
		String str3 = request.getParameter("status");
		String str4 = request.getParameter("userid");
		Integer roomid = Integer.valueOf(str1);
		Double price = Double.valueOf(str2);
		Integer status = Integer.valueOf(str3);
		Integer userid = Integer.valueOf(str4);
		if (status == 2) {
			// 获取当前结账时间
			Date date1 = new Date();
			// 获取入住的时间
			Order ode = this.orderService.findOrderByUseridAndRoomid(userid,
					roomid);
			String date2 = ode.getStarttime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date strattime = sdf.parse(date2);
			String endtime = sdf.format(date1);
			long m = date1.getTime() - strattime.getTime();
			// 计算天数
			Integer I = (int) (m / (1000 * 60 * 60 * 24));
			if (I == 0) {
				I = 1;
			}
			// 计算出价格
			Double bill = I * price;
			// 把价格存到我的数据库 long m = sdf.parse(date1).getTime() -
			// sdf.parse(date1).getTime();
			message = bill.toString();
			ode.setMoney(message);
			// 并且离店
			ode.setEndtime(endtime);
			ode.setStatus(3);
			this.orderService.updateOrder(ode);
			Room room1 = this.roomService.findRoomById(roomid);
			List<Parkcar> carList = parkidService.findParkByUseridAndStatus(userid, 1);
			for(Parkcar car : carList) {
				car.setCarnumber(null);
				car.setEndtime(null);
				car.setStarttime(null);
				car.setStatus(0);
				car.setUserid(null);
				car.setUsername(null);
				this.parkidService.updateParkcar(car);
			}
			
			// 把该房间的信息设置为空房
			room1.setStatus(0);
			this.roomService.updateRoom(room1);
		}
		return "billSuc";
	}

}
