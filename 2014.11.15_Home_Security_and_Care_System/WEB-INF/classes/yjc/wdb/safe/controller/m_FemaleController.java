package yjc.wdb.safe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import yjc.wdb.safe.bean.FemaleBean;
import yjc.wdb.safe.bean.MessageBean;
import yjc.wdb.safe.bean.Result;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.bean.policeBean;
import yjc.wdb.safe.dao.FemaleDao;
import yjc.wdb.safe.dao.MessageDao;
import yjc.wdb.safe.dao.PoliceDao;
import yjc.wdb.safe.dao.memberDao;

@Controller
@SessionAttributes("female")
public class m_FemaleController {
	@Autowired private FemaleDao dao; 
	@Autowired private memberDao m_dao;
	@Autowired private MessageDao m_de;
	@Autowired private PoliceDao p_dao;
	
	
	@RequestMapping(value="/m_female_gps", method=RequestMethod.GET)
	public String fssGps(Model model) {
	
		return "m_female_gps.female";
	}
	
	@RequestMapping(value="/m_female_addWrite", method=RequestMethod.GET)
	public String femaleAddBoard(Model model) {
		FemaleBean female = new FemaleBean();
		model.addAttribute("female",female);
		
		return "m_female_write.female";
	}
	
	@RequestMapping(value="/m_female_addWrite", method=RequestMethod.POST)
	public String femaleAddBoard(@ModelAttribute("female") FemaleBean female, Model model) {
		
		
		dao.f_insert(female);
	
		return "m_female_success.female";
	}
	
	
	
	@RequestMapping(value="/m_female_addTaxi", method=RequestMethod.GET)
	//http://localhost:8080/SafeLiving/spring/addAccess
	public String femaleaddTaxi(Model model){
		FemaleBean female = new FemaleBean();
		female.setCategory(4);
		model.addAttribute("female",female);
		return "m_taxt_form.female";
	 }
	
	@RequestMapping(value="/m_female_addTaxi",method=RequestMethod.POST)
	public String t_1addAccess(@ModelAttribute("female") FemaleBean female, Model model){
		dao.t_insert(female);
		return "redirect:/safe/m_t_findTaxi";
	}
	
	@RequestMapping(value="/m_t_findTaxi", method=RequestMethod.GET)
	public String findaccessList(Model model){
		List<FemaleBean> list = dao.t_selectAll();
		
		model.addAttribute("list",list);
		
		return"m_taxi_list.female";
	}
	
	@RequestMapping(value="/m_t_oneweek", method=RequestMethod.GET)
	public String oneweekList(Model model){
		List<FemaleBean> list = dao.t_selectOneWeek();
		
		model.addAttribute("list",list);
		return"m_taxi_list.female";
	}
	
	
	@RequestMapping(value="/m_t_onemonth", method=RequestMethod.GET)
	public String onemonthList(Model model){
		List<FemaleBean> list = dao.t_selectOneMonth();
		
		model.addAttribute("list",list);
		return"m_taxi_list.female";
	}
	
	
	@RequestMapping(value="/m_t_threemonth", method=RequestMethod.GET)
	public String threemonthList(Model model){
		List<FemaleBean> list = dao.t_selectThreeMonth();
		
		model.addAttribute("list",list);
		return"m_taxi_list.female";
	}
	
	
	
	
	//경찰 매칭-----------------------------------------------------------
	
	@RequestMapping(value="/m_police", method=RequestMethod.GET)
	public String police(Model model){
		return"m_police.mobile";
	}
	
	@RequestMapping(value="/m_policeStart")
	public String server(Model model){
	
		
		return "/WEB-INF/mobile/m_policeStart.jsp";
	}
	
	@RequestMapping(value="/m_police_write", method=RequestMethod.GET)
	public String m_mFemaleWrtie(Model model, @RequestParam String content,HttpSession session){
		memberBean s = (memberBean) session.getAttribute("s");
		FemaleBean female = new FemaleBean();
		female.setContent(content);
	
		female.setCategory(15);
		female.setId(s.getId());
		 model.addAttribute("female",female);
		 List lista = time();
			
		model.addAttribute("t_list", lista);
	
		return"m_police_write.mobile";
	}
	
	public List time() {
	 
		ArrayList<Object> list = new ArrayList<Object>();
		
		for(int i=0; i<24; i++){
			if(i<10)
			 list.add("0"+i+":00");
			else
			 list.add(i+":00");
		}	
		
		return list;
		
	}
	
	
	
	
	
