package com.ata.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.ProfileBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;
import com.ata.service.CustomerServiceImpl;
import com.ata.util.UserImpl;

@Controller
@RequestMapping("/User")
@Transactional
public class UserController {
	
	@Autowired
	InitController initController;
	@Autowired
	CustomerServiceImpl cservice;
	
	@Autowired
	UserImpl userImpl;
	
	@RequestMapping("/Dashboard")
	public String goToDashboard(HttpSession session)
	{
		return "UserDashboard";
	}
	
	@RequestMapping("/Profile")
	public String goToProfile() {
		
		return "Profile";
	}
	
	@RequestMapping("/ViewVehiclesAndRoutes")
	public String goToViewVehiclesAndRoutes(Model m) 
	{
		ArrayList<VehicleBean> vehicleList = cservice.viewAllVehicles();
		
		ArrayList<RouteBean> routeList = cservice.viewAllRoutes();
		m.addAttribute("vehicleList",vehicleList);
		m.addAttribute("routeList",routeList);
		
		return "ViewVR";
	}
	
	@RequestMapping("/editProfile")
	public String editProfile(ProfileBean profileBean, HttpSession session)
	{
		//converting date in 'yyyy'-'mm'-'dd' so that it can be shown in html date input type correctly
		Date date = profileBean.getDateOfBirth();
		int yyyy = date.getYear();
		int mm= date.getMonth();
		int dd = date.getDate();
		Date date1 = ((ProfileBean)session.getAttribute("profileBean")).getDateOfBirth();
		date1.setYear(yyyy);
		date1.setMonth(mm);
		date1.setDate(dd);
		System.out.println("res : "+date1);
		profileBean.setDateOfBirth(date1);
		
		//updating the profileBean in db
		saveEditedProfile(profileBean);

		System.out.println("profileBean is "+profileBean);
	
		return "Profile";
	}
	
	private void saveEditedProfile(ProfileBean profileBean) {
		userImpl.editProfile(profileBean);
	}
	
}
