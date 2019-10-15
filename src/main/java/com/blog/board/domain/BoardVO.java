package com.blog.board.domain;

public class BoardVO {

	private String board_no;
	
	private String board_title;
	
	private String board_content;
	
	private String board_regist_date;
	
	private String board_regist_id;
	
	private String board_modify_date;
	
	private String board_modify_id;
	
	private String board_read_count;
	
	private String board_status;
	
	private String board_type;

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_regist_date() {
		return board_regist_date;
	}

	public void setBoard_regist_date(String board_regist_date) {
		this.board_regist_date = board_regist_date;
	}

	public String getBoard_regist_id() {
		return board_regist_id;
	}

	public void setBoard_regist_id(String board_regist_id) {
		this.board_regist_id = board_regist_id;
	}

	public String getBoard_modify_date() {
		return board_modify_date;
	}

	public void setBoard_modify_date(String board_modify_date) {
		this.board_modify_date = board_modify_date;
	}

	public String getBoard_modify_id() {
		return board_modify_id;
	}

	public void setBoard_modify_id(String board_modify_id) {
		this.board_modify_id = board_modify_id;
	}

	public String getBoard_read_count() {
		return board_read_count;
	}

	public void setBoard_read_count(String board_read_count) {
		this.board_read_count = board_read_count;
	}

	public String getBoard_status() {
		return board_status;
	}

	public void setBoard_status(String board_status) {
		this.board_status = board_status;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_regist_date=" + board_regist_date + ", board_regist_id=" + board_regist_id
				+ ", board_modify_date=" + board_modify_date + ", board_modify_id=" + board_modify_id
				+ ", board_read_count=" + board_read_count + ", board_status=" + board_status + ", board_type="
				+ board_type + "]";
	}
	
}
