package com.windy.vo;

public class Order {
	String o_code, p_code, id, o_option, o_date, o_state, p_name;
	int o_count, o_price;

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getO_code() {
		return o_code;
	}

	public void setO_code(String o_code) {
		this.o_code = o_code;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getO_option() {
		return o_option;
	}

	public void setO_option(String o_option) {
		this.o_option = o_option;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	public String getO_state() {
		return o_state;
	}

	public void setO_state(String o_state) {
		this.o_state = o_state;
	}

	public int getO_count() {
		return o_count;
	}

	public void setO_count(int o_count) {
		this.o_count = o_count;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

}
