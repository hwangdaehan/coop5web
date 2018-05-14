package yjc.wdb.service;

import yjc.wdb.domain.MemberVO;

public interface MemberService {
	public void insertMember(MemberVO memberVO) throws Exception;
	public MemberVO loginCheck(String userid, String userpw) throws Exception;
}
