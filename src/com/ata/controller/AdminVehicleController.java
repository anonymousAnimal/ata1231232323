
package com.ata.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.CredentialsBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;
import com.ata.dao.VehicleDaoImpl;
import com.ata.service.Administrator;
import com.ata.util.AuthImpl;

@Controller
@Transactional
@RequestMapping("/Admin")
public class AdminVehicleController {
	@Autowired
	Administrator administratorServiceImpl;
	@Autowired
	AuthImpl authImpl;
	
	@RequestMapping("/addVehicle")
	public String addVehicle(Model m) 
	{
		m.addAttribute("vehicleBean",new VehicleBean());
		return "AddVehicle";
	}
	
	@PostMapping("/addVehicle1")
	public String addVehicle1(VehicleBean vehicleBean,Model m,HttpSession ses) 
	{
	CredentialsBean cb=(CredentialsBean)ses.getAttribute("credentialsBean");
		//authorize user
		if(authImpl.authorize(cb.getUserID()).equals("A")){
		administratorServiceImpl.addVehicle(vehicleBean);
		m.addAttribute("status", true);
		m.addAttribute("msg","Vehicle Added Successfully");
		}
		else
		{
			m.addAttribute("status", false);
			m.addAttribute("msg","Some error occured !!Cannot add Vehicle!!!");
		}
		//return "AdminDashboard";
		return goToEditDelete(m);
	}
	
	/*@RequestMapping("/modifyVehicle/{id}")
	public String modifyVehicle(@PathVariable("id")String vehicleID,Model m) 
	{
		VehicleBean vb=administratorServiceImpl.viewVehicle(vehicleID);
		m.addAttribute("vehicleBean",vb);
		return "ModifyVehicle";
	}*/
	
	@RequestMapping("/modifyVehicle1")
	public @ResponseBody String modifyVehicle1(VehicleBean vehicleBean,Model m) 
	{
		String msg ="";
		boolean res=administratorServiceImpl.modifyVehicle(vehicleBean);
		if(res){
			/*
			 * m.addAttribute("status", true); m.addAttribute("msg","Vehicle modified");
			 */
			msg="success";
		}
		else
		{
			/*
			 * m.addAttribute("status", false);
			 * m.addAttribute("msg","Some error occured !!Cannot modify Vehicle!!!");
			 */
			msg="Some error occured !!Cannot modify Vehicle!!!";
		}
		return msg;
		
	}
	
	@RequestMapping("/dodelVehicle/{id}")
	public @ResponseBody String delRoute1( @PathVariable("id")String id,VehicleBean vehicleBean,Model m) 
	{
		String msg="";
		try {
		ArrayList<String>ar=new ArrayList<String>();
		ar.add(id);
		int rows=administratorServiceImpl.deleteVehicle(ar);
		if(rows > 0)
			msg="success";
			/*
			 * m.addAttribute("status", true);
			 * m.addAttribute("msg","Vehicle deleted with id : "+id);
			 */
		}
		catch(Exception e) {
			msg= "Cannot Delete Vehicle id = "+id+" because it may already be assigned to a Customer ";
			/*
			 * m.addAttribute("status", false);
			 * m.addAttribute("msg","Cannot Delete Vehicle id = "
			 * +id+" because it may already be assigned to a Customer ");
			 */
		}
		/*
		 * ArrayList<VehicleBean> list= administratorServiceImpl.findAllVehicle();
		 * m.addAttribute("list", list); return "AdminVehicleView";
		 */
		return msg;
	}
	
	@RequestMapping("/vehicleEditDelete")
	public String goToEditDelete(Model m){
		
		ArrayList<VehicleBean> list= administratorServiceImpl.findAllVehicle();
		m.addAttribute("list", list);
		return "AdminVehicleView";
	}
	

}
