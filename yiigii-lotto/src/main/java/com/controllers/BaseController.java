package com.controllers;

import com.utilities.Authorization;

public class BaseController {

	// check login.
	public static Authorization auth = new Authorization();

	// static variable.
	public static String current_action = "";
	public static String current_title = "";
	public static String return_view = "redirect:home";
	public static String menu_toggle = "nav-md";
	public static String current_user = "";
	public static String root_action = "";

}
