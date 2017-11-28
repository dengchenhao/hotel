package com.integration.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.integration.dao.ParkidDao;
import com.integration.entity.Parkcar;
import com.integration.entity.Room;

//œ»ºÃ≥–
public class ParkidDAOImpl extends HibernateDaoSupport implements ParkidDao {
	@SuppressWarnings("unchecked")
	public List<Parkcar> findAllOrder() {
		String hql = "from Parkcar car order by car.parkid asc";
		return (List<Parkcar>) this.getHibernateTemplate().find(hql);
	}

	@Override
	public Parkcar findParkById(Integer id) {
		return (Parkcar) this.getHibernateTemplate().get(Parkcar.class, id);
	}

	@Override
	public void updateParkcar(Parkcar car) {
		this.getHibernateTemplate().update(car);

	}

	@Override
	public List<Parkcar> findParkByStatus(Integer id) {
		String hql = "from Parkcar car where car.status ='" + id
				+ "'order by car.parkid asc";
		return (List<Parkcar>) this.getHibernateTemplate().find(hql);
	}

	@Override
	public List<Parkcar> findParkByUseridAndStatus(Integer userid, int status) {
		String hql = "from Parkcar car where car.userid ='" + userid + "' and car.status='"+status
				+ "' order by car.parkid asc";
		return (List<Parkcar>) this.getHibernateTemplate().find(hql);
	}

}
