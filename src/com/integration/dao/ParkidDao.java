package com.integration.dao;

import java.util.List;

import com.integration.entity.Parkcar;

public interface ParkidDao {
	public List<Parkcar> findAllOrder();

	public Parkcar findParkById(Integer id);

	public void updateParkcar(Parkcar car);

	public List<Parkcar> findParkByStatus(Integer status);

	public List<Parkcar> findParkByUseridAndStatus(Integer userid, int status);

}
