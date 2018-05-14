package yjc.wdb.domain;

import java.sql.Timestamp;

public class b_floor {

	
	private String floor;
	private String bid;
	private String drawing;
	private Timestamp regdate;
	private Timestamp moddate;
	
	
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getDrawing() {
		return drawing;
	}
	public void setDrawing(String drawing) {
		this.drawing = drawing;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getModdate() {
		return moddate;
	}
	public void setModdate(Timestamp moddate) {
		this.moddate = moddate;
	}
}
