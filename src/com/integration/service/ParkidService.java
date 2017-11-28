package com.integration.service;

import java.util.List;

import com.integration.entity.Parkcar;

public interface ParkidService {
	public List<Parkcar> findAllOrder();

	public Parkcar findParkById(Integer id);

	public void updateParkcar(Parkcar car);

	public List<Parkcar> findParkByStatus(Integer id);

	public List<Parkcar> findParkByUseridAndStatus(Integer userid, int status);
}
