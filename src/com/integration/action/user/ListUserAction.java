package com.integration.action.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.integration.entity.Order;
import com.integration.entity.Room;
import com.integration.entity.User;
import com.integration.service.OrderService;
import com.integration.service.RoomService;
import com.integration.service.UserService;
import com.integration.vo.UserVo;

@SuppressWarnings("serial")
public class ListUserAction extends ActionSupport {
	private UserService service;
	private OrderService orderService;
	private RoomService roomService;

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public UserService getService() {
		return service;
	}

	public void setService(UserService service) {
		this.service = service;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		Map request = (Map) ActionContext.getContext().get("request");
		List<User> userList = this.service.findAll();
		List<UserVo> userVoList = new ArrayList<UserVo>();
		for (User user : userList) {
			UserVo userVo = new UserVo();
			userVo.setCreditnum(user.getCreditnum());
			List<Order> order = orderService.getUserOrder(user);
			if (order.size() > 0) {
				userVo.setStarttime(order.get(order.size()-1).getStarttime());
				userVo.setEndtime(order.get(order.size()-1).getEndtime());
				Room room = roomService.findRoomById(order.get(order.size()-1).getRoomid());
				if (room != null) {
					userVo.setRoomname(room.getName());
				}

			}
			userVo.setMobile(user.getMobile());
			userVo.setUserid(user.getUserid());
			userVo.setUsername(user.getUsername());
			userVoList.add(userVo);
		}
		request.put("list", userVoList);
		return SUCCESS;
	}

	public RoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}
}