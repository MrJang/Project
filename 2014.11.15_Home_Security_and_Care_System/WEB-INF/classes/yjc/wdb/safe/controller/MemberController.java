package yjc.wdb.safe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.safe.bean.FemaleBean;
import yjc.wdb.safe.bean.HomSecurityBean;
import yjc.wdb.safe.bean.SchedulerBean;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.bean.zipcodeBean;
import yjc.wdb.safe.dao.FemaleDao;
import yjc.wdb.safe.dao.SchedulerDao;
import yjc.wdb.safe.dao.ajaxDao;
import yjc.wdb.safe.dao.memberDao;

@Controller
@SessionAttributes("s")

public class MemberController {

	
	@Autowired
	private memberDao dao;
	@Autowired
	private SchedulerDao sche_dao;
	@Autowired
	private FemaleDao f_dao;
	
	@Autowired private ajaxDao a_dao;

	@RequestMapping(value = "/safe_Main", method = RequestMethod.GET)
	public String safeMain(Model model, HttpSession session, String regId) {

		memberBean s = (memberBean) session.getAttribute("s");

		if (s == null) {
			s = new memberBean();
			model.addAttribute("s", s);
			return ".main_all";
		} else if (s.getId() != null) {
			System.out.println(regId);
			List<SchedulerBean> list = sche_dao.SchedulerList(s.getId());
			model.addAttribute("sche_list", list);

			return ".main_all";
		} else {
			return ".main_all";
		}

	}

	@RequestMapping(value = "/safe_Main", method = RequestMethod.POST)
	public String safeLogin(@RequestParam String id,
			@RequestParam String password, Model model, HttpSession session) {
		
		memberBean s = dao.loginMember(id);

		if (s != null) {

			if (s.getPassword().equals(password)) {

				List<SchedulerBean> list = sche_dao.SchedulerList(s.getId());
				model.addAttribute("sche_list", list);
				session.setAttribute("s", s);
				model.addAttribute("s", s);
				return ".main_all";
			}

		} else {
			s = new memberBean();
			model.addAttribute("s", s);
			return ".main_all";
		}

		return ".main_all";

	}

	@RequestMapping(value = "/addMember_a", method = RequestMethod.GET)
	public String addMemberForm(Model model) {

		memberBean s = new memberBean();
		s.setCategory(0);
		model.addAttribute("s", s);
		return "v_addMemberForm_a";

	}

	@RequestMapping(value = "/addMember_a", method = RequestMethod.POST)
	public String addMember(@ModelAttribute memberBean s) {

		dao.insertMember(s);

		return "redirect:/safe/addSuccess";
	}

	@RequestMapping("/addSuccess")
	public String addSuccess() {
		return "v_addSuccess";
	}

	// ������ ��

	@RequestMapping("/joinMemberSelect")
	public String joinselect() {
		return "v_joinMemberSelect";
	}
	
	
	@RequestMapping(value = "/addMember_u", method = RequestMethod.GET)
	public String addMemberForm_u(Model model, @RequestParam int category) {
		System.out.println(category);
		memberBean s = new memberBean();
		s.setCategory(category);
		model.addAttribute("s", s);
		return "v_addMemberForm_u";

	}

	@RequestMapping(value = "/checkjoinid/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ajaxDao checklogin(@PathVariable String id) {
		System.out.println(id);

		if (dao.loginMember(id) != null) {
			a_dao.setDuplicated(true);
		} else {
			a_dao.setDuplicated(false);
		}

		return a_dao;
	}
	

