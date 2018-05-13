package yjc.wdb.service;


import java.util.List;

import yjc.wdb.domain.b_floor;
import yjc.wdb.domain.building;

public interface BuildingService {

	
	
	public void create(building build) throws Exception ;
	
	public void dcreate(b_floor floor) throws Exception;
	
	public List<building> listAll() throws Exception;
	
	
}
