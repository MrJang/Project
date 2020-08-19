package yjc.wdb.safe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
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
public class FemaleController {
	
	@Autowired private FemaleDao dao; 
	@Autowired private memberDao m_dao;
	@Autowired private MessageDao m_de;
	@Autowired private PoliceDao p_dao;
	
	//ÀÚ±âÀ§Ä¡ º¸±â
	@RequestMapping(value="/female_gps", method=RequestMethod.GET)
	public String fssGps(Model model) {
	
		return "f_female_gps";
	}
	@RequestMapping(value="/hometest")
	@ResponseBody
	public String hometest(Model model,HttpServletRequest request) {
		System.out.println("dd");
		String up = request.getParameter("home");
		System.out.println(up+"22");
		return "/WEB-INF/female/test.jsp";
	}
	
	@RequestMapping(value="/policeSelect", method=RequestMethod.GET)
	   public String policeSelect(HttpSession session,Model model) {
	      memberBean s = (memberBean) session.getAttribute("s");
	      
	      FemaleBean female = new FemaleBean();
	      female = dao.getPolice(s.getName());
	      policeBean police = new policeBean();
	      police = p_dao.policeSel(s.getName());
	      
	      
	      
	      
	      if(female == null) {
	         return "/WEB-INF/female/policeNot.jsp";
	      }else{
	      memberBean member = new memberBean();
	      member = m_dao.loginMember(female.getId());
	      
	      female.setName(member.getName());
	      female.setM_success(police.getM_success());
	      model.addAttribute("female",female);
	      
	      
	      return "/WEB-INF/female/policeSelect.jsp";
	      }
	   }
	   @RequestMapping(value="/policeSelect", method=RequestMethod.POST)
	   public String policeSelectSuccess(HttpSession session,Model model,@ModelAttribute("female") FemaleBean female) {
	      memberBean s = (memberBean) session.getAttribute("s");
	      policeBean police = new policeBean();
	      p_dao.MemberUpdatego(s.getName());
	      police = p_dao.policeSel(s.getName());
	      
	      female.setM_success("3");
	      model.addAttribute("female",female);
	      model.addAttribute("police",police);
	      return "redirect:/safe/safe_Main";
	   }
	      @RequestMapping(value="/crearPolice", method=RequestMethod.GET)
	         public String crearPolice(Model model,HttpSession session) {
	            memberBean s = (memberBean) session.getAttribute("s");
	            FemaleBean female = new FemaleBean();
	            female = dao.getPolice(s.getName());
	             p_dao.deletepolice(s.getName());
	            
	            
	               dao.deleteFemale(female.getId());

	            
	               return "/WEB-INF/female/policeReturn.jsp";
	               
	         }
	
	   @RequestMapping(value="/female_addWrite", method=RequestMethod.GET)
	   public String femaleAddBoard(Model model,HttpSession session) {
	      memberBean member = (memberBean) session.getAttribute("s");
	      
			if(member == null){
			member = new memberBean();
			model.addAttribute("s",member);
			
			}
			else{
			model.addAttribute("s",member);
				
			}
			
	         return "f_femaleIntroduce";
	         
	   }
		@RequestMapping(value="/policelist", method=RequestMethod.GET)
		public String police_list(Model model,@RequestParam String name) {
			policeBean p = new policeBean();
			policeBean list = p_dao.policeL(name);
			p.setP_name(name);
			
			List<policeBean> police = p_dao.police_mpolice(list.getP_num());
			
			
			model.addAttribute("list",police); 
			model.addAttribute("police", p);
			 List lista = time();
				
				model.addAttribute("t_list", lista);
				model.addAttribute("female",police);
				
				
			return "/WEB-INF/female/policelist.jsp";
		}
		
		@RequestMapping(value="/policelist", method=RequestMethod.POST)
		public String police_listSuccess(@RequestParam("police") String police,Model model,HttpSession session,@ModelAttribute("police") policeBean p) {
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
			
			return "/WEB-INF/female/police_list.jsp";
		}
		@RequestMapping(value="/selectPolice/{id}", method=RequestMethod.GET)
		@ResponseBody
		public Boolean selectPolice(@PathVariable String id,@ModelAttribute("female") FemaleBean female,Model model){
			
			
			Boolean check = true;
			model.addAttribute("female",female);
			if(dao.getPolice(id)== null) {
				check =false;
			}

			
			return check;
		}

		@RequestMapping(value="/policelike", method=RequestMethod.GET)
		public String police_LSuccess(@RequestParam String name, @RequestParam int success, @RequestParam String phone,
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
			
			return "/WEB-INF/female/police_list.jsp";
		}
		
		
	      
	   @RequestMapping(value="/female_exist", method=RequestMethod.GET)
	   public String femaleUpdate(Model model,HttpSession session) {
	      memberBean s = (memberBean) session.getAttribute("s");
	      FemaleBean m = dao.t_selectById(s.getId());
	      model.addAttribute("m",m);
	      return "f_female_exist";
	      
	      
	   }
	   @RequestMapping(value="/female_exist", method=RequestMethod.POST)
	   public String femaleUpdateSucess(Model model,@ModelAttribute("m") FemaleBean female) {
	      dao.updateFemale(female);
	      return "f_female_Updatesuccess";
	      
	      
	   }
	
	

	
	@RequestMapping(value="/t_findTaxi", method=RequestMethod.GET)
	public String findaccessList(Model model){
		List<FemaleBean> list = dao.t_selectAll();
		
		model.addAttribute("list",list);
		
		return"f_taxi_list";
	}
	
