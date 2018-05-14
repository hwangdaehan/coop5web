package yjc.wdb.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject // 주입받아옴
	private SqlSession session;
	private static final String NAMESPACE = "yjc.wdb.mappers.ExitMapper";

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao확인용: 메일주소: "+memberVO.getEmail());
		session.insert(NAMESPACE + ".insertMember", memberVO);
	}

	@Override
	public MemberVO loginCheck(String userid, String userpw) throws Exception {
		// TODO Auto-generated method stub

		Map<String, String> paramMap = new HashMap<String, String>();

		paramMap.put("userid", userid);
		paramMap.put("userpw", userpw);

		return session.selectOne(NAMESPACE + ".loginCheck", paramMap);
	}

}
