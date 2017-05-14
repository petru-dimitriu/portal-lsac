<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tip.connection.*, java.sql.*" %>
<div id = "innerBody">
	
		<form method="post">
		
		Titlu:     <input type="text" name="titlu"><br><br>
		Conținut:<br>    <textarea rows="10" cols="50"></textarea><br>
		<input type="submit" value="Trimite">
		</form>	
</div>