	@RequestMapping(value="/m_police_write", method=RequestMethod.POST)
	public String m_mFemailWrtie(@ModelAttribute("female") FemaleBean female, Model model,HttpSession session){
		dao.m_policeAdd(female);
		memberBean s = (memberBean) session.getAttribute("s");
		MessageBean Me = new MessageBean();
		Me.setWrite_id(s.getId());
		Me.setSend_id("admin");
		Me.setCategory(2);
		
		String ab = female.getContent();
		String ac = female.getCrime_time();
		Me.setM_content(ab+"/"+ac);
		model.addAttribute("Me",Me);
		
		model.addAttribute("female",female);
		
		m_de.m_messageInsert(Me);
		return "police_list.mobile";
	}

	@RequestMapping(value="/m_female_police_list", method=RequestMethod.GET)
	public String mFemailWrtie(Model model,HttpSession session){
		memberBean s = (memberBean) session.getAttribute("s");
		FemaleBean list = dao.policeList(s.getId());
		if(list == null) {
			return "police_return.mobile"; 
			
		}else {
			
		model.addAttribute("female",list);
		return "m_police_list.mobile";
		}
	}
	@RequestMapping(value="/m_policelist", method=RequestMethod.GET)
	public String m_police_list(Model model,@RequestParam String name) {
		policeBean p = new policeBean();
		policeBean list = p_dao.policeL(name);
		p.setP_name(name);
		
		List<policeBean> police = p_dao.police_mpolice(list.getP_num());
		
		
		model.addAttribute("list",police); 
		model.addAttribute("police", p);
		 List lista = time();
			
			model.addAttribute("t_list", lista);
			model.addAttribute("female",police);
			
			
		return "m_policeList.mobile";
	}
	
	@RequestMapping(value="/m_detalireview", method=RequestMethod.GET)
	public String m_detalireview(Model model,@RequestParam int num){
		FemaleBean female = new FemaleBean();
		female = dao.detalire(num);
		dao.detalireupdate(num);
		model.addAttribute("female",female);
		
		return "/WEB-INF/mobile/m_detalireview.jsp";
	}
	
