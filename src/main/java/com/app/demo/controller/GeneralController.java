package com.app.demo.controller;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.demo.model.User;
import com.app.demo.services.BookingServices;
import com.app.demo.services.CateringServices;
import com.app.demo.services.EventServices;
import com.app.demo.services.HotelServices;
import com.app.demo.services.UserServices;


@Controller
public class GeneralController {

	@Autowired
	private UserServices userservice;

	@Autowired
	private HotelServices hotelservice;

	@Autowired
	private EventServices eventservice;

	@Autowired
	private CateringServices caterservice;

	@Autowired
	private BookingServices bookingservice;

	@RequestMapping(value="/",method= RequestMethod.GET)
	public String home() {
		return "index";
	}

	@RequestMapping(value="/signin",method= RequestMethod.GET)
	public String login() {
		return "Login";
	}

	@RequestMapping(value="/signup",method= RequestMethod.GET)
	public String register() {
		return "UserRegisteration";
	}


	@RequestMapping(value="/contactus",method= RequestMethod.GET)
	public String contactus() {
		return "ContactUs";
	}

	@RequestMapping(value="/aboutus",method= RequestMethod.GET)
	public String aboutus() {
		return "Aboutus";
	}

	@RequestMapping(value="/userhome",method=RequestMethod.GET)
	public String userhome(ModelMap model,HttpSession session) {
		if(session.getAttribute("User_id")==null) {
			return "redirect:/signin";
		}else {
			int id=(int) session.getAttribute("User_id");
//		User user=userservice.findById(id);

			long Hotelcount=hotelservice.hotelCount();
			model.addAttribute("user_hotel_count",Hotelcount);

			long Eventcount=eventservice.eventCount();
			model.addAttribute("user_event_count",Eventcount);

			long Cateringcount=caterservice.cateringcount();
			model.addAttribute("user_catering_count",Cateringcount);

			long Bookingcount=bookingservice.bookingcountById(id);
			model.addAttribute("user_booking_count",Bookingcount);

			long BookingcountPaid=bookingservice.bookingcountPaidById(id);
			model.addAttribute("user_bookingpaid_count",BookingcountPaid);

			long BookingcountunPaid=bookingservice.bookingcountunPaidById(id);
			model.addAttribute("user_bookingunpaid_count",BookingcountunPaid);

			long BookingcanceledbyAdmin=bookingservice.bookingcountcancelByAdminById(id);
			model.addAttribute("user_bookingcancelbyadmin_count",BookingcanceledbyAdmin);

			long BookingcanceledbyUser=bookingservice.bookingcountcancelByUserById(id);
			model.addAttribute("user_bookingcancelbyuser_count",BookingcanceledbyUser);

			long BookingPendingByUser=bookingservice.bookingPendingcountById(id);
			model.addAttribute("user_bookingpending_count",BookingPendingByUser);



			return "Userhome";
		}
	}

	@RequestMapping(value="/adminhome",method=RequestMethod.GET)
	public String adminhome(ModelMap model) {

		long Usercount=userservice.userCount();
		model.addAttribute("admin_user_count",Usercount);

		long Hotelcount=hotelservice.hotelCount();
		model.addAttribute("admin_hotel_count",Hotelcount);

		long Eventcount=eventservice.eventCount();
		model.addAttribute("admin_event_count",Eventcount);

		long Cateringcount=caterservice.cateringcount();
		model.addAttribute("admin_catering_count",Cateringcount);

		long Bookingcount=bookingservice.bookingcount();
		model.addAttribute("admin_booking_count",Bookingcount);

		long BookingcountPaid=bookingservice.bookingcountPaid();
		model.addAttribute("admin_bookingpaid_count",BookingcountPaid);

		long BookingcountunPaid=bookingservice.bookingcountunPaid();
		model.addAttribute("admin_bookingunpaid_count",BookingcountunPaid);

		long BookingcanceledbyAdmin=bookingservice.bookingcountcancelByAdmin();
		model.addAttribute("admin_bookingcancelbyadmin_count",BookingcanceledbyAdmin);

		long BookingcanceledbyUser=bookingservice.bookingcountcancelByUser();
		model.addAttribute("admin_bookingcancelbyuser_count",BookingcanceledbyUser);

		long Bookingpending=bookingservice.bookingpendingcount();
		model.addAttribute("admin_bookingpending_count",Bookingpending);

		return "AdminHome";
	}



	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/signin";
	}

	@RequestMapping(value="/loginfailed",method=RequestMethod.GET)
	public String loginfailed() {
		return "LoginFailed";
	}
}
