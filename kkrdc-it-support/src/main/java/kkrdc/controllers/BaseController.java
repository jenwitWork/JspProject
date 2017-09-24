package kkrdc.controllers;

import kkrdc.utilities.Authorization;
import kkrdc.utilities.FormatorDate;

public class BaseController {

	// check login.
	public static Authorization auth = new Authorization();

	// static variable.
	public static String current_url = "";
	public static String current_title = "";
	public static String return_view = "redirect:home";
	public static String menu_toggle = "nav-md";
	public static String gobal_dc_tag;
	public static FormatorDate formatDate = new FormatorDate();
	

}