	@RequestMapping(value="/m_policelist", method=RequestMethod.POST)
	public String m_police_listSuccess(@RequestParam("police") String police,Model model,HttpSession session,@ModelAttribute("police") policeBean p) {
		memberBean s = (memberBean) session.getAttribute("s");
		
		String name = police.split("/")[0];
		String phone = police.split("/")[1];
		String crime_time = p.getCrime_time().split(",")[0];
		
		FemaleBean female = new FemaleBean();
		female.setCrime_time(crime_time);
		female.setId(s.getId());
		
		female.setContent(p.getP_name());
		female.setE_id(name);
		
		female.setPhone(s.getPhone());
		female.setCategory(20);

		
		dao.m_policeAdd(female);
		model.addAttribute("female",female);


		
		p_dao.PoMemberUpdate(name);
		
		return "m_police_list.mobile";
	}
	@RequestMapping(value="/m_selectFemale/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Boolean m_selectFemale(@PathVariable String id,@ModelAttribute("female") FemaleBean female,Model model){
	
		Result result = new Result();
		Boolean check = true;
		model.addAttribute("female",female);
		List<FemaleBean> f = dao.getPolice2(id);
		if(f.size()==0) {
			return false;
		}
		
		
		policeBean police = new policeBean();
		police = p_dao.policeSel(f.get(0).getE_id());
				
		
		if(police.getM_success().equals("2")) {
			check = false;
		}else {
			check = true;
		}
	
		return check;
	}
	@RequestMapping(value="/m_crearFemale", method=RequestMethod.GET)
	   public String m_crearFemale(Model model,HttpSession session){
	      memberBean s = (memberBean) session.getAttribute("s");
	      FemaleBean m = new FemaleBean();
	     
	      List<FemaleBean> female = dao.getPolice2(s.getId());
	      
	      p_dao.deletepolice(female.get(0).getE_id());
	      dao.deleteFemale(s.getId());
	      
	      return "m_police_crear.mobile";
	   }
	@RequestMapping(value="/m_detalipolice", method=RequestMethod.GET)
	public String m_detalipolice(Model model,@RequestParam String name){
		FemaleBean female = new FemaleBean(); 
		int numInt = 0;
		int numInt1 = 0;
		List<FemaleBean> list = dao.sysListOk(name);
		
		for(int i=0; i<list.size(); i++) {
			numInt += Integer.parseInt(list.get(i).getS_star());
		}
		if(list.size() != 0){
			numInt1 = numInt/list.size();
		}
		female.setS_star(String.valueOf(numInt1));
		female.setE_id(name);
		model.addAttribute("list",list);
		model.addAttribute("female",female);
		return "/WEB-INF/mobile/m_detalipolice.jsp";
	}
	@RequestMapping(value="/m_policelike", method=RequestMethod.GET)
	public String m_police_LSuccess(@RequestParam String name, @RequestParam int success, @RequestParam String phone,
			@RequestParam String arg,HttpSession session,@RequestParam String p_name,Model model) {
		memberBean s = (memberBean) session.getAttribute("s");
		FemaleBean female = new FemaleBean();
		female.setCrime_time(arg);
		female.setId(s.getId());
		female.setContent(p_name);
		female.setE_id(name);
		
		female.setPhone(s.getPhone());
		female.setCategory(20);
		dao.m_policeAdd(female);
		model.addAttribute("female",female);
		p_dao.PoMemberUpdate(name);
		
		return "m_police_list.mobile";
	}
	@RequestMapping(value="/m_policeSelect", method=RequestMethod.GET)
	public String m_policeSelect(HttpSession session,Model model) {
		memberBean s = (memberBean) session.getAttribute("s");
		
		FemaleBean female = new FemaleBean();
		female = dao.getPolice(s.getName());
		policeBean police = new policeBean();
		police = p_dao.policeSel(s.getName());
		
		
		
		
		if(female == null) {
			return "m_policeNot.mobile";
		}else{
		memberBean member = new memberBean();
		member = m_dao.loginMember(female.getId());
		
		female.setName(member.getName());
		female.setM_success(police.getM_success());
		model.addAttribute("female",female);
		
		
		return "m_policeSelect.mobile";
		}
	}
	@RequestMapping(value="/m_policeSelect", method=RequestMethod.POST)
	public String m_policeSelectSuccess(HttpSession session,Model model,@ModelAttribute("female") FemaleBean female) {
		
		memberBean s = (memberBean) session.getAttribute("s");
		policeBean police = new policeBean();
		p_dao.MemberUpdatego(s.getName());
		police = p_dao.policeSel(s.getName());
		
		female.setM_success("3");
		model.addAttribute("female",female);
		model.addAttribute("police",police);
		return "m_policeSelect.mobile";
	}
	@RequestMapping(value="/m_crearPolice", method=RequestMethod.GET)
	   public String crearPolice(Model model,HttpSession session) {
		System.out.println("22");
		memberBean s = (memberBean) session.getAttribute("s");
	      FemaleBean female = new FemaleBean();
			female = dao.getPolice(s.getName());
			 p_dao.deletepolice(s.getName());
			
			
		      dao.deleteFemale(female.getId());

			
	         return "redirect:/safe/m_policeSelect";
	         
	   }
	@RequestMapping(value="/m_female_sysList", method=RequestMethod.GET)
	public String female_sysList(Model model,HttpSession session){
		memberBean s = (memberBean) session.getAttribute("s");
		FemaleBean female = new FemaleBean();
		List<FemaleBean> list = dao.sysList(s.getId());
		model.addAttribute("list",list);
		
		return "m_police_sysList.mobile";
		}
	@RequestMapping(value="/m_female_sysListSuccess", method=RequestMethod.GET)
	public String m_female_sysListSuccess(Model model,HttpSession session,@RequestParam String name){
		memberBean s = (memberBean) session.getAttribute("s");
		
		FemaleBean female = new FemaleBean();
		female.setId(s.getName());
		female.setE_id(name);
		policeBean police = p_dao.policeSel(name);
		List<policeBean> police2 = p_dao.Syslist(police.getM_police());
		
		female.setRequest(police2.get(0).getP_name());
		female.setCategory(22);
		model.addAttribute("female",female);
		
		return "m_police_review.mobile";
		}
	@RequestMapping(value="/m_female_sysListSuccess", method=RequestMethod.POST)
	public String m_female_sysListSuccessOk(Model model,HttpSession session,@ModelAttribute("female") FemaleBean female){
		memberBean s = (memberBean) session.getAttribute("s");
		female.setId(s.getId());
		dao.policeReview(female);
		
		return "m_reviewList.mobile";
		}
	

	
}