package com.ata.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.CredentialsBean;
import com.ata.bean.RouteBean;
import com.ata.dao.RouteDaoImpl;
import com.ata.service.Administrator;
import com.ata.util.AuthImpl;


@Controller
@Transactional
@RequestMapping("/Admin")
public class AdminRouteController {

	@Autowired
	Administrator administratorServiceImpl;
	@Autowired
	AuthImpl authImpl;
	
	/*@RequestMapping("/addroute")
	public String addRoute(Model m) 
	{
		m.addAttribute("routeBean",new RouteBean());
		return "CreateRoute";
	}*/
	
	@PostMapping("/doRoute")
	public String addRoute1(RouteBean routeBean,Model m,HttpSession ses) 
	{
	CredentialsBean cb=(CredentialsBean)ses.getAttribute("credentialsBean");
		//authenticate user
		if(authImpl.authorize(cb.getUserID()).equals("A")){
		administratorServiceImpl.addRoute(routeBean);
		m.addAttribute("status",true);
		m.addAttribute("msg","RouteAdded");
		}
		else
		{
			m.addAttribute("status",false);
			m.addAttribute("msg","route couldn't be added!!!");
		}
		
		return goToEditDelete(m);
	}
	
	
	@RequestMapping("/modifyRoute")
	public @ResponseBody String modifyRoute1(RouteBean routeBean,Model m) 
	{
		String msg = "";
		boolean res=administratorServiceImpl.modifyRoute(routeBean);
		if(res){
			msg="success";
		}
		else{
			
			msg="Route cannot be modified due to some error";
		}
		return msg;

	}
	
//	@RequestMapping("/delRoute")
//	public String delRoute(Model m) 
//	{
//		ArrayList<RouteBean>al=rdao.findAll();
//		m.addAttribute("routelist",al);
//		m.addAttribute("routeBean",new RouteBean());
//		return "DelRoute";
//	
	
	@RequestMapping("/dodelRoute")
	public @ResponseBody String delRoute1(String id,Model m) 
	{
		String msg= "";
		try {
		ArrayList<String>ar=new ArrayList<String>();
		ar.add(id);
		int rows=administratorServiceImpl.deleteRoute(ar);
		if(rows>0)
			msg = "success";
		else
			msg = "unable to delete route as it may be assigned to a user";
		}
		catch(Exception e) {
			m.addAttribute("status",false);
			m.addAttribute("msg","Cannot delete Route id="+id+": it may be booked by customer ["+e.getMessage()+"]");
			msg="Cannot delete Route id="+id+": it may be booked by customer ["+e.getMessage()+"]";
		}
		return msg;
		//return goToEditDelete(m);

	}
	
	@RequestMapping("/goToEditDelete")
	public String goToEditDelete(Model m){
		ArrayList<RouteBean> list= administratorServiceImpl.findAllRoute();
		m.addAttribute("list", list);
		return "AdminRouteView";
	}
}