	@RequestMapping(value="/t_oneweek", method=RequestMethod.GET)
	public String oneweekList(Model model){
		List<FemaleBean> list = dao.t_selectOneWeek();
		
		model.addAttribute("list",list);
		return"f_taxi_list";
	}
	
	
	@RequestMapping(value="/t_onemonth", method=RequestMethod.GET)
	public String onemonthList(Model model){
		List<FemaleBean> list = dao.t_selectOneMonth();
		
		model.addAttribute("list",list);
		return"f_taxi_list";
	}
	
	
	@RequestMapping(value="/t_threemonth", method=RequestMethod.GET)
	public String threemonthList(Model model){
		List<FemaleBean> list = dao.t_selectThreeMonth();
		
		model.addAttribute("list",list);
		return"f_taxi_list";
	}
	
	
	
	
	
	// °æÂû ¸ÅÄª ----------------
	
	@RequestMapping(value="/police", method=RequestMethod.GET)
	public String police(Model model){
		return"p_police";
	}
	
	
	@RequestMapping(value="/p_server", method=RequestMethod.GET)
	public String server(Model model){
	
	
		return"f_policeStart";
	}
	
	
	@RequestMapping(value="/police_write", method=RequestMethod.GET)
	public String mFemaleWrtie(Model model, @RequestParam String content,HttpSession session){
		memberBean s = (memberBean) session.getAttribute("s");
		FemaleBean female = new FemaleBean();
		female.setContent(content);
	
		female.setCategory(20);
		female.setId(s.getId());
		 model.addAttribute("female",female);
		 List lista = time();
			
		model.addAttribute("t_list", lista);
	
		return"f_police_write";
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
	
	@RequestMapping(value="/crearFemale", method=RequestMethod.GET)
	   public String crearFemale(Model model,HttpSession session){
	      memberBean s = (memberBean) session.getAttribute("s");
	      FemaleBean m = new FemaleBean();
	     
	      List<FemaleBean> female = dao.getPolice2(s.getId());
	      
	      p_dao.deletepolice(female.get(0).getE_id());
	      dao.deleteFemale(s.getId());
	      
	      return "f_police_crear";
	   }
	
	
	
	@RequestMapping(value="/police_write", method=RequestMethod.POST)
	public String mFemailWrtie(@ModelAttribute("female") FemaleBean female, Model model,HttpSession session){
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
		return "f_police_list";
	}

	@RequestMapping(value="/female_police_list", method=RequestMethod.GET)
	public String mFemailWrtie(Model model,HttpSession session){
		memberBean s = (memberBean) session.getAttribute("s");
		FemaleBean list = dao.policeList(s.getId());
		if(list == null) {
			return "f_police_return"; 
			
		}else {
		model.addAttribute("female",list);
		return "f_police_list";
		}
	}
	@RequestMapping(value="/female_sysList", method=RequestMethod.GET)
	public String female_sysList(Model model,HttpSession session){
		memberBean s = (memberBean) session.getAttribute("s");
		FemaleBean female = new FemaleBean();
		List<FemaleBean> list = dao.sysList(s.getId());
		model.addAttribute("list",list);
		
		return "f_police_sysList";
		}
	@RequestMapping(value="/female_sysListSuccess", method=RequestMethod.GET)
	public String female_sysListSuccess(Model model,HttpSession session,@RequestParam String name){
		memberBean s = (memberBean) session.getAttribute("s");
		
		FemaleBean female = new FemaleBean();
		female.setId(s.getName());
		female.setE_id(name);
		policeBean police = p_dao.policeSel(name);
		List<policeBean> police2 = p_dao.Syslist(police.getM_police());
		
		female.setRequest(police2.get(0).getP_name());
		female.setCategory(22);
		model.addAttribute("female",female);
		
		return "f_female_review";
		}
	@RequestMapping(value="/female_sysListSuccess", method=RequestMethod.POST)
	public String female_sysListSuccessOk(Model model,HttpSession session,@ModelAttribute("female") FemaleBean female){
		memberBean s = (memberBean) session.getAttribute("s");
		female.setId(s.getId());
		dao.policeReview(female);
		
		return "f_reviewList";
		}
	
	
	@RequestMapping(value="/selectFemale/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Boolean selectFemale(@PathVariable String id,@ModelAttribute("female") FemaleBean female,Model model){
	
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
	@RequestMapping(value="/detalipolice", method=RequestMethod.GET)
	public String detalipolice(Model model,@RequestParam String name){
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
		return "/WEB-INF/female/detalipolice.jsp";
	}
	@RequestMapping(value="/detalireview", method=RequestMethod.GET)
	public String detalireview(Model model,@RequestParam int num){
		FemaleBean female = new FemaleBean();
		female = dao.detalire(num);
		dao.detalireupdate(num);
		model.addAttribute("female",female);
		
		return "/WEB-INF/female/detalireview.jsp";
	}

	 @RequestMapping(value="/female_listAll", method=RequestMethod.GET)
	   public String listAll2(Model model,HttpSession session) {
	      
	      memberBean s = (memberBean) session.getAttribute("s");
	      FemaleBean female = new FemaleBean();
	      List<FemaleBean> list = dao.sysList(s.getId());
	      model.addAttribute("list",list);
	      
	      return "/WEB-INF/female/female_listAll.jsp";
	   }
	
	
	
	
}
