package yjc.wdb.service;


import java.util.List;

import yjc.wdb.domain.MemberVO;
import yjc.wdb.domain.b_floor;
import yjc.wdb.domain.building;
import yjc.wdb.domain.enjoy;

public interface BuildingService {

	
	
	public void create(building build) throws Exception ;
	
	public void dcreate(b_floor floor) throws Exception;
	
	public List<building> listAll() throws Exception;
	
	public b_floor ImgSelect(b_floor b) throws Exception;
	
	public void enjoyInsert(enjoy enjoy)throws Exception;
	
	public List<enjoy> enjoylist(MemberVO m) throws Exception;
	
	public List<building> list() throws Exception;
	
	public building AxisFind(building build) throws Exception;
	
	public List<b_floor> ImgAllSelect(b_floor b)throws Exception;
}
