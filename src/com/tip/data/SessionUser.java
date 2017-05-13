package com.tip.data;

import java.util.Date;

public class SessionUser {
	
	private static SessionUser instance;
	private String name;
	private String mail;
	private Date date;
	
	// constructor privat
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	private SessionUser()
	{
	}
	
	public static SessionUser getInstance ()
	{
		if (instance == null)
			instance = new SessionUser();
		return instance;
	}
	
	public static void removeInstance ()
	{
		instance = null;
	}
	
	
	
	
}
