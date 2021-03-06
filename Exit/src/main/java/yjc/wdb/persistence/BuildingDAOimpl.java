package yjc.wdb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import yjc.wdb.domain.MemberVO;
import yjc.wdb.domain.b_floor;
import yjc.wdb.domain.building;
import yjc.wdb.domain.enjoy;

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
		session.insert(NAMESPACE + ".dcreate", floor);

	}

	@Override
	public List<building> listAll() throws Exception {
		List<building> list = session.selectList(NAMESPACE + ".listAll");
		return list;
	}

	@Override
	public b_floor ImgSelect(b_floor b) throws Exception {
		b_floor drawing = session.selectOne(NAMESPACE + ".ImgSelect", b);
		return drawing;
	}

	@Override
	public void enjoyInsert(enjoy enjoy) throws Exception {
		session.insert(NAMESPACE+".enjoyInsert",enjoy);
		}

	@Override
	public List<enjoy> enjoylist(MemberVO m) throws Exception {
		
		List<enjoy> enjoylist =session.selectList(NAMESPACE+".enjoylist", m);
		
		return enjoylist;
	}

	@Override
	public List<building> list() throws Exception {

		List<building> list =session.selectList(NAMESPACE+".list");
		return list;
	}

	@Override
	public building AxisFind(building build) throws Exception {
		
		building  b =session.selectOne(NAMESPACE+".AxisFind",build);
		return b;
	}

	@Override
	public List<b_floor> ImgAllSelect(b_floor b) throws Exception {
		List<b_floor> ImgAllSelect =session.selectList(NAMESPACE+".ImgAllSelect", b);
		
		return ImgAllSelect;
	}

	}

