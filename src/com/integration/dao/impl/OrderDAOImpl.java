package com.integration.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.integration.entity.Order;
import com.integration.entity.User;
import com.integration.dao.OrderDAO;

public class OrderDAOImpl extends HibernateDaoSupport implements OrderDAO {
	@SuppressWarnings("unchecked")
	public List<Order> findAllOrder() {
		String hql = "from Order ord order by ord.orderid asc";
		return (List<Order>) this.getHibernateTemplate().find(hql);
	}

	public Order findOrderById(Integer id) {
		return (Order) this.getHibernateTemplate().get(Order.class, id);
	}

	public void removeOrder(Order order) {
		this.getHibernateTemplate().delete(order);
	}

	public void saveOrder(Order order) {
		this.getHibernateTemplate().save(order);
	}

	public void updateOrder(Order order) {
		this.getHibernateTemplate().update(order);
	}

	@SuppressWarnings("unchecked")
	public List<Order> getUserOrder(User user) {
		String hql = "from Order ord where ord.userid='" + user.getUserid()
				+ "'";
		return (List<Order>) this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public Order findOrderByUseridAndRoomid(int userid, int roomid) {
		String hql = "from Order ord where ord.userid=" + userid
				+ " and ord.roomid=" + roomid + "";
		List<Order> orders = (List<Order>) this.getHibernateTemplate()
				.find(hql);
		return orders == null ? null : orders.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrderByStatus(int status) {
		String hql = "from Order ord where ord.status='" + status
				+ "'order by ord.orderid asc";
		List<Order> orders = (List<Order>) this.getHibernateTemplate()
				.find(hql);
		return orders;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Order findOrderByUserid(Integer userid) {
		String hql = "from Order ord where ord.userid='" + userid
				+ "' order by ord.orderid asc";
		List<Order> orders = (List<Order>) this.getHibernateTemplate()
				.find(hql);
		if (orders.size() == 0) {
			return null;
		}
		return orders.get(0);
	}

	@Override
	public Object findOrderByStatusAndRoomid(int status, Integer roomid) {
		String hql = "from Order ord where ord.status='" + status
				+ "' order by ord.orderid asc";
		List<Order> orders = (List<Order>) this.getHibernateTemplate()
				.find(hql);
		if (orders.size() == 0) {
			return null;
		}
		return orders.get(0);
	}
}
