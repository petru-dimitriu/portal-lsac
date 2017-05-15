package com.tip.data;

import java.sql.Timestamp;
import java.util.List;

public class Poll {
	private int id;
	private String title;
	private Timestamp start, stop;
	private List<String> options;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getStart() {
		return start;
	}
	public void setStart(Timestamp start) {
		this.start = start;
	}
	public Timestamp getStop() {
		return stop;
	}
	public void setStop(Timestamp stop) {
		this.stop = stop;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	
}
