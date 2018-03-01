package com.controllers;
import java.util.List;

import com.entities.UserBranch;
import com.utilities.Authorization;

public class BaseController {

	// check login.
	public static Authorization auth = new Authorization();

	// static variable.
	public static String current_action = "";
	public static String current_title = "";
	public static String current_branch = "";
	public static List<UserBranch> allow_branch;
	public static String return_view = "redirect:home";
	public static String menu_toggle = "nav-sm";
	public static String current_user = "";
	public static String root_action = "";

}
