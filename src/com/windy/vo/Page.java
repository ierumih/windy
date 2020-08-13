package com.windy.vo;

public class Page {
	int listcount, currentpage, limitindex, endpage, s_limitindex;
	String board_name, s_type, s_key, p_kind;
	
	public int getS_limitindex() {
		return s_limitindex;
	}

	public void setS_limitindex() {
		this.s_limitindex = (currentpage-1)*6;
	}

	
	public String getP_kind() {
		return p_kind;
	}

	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getS_key() {
		return s_key;
	}

	public void setS_key(String s_key) {
		this.s_key = s_key;
	}

	public int getLimitindex() {
		return limitindex;
	}

	public void setLimitindex() {
		this.limitindex = (currentpage-1)*20;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public int getListcount() {
		return listcount;
	}

	public void setListcount(int listcount) {
		this.listcount = listcount;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	
}
