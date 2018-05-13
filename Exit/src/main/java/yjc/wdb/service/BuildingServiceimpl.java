package yjc.wdb.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.b_floor;
import yjc.wdb.domain.building;
import yjc.wdb.persistence.BuildingDAO;


@Service
public class BuildingServiceimpl implements BuildingService {

	
	@Inject
	BuildingDAO dao;
	
	
	@Override
	public void create(building build) throws Exception {
			dao.create(build);
	}


	@Override
	public void dcreate(b_floor floor) throws Exception {
			
		dao.dcreate(floor);
	}


	@Override
	public List<building> listAll() throws Exception {
		return dao.listAll();
	}
	}

	