	@RequestMapping(value = "/addMember_u", method = RequestMethod.POST)
	public String addMember_u(@ModelAttribute("s") memberBean s,
			@RequestParam("file") MultipartFile file, HttpServletRequest req,
			Model model) {
		System.out.println(s.getCategory());
		String fname = null;

		try {
			byte[] bytes = file.getBytes();
			String rootPath = req.getServletContext().getRealPath("upload");

			File dir = new File(rootPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			fname = file.getOriginalFilename();

			File serverFile = new File(dir.getAbsolutePath() + File.separator
					+ fname);
			
			System.out.println("filePath:" + serverFile.getAbsolutePath());

			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(serverFile));
			stream.write(bytes);
			s.setProfile(fname);
			
			stream.close();

		} catch (Exception e) {

		}
		
		System.out.println(s.getCategory());
		if (s.getCategory() == 1)
			dao.insertMember(s);
		else
			dao.insertMember_e(s);

		model.addAttribute("s", s);

		return "redirect:/safe/addSuccess";
	}

	
	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	public String updateMemberForm(@RequestParam String id, Model model,
			memberBean s) {

		s = dao.selectmember(id);
		model.addAttribute("s", s);
		return "v_updateMemberForm";
	}

	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("s") memberBean s,
			SessionStatus session) {

		dao.updatemember(s);
		session.setComplete();
		return "redirect:/safe/updateSuccess";
	}

	@RequestMapping("/updateSuccess")
	public String updateSuccess() {
		return "v_updateSuccess";
	}

	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMemberForm(@RequestParam String id, Model model) {

		memberBean s = dao.selectmember(id);
		model.addAttribute("s", s);
		return "v_deletePassword";
	}

	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	// http://localhost:8080/SpringWeb/spring/addBoardMember
	public String deleteMember(@RequestParam String password,
			@ModelAttribute("s") memberBean s) {

		if (s.getPassword().equals(password))
			dao.deletemember(s.getId());

		return "v_deleteSuccess";

	}

	@RequestMapping(value = "/listMember", method = RequestMethod.GET)
	// http://localhost:8080/SpringWeb/spring/addBoardMember
	public String listMember(Model model) {

		List<memberBean> list = dao.selectAll();

		model.addAttribute("list", list);
		return "v_listMember";

	}

	@RequestMapping(value = "/listMemberView", method = RequestMethod.GET)
	// http://localhost:8080/SpringWeb/spring/addBoardMember
	public String viewMember(@RequestParam String id, Model model) {

		memberBean s = dao.selectmember(id);

		model.addAttribute("s", s);
		return "v_listMemberView";

	}

	@RequestMapping(value = "/zipcode", method = RequestMethod.GET)
	// http://localhost:8080/SpringWeb/spring/addBoardMember
	public String zipcodeForm(Model model) {
		zipcodeBean zipcode = new zipcodeBean();
		model.addAttribute("zipcode", zipcode);

		return "/WEB-INF/view/zipcodeForm.jsp";
	}

	@RequestMapping(value = "/zipcode", method = RequestMethod.POST)
	// http://localhost:8080/SpringWeb/spring/addBoardMember
	public String zipcode(@ModelAttribute("zipcode") zipcodeBean zip,
			Model model) {

		List<zipcodeBean> list = dao.zipselect(zip.getDong());

		model.addAttribute("list", list);
		return "/WEB-INF/view/zipcodeForm.jsp";

	}

	@RequestMapping(value = "/safe_logout", method = RequestMethod.GET)
	// http://localhost:8080/SpringWeb/spring/addBoardMember
	public String safe_logout(Model model, SessionStatus session) {

		session.setComplete();
		memberBean s = new memberBean();
		model.addAttribute("s", s);

		return "/WEB-INF/view/safe_logout.jsp";

	}

	@RequestMapping(value = "/safe_logout", method = RequestMethod.POST)
	public String safe_logoutForm(Model model, @RequestParam String id,
			@RequestParam String password, HttpSession session) {

		memberBean s = dao.loginMember(id);

		if (s != null) {

			if (s.getPassword().equals(password)) {
				session.setAttribute("s", s);
				model.addAttribute("s", s);
				return ".main_all";
			}

		} else {
			s = new memberBean();
			model.addAttribute("s", s);
			return ".main_all";
		}

		return ".main_all";

	}

	@RequestMapping(value = "/safe_Mypage")
	// http://localhost:8080/SpringWeb/spring/addBoardMember
	public String safe_Mypage() {

		return "v_safe_Mypage";
	}

	
	@RequestMapping(value="/homeSecurity")
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String homeSecurity(HttpSession session){
		
		
		return "v_homeSecurity";
		}
	@RequestMapping(value="/homeRightOn")
	
	public String homeRightOn(HttpSession session){
		memberBean s = (memberBean)session.getAttribute("s");
		HomSecurityBean home = new HomSecurityBean();
		home.setId(s.getId());
		home.setNotice("ON");
		home.setCategory(30);
		dao.RightOn(home);
		
		return "redirect:/safe/homeSecurity";
		}
@RequestMapping(value="/homeRightOff")
	
	public String homeRightOff(HttpSession session){
		memberBean s = (memberBean)session.getAttribute("s");
		HomSecurityBean home = new HomSecurityBean();
		home.setId(s.getId());
		home.setNotice("ON");
		home.setCategory(30);
		HomSecurityBean list = new HomSecurityBean();
		list = dao.homeRecent(home);
	
		HomSecurityBean list2 = new HomSecurityBean();
		
		list2.setNum(list.getNum());
		list2.setNotice("OFF");
		dao.homeRecentNum(list2);
		
		return "redirect:/safe/homeSecurity";
		}
@RequestMapping(value="/homeDoorOpen")

public String homeDoorOpen(HttpSession session){
	memberBean s = (memberBean)session.getAttribute("s");
	HomSecurityBean home = new HomSecurityBean();
	home.setId(s.getId());
	home.setNotice("OPEN");
	home.setCategory(31);
	dao.RightOn(home);
	
	return "redirect:/safe/homeSecurity";
	}
