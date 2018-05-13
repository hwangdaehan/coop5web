package yjc.wdb.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.b_floor;
import yjc.wdb.domain.building;


@Repository
public class BuildingDAOimpl implements BuildingDAO {

	@Inject
	SqlSession session;
	private static final String NAMESPACE = "yjc.wdb.mappers.BuildingMapper";

	@Override
	public void create(building build) throws Exception {
		session.insert(NAMESPACE + ".create", build);
	}

	@Override
	public void dcreate(b_floor floor) throws Exception {
		session.insert(NAMESPACE+".dcreate", floor);
		
	}

	@Override
	public List<building> listAll() throws Exception {
		List<building> list=session.selectList(NAMESPACE+".listAll");
		return list;
	}

}
