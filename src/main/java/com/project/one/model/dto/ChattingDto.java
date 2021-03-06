package com.project.one.model.dto;

import java.util.Date;

public class ChattingDto {
	private int chatting_no;
	private String chatting_content;
	private Date chatting_date;
	private String chatting_read;
	private int room_no;
	private String member_id;
	
	public ChattingDto() {
	}


	public ChattingDto(int chatting_no, String chatting_content, Date chatting_date, String chatting_read, int room_no,
			String member_id) {
		super();
		this.chatting_no = chatting_no;
		this.chatting_content = chatting_content;
		this.chatting_date = chatting_date;
		this.chatting_read = chatting_read;
		this.room_no = room_no;
		this.member_id = member_id;
	}

	public int getChatting_no() {
		return chatting_no;
	}

	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}

	public String getChatting_content() {
		return chatting_content;
	}

	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}

	public Date getChatting_date() {
		return chatting_date;
	}

	public void setChatting_date(Date chatting_date) {
		this.chatting_date = chatting_date;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getChatting_read() {
		return chatting_read;
	}


	public void setChatting_read(String chatting_read) {
		this.chatting_read = chatting_read;
	}

	@Override
	public String toString() {
		return "ChattingDto [chatting_no=" + chatting_no + ", chatting_content=" + chatting_content + ", chatting_date="
				+ chatting_date + ", chatting_read=" + chatting_read + ", room_no=" + room_no + ", member_id="
				+ member_id + "]";
	}
	
}
