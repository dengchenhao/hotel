package com.integration.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.integration.entity.Room;
import com.integration.dao.RoomDAO;

public class RoomDAOImpl extends HibernateDaoSupport implements RoomDAO {
	@SuppressWarnings("unchecked")
	public List<Room> findAllRoom() {
		String hql = "from Room room order by room.roomid desc";
		return (List<Room>) this.getHibernateTemplate().find(hql);
	}

	public Room findRoomById(Integer id) {
		// String hql =
		// "from Room room where status='1' order by room.roomid desc";
		// return (Room) this.getHibernateTemplate().find(hql);
		// 查看该用户是否有预定
		return (Room) this.getHibernateTemplate().get(Room.class, id);
	}

	public void removeRoom(Room room) {
		this.getHibernateTemplate().delete(room);
	}

	public void saveRoom(Room room) {
		this.getHibernateTemplate().save(room);
	}

	public void updateRoom(Room room) {
		this.getHibernateTemplate().update(room);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Room> findRoomByStatus(String status) {
		String hql = "from Room room where room.status='" + status
				+ "' order by room.roomid desc";
		return (List<Room>) this.getHibernateTemplate().find(hql);
	}
}
