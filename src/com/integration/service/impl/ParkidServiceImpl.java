package com.integration.service.impl;

import java.util.List;

import com.integration.dao.ParkidDao;
import com.integration.entity.Parkcar;
import com.integration.service.ParkidService;

public class ParkidServiceImpl implements ParkidService {
	private ParkidDao parkidDao;

	public ParkidDao getParkidDao() {
		return parkidDao;
	}

	public void setParkidDao(ParkidDao parkidDao) {
		this.parkidDao = parkidDao;
	}

	@Override
	public List<Parkcar> findAllOrder() {

		return parkidDao.findAllOrder();
	}

	@Override
	public Parkcar findParkById(Integer id) {
		// TODO Auto-generated method stub
		return parkidDao.findParkById(id);
	}

	public void updateParkcar(Parkcar car) {
		parkidDao.updateParkcar(car);

	}

	public List<Parkcar> findParkByStatus(Integer id) {
		return parkidDao.findParkByStatus(id);
	}

	@Override
	public List<Parkcar> findParkByUseridAndStatus(Integer userid, int status) {
		return parkidDao.findParkByUseridAndStatus(userid,status);
	}

}
