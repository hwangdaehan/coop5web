package yjc.wdb.domain;

public class MemberVO {
	private int mno;
	private String userid;
	private String userpw;
	private String nickname;
	private String pnumber;
	private String address;
	private String email;
	private String result = "";
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}

	
	@Override
	public String toString() {
		return "MemberVO [userid"+userid+"userpw"+userpw+
				"nickname"+nickname+"address"+address+
				"pnumber"+pnumber+"email"+email+"]";
	}
	
	//test
}
