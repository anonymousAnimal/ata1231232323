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
import com.ata.bean.DriverBean;
import com.ata.bean.VehicleBean;
import com.ata.dao.DriverDaoImpl;
import com.ata.service.Administrator;
import com.ata.util.AuthImpl;

@Controller
@Transactional
@RequestMapping("/Admin")
public class AdminDriverController {
	
	@Autowired
	Administrator administratorServiceImpl;
	@Autowired
	AuthImpl authImpl;
	
	
	@RequestMapping("/addDriver")
	public String addDriver(Model m) 
	{
		m.addAttribute("driverBean",new DriverBean());
		return "AddDriver";
	}
	
	@PostMapping("/addDriver1")
	public String addDriver1(DriverBean driverBean,Model m,HttpSession ses) 
	{
	CredentialsBean cb=(CredentialsBean)ses.getAttribute("credentialsBean");
		//authenticate user
		
			try {
				if(authImpl.authorize(cb.getUserID()).equals("A"))
				{
					administratorServiceImpl.addDriver(driverBean);
					m.addAttribute("status", true);
					m.addAttribute("msg","Driver Added");
				}
			}catch(Exception e) {
				System.out.println("Exception occurs : "+e.getMessage());
				m.addAttribute("status",false);
				m.addAttribute("msg","Invalid details of driver [may be duplicate license number]");
			}
		
			
		return goToEditDelete(m);
		//return "AdminDashboard";
	}
	
	@RequestMapping("/modifyDriver/{id}")
	public String modifyVehicle(@PathVariable("id")String driverID,Model m) 
	{
		
		DriverBean db=administratorServiceImpl.findByID(driverID);
		
		m.addAttribute("driverBean",db);
		return "ModifyDriver";
	}
	
	
	@RequestMapping("/modifyDriver1")
	public @ResponseBody String modifyVehicle1(DriverBean driverBean,Model m) 
	{
		System.out.println(driverBean);
		String msg="";
		boolean res=administratorServiceImpl.modifyDriver(driverBean);
		if(res)
			//m.addAttribute("msg","Driver modified");
			msg="driver modified!";
		else
			//m.addAttribute("msg","some error occured");
			msg="some error occured";
		
		return msg;

	}
	
	
	
	@RequestMapping("/dodelDriver/{id}")
	public @ResponseBody String delDriver1( @PathVariable("id")String id, Model m) 
	{
		//CredentialsBean cb=(CredentialsBean)ses.getAttribute("credentialsBean");
		//authenticate user
		String msg ="";
		try{
		ArrayList<String>ar=new ArrayList<String>();
		ar.add(id);
		int rows=administratorServiceImpl.deleteDriver(ar);
		if(rows > 0)
			//m.addAttribute("msg","Driver deleted with id : "+id);
			msg = "success";
		else
			//m.addAttribute("msg","cannot delete driver with id: "+id);
			msg = "cannot delete driver with id: "+id;

		}
		catch(Exception e) {
			msg = "cannot delete driver with id: "+id+" as it may be assigned to a user ";
			//m.addAttribute("msg","cannot delete driver with id: "+id+" as it may be assigned to a user ");

		}
		return msg;
	

	}
	
	@RequestMapping("/driverEditDelete")
	public String goToEditDelete(Model m){
		
		ArrayList<DriverBean> list= administratorServiceImpl.findAllDriver();
		m.addAttribute("list", list);
		return "AdminDriverView";
	}
	

	

}