@RequestMapping(value="/homeDoorClose")

public String homeDoorClose(HttpSession session){
	memberBean s = (memberBean)session.getAttribute("s");
	HomSecurityBean home = new HomSecurityBean();
	home.setId(s.getId());
	home.setNotice("OPEN");
	home.setCategory(31);
	HomSecurityBean list = new HomSecurityBean();
	list = dao.homeRecent(home);

	HomSecurityBean list2 = new HomSecurityBean();
	
	list2.setNum(list.getNum());
	list2.setNotice("CLOSE");
	dao.homeRecentNum(list2);
	
	return "redirect:/safe/homeSecurity";
	}
@RequestMapping(value="/homeSecurityOn")

public String homeSecurityOn(HttpSession session){
	memberBean s = (memberBean)session.getAttribute("s");
	HomSecurityBean home = new HomSecurityBean();
	home.setId(s.getId());
	home.setNotice("MODE ON");
	home.setCategory(32);
	dao.RightOn(home);
	
	return "redirect:/safe/homeSecurity";
	}
@RequestMapping(value="/homeSecurityOff")

public String homeSecurityOff(HttpSession session){
	memberBean s = (memberBean)session.getAttribute("s");
	HomSecurityBean home = new HomSecurityBean();
	home.setId(s.getId());
	home.setNotice("MODE ON");
	home.setCategory(32);
	HomSecurityBean list = new HomSecurityBean();
	list = dao.homeRecent(home);

	HomSecurityBean list2 = new HomSecurityBean();
	
	list2.setNum(list.getNum());
	list2.setNotice("MODE OFF");
	dao.homeRecentNum(list2);
	
	return "redirect:/safe/homeSecurity";
	}
@RequestMapping(value="/homeSecurityList", method=RequestMethod.GET)
//http://localhost:8080/SpringWeb/spring/addBoardMember
public String homeSecurityList(Model model,HttpSession session){
	
	memberBean s = (memberBean)session.getAttribute("s");
	List<HomSecurityBean> home = dao.selectHome(s.getId());
	model.addAttribute("home",home);
	List<HomSecurityBean> home1 = dao.selectHome2(s.getId());
	model.addAttribute("home1",home1);
	List<HomSecurityBean> home2 = dao.selectHome3(s.getId());
	model.addAttribute("home2",home2);
	List<HomSecurityBean> hom = dao.selectbolt(s.getId());
	HomSecurityBean home4 = new HomSecurityBean();
	
	
	int bolt=0;
	   for(int i=0; i<hom.size(); i++) {
	      
	      if(hom.get(i).getTime() < 60) {
	         bolt +=50;
	      }else {
	         bolt += hom.get(i).getTime() * 50/60;
	      }
	      
	   }
	   if(bolt >1000) {
	      
	   }
	   int bolt2 = (int) (bolt * 0.067);
	   String walt = bolt+"";
	   String price = bolt2+"";
	   
	   home4.setWalt(walt);
	   home4.setPrice(price);
	   model.addAttribute("female",home4);
	   
	   
	   
	
	return "v_SecurityList";
	}
@RequestMapping(value="/homeIntroduce")
//http://localhost:8080/SpringWeb/spring/addBoardMember
public String homeIntroduce(){
	
	return "v_homeIntroduce";
	}
@RequestMapping(value="/homeGrape")
//http://localhost:8080/SpringWeb/spring/addBoardMember
public String homeGrape(Model model,HttpSession session){
	memberBean s = (memberBean)session.getAttribute("s");
	List<HomSecurityBean> hom = dao.selectbolt(s.getId());
	HomSecurityBean home4 = new HomSecurityBean();
	int bolt=0;
	   for(int i=0; i<hom.size(); i++) {
	      
	      if(hom.get(i).getTime() < 60) {
	         bolt +=50;
	      }else {
	         bolt += hom.get(i).getTime() * 50/60;
	      }
	      
	   }
	   if(bolt >1000) {
	      
	   }
	   int bolt2 = (int) (bolt * 0.067);
	   String walt = bolt+"";
	   String price = bolt2+"";
	   
	   home4.setWalt(walt);
	   home4.setPrice(price);
	   model.addAttribute("female",home4);
	return "v_homeGrape";
	}



	@RequestMapping(value="/homeSe", method=RequestMethod.GET)
		//http://localhost:8080/SpringWeb/spring/addBoardMember
		public String homeSe(Model model, HttpSession session, @RequestParam String id){
			dao.homeSe(id);
		return "redirect:/safe/safe_Main";
	}
	

	
	

}
