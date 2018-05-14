package yjc.wdb.persistence;

import yjc.wdb.domain.MemberVO;

public interface MemberDAO {
	
	public void insertMember(MemberVO memberVO) throws Exception;
	public MemberVO loginCheck(String userid, String userpw) throws Exception;
}
