package com.bean;

import java.util.Date;

public class TapeFile {

	private int id;
	private int userid;
	private int artid;
	
	private String voice_name;
	private Date tape_time;
	
	public Date getTape_time() {
		return tape_time;
	}
	public void setTape_time(Date tape_time) {
		this.tape_time = tape_time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	public String getVoice_name() {
		return voice_name;
	}
	public void setVoice_name(String voice_name) {
		this.voice_name = voice_name;
	}
	
}
