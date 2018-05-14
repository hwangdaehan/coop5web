package yjc.wdb.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import yjc.wdb.domain.MemberVO;
import yjc.wdb.persistence.MemberDAO;

@Repository
public class MemberServiceImpl implements MemberService {
	
	@Inject // 주입받아옴
	private MemberDAO dao;
	
	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스 진입");
		dao.insertMember(memberVO);
	}
	@Override
	public MemberVO loginCheck(String userid, String userpw) throws Exception{
		// TODO Auto-generated method stub
		return dao.loginCheck(userid, userpw);
	}

}
