package com.tip.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.tip.connection.SqlConnection;

@Path("GetUsersAsJSON")
public class GetUsersAsJSON {
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String getJson() {
		return new Gson().toJson((new SqlConnection().getUserList())); 
	}
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String getJsonHtml(){
		return getJson(); 
	}
}
