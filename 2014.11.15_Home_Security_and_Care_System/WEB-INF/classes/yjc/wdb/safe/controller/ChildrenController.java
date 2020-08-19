package yjc.wdb.safe.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;






import org.springframework.web.bind.support.SessionStatus;

import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.FemaleBean;
import yjc.wdb.safe.bean.PageInfo;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.bean.zipcodeBean;
import yjc.wdb.safe.dao.ChildrenDao;
import yjc.wdb.safe.dao.FemaleDao;
import yjc.wdb.safe.dao.memberDao;



@Controller
@SessionAttributes("c")
public class ChildrenController {
	@Autowired private ChildrenDao dao;
	@Autowired private memberDao m_dao;
	@Autowired private FemaleDao f_dao;
	
	
	
	@RequestMapping(value="/childrenForm", method=RequestMethod.GET)
	//http://localhost:8080/minProject/minpro/addMinBoard
	public String addChildrenForm(Model model, @ModelAttribute("s") memberBean s, HttpSession session){
		
		
		
		ChildrenBean c = new ChildrenBean();
		s = (memberBean)session.getAttribute("s");
		
		if(s.getCategory() == 1)
			c.setCategory(1);
		else if(s.getCategory() == 2)
			c.setCategory(2);
	
		
		List lista = time();
		List list_year = date("year");
		List list_month = date("month");
		List list_day = date("day");
		
		model.addAttribute("t_list", lista);
		model.addAttribute("c",c);
		model.addAttribute("s",s);
		model.addAttribute("list_year",list_year);
		model.addAttribute("list_month",list_month);
		model.addAttribute("list_day",list_day);
		
		
		
		return "c_addChildrenForm";
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
	
	public List date(String date) {
		
		
		java.util.Calendar cal = java.util.Calendar.getInstance();
		ArrayList<Object> list = new ArrayList<Object>();
		
		if(date.equals("year")){
			int year = cal.get ( cal.YEAR );
			
		for(int i= year; i<year+20; i++){
			
			 list.add(i);
		}	
		}
		if(date.equals("month")){
			for(int i=1; i<=12; i++){
				if(i<10)
					 list.add("0"+i);
				else
					list.add(i);
			}	
		}
		
		if(date.equals("day")){
			
			for(int i=1; i<=31; i++){
				if(i<10)
				 list.add("0"+i);
				else
				list.add(i);
			}	
		}
		return list;
	}
	
	@RequestMapping(value="/childrenForm",method=RequestMethod.POST)
	public String addChildren(@ModelAttribute("c") ChildrenBean c){
		
		
		String crime = c.getStart_time() +"/";
		crime += c.getStop_time();
		c.setCrime_time(crime);
		String[] e_info = null;
		
		if(c.getCategory() == 1){
			
		String start_date = c.getStart_year()+"-"+c.getStart_month()+"-"+c.getStart_day();
		String end_date = c.getEnd_year()+"-"+c.getEnd_month()+"-"+c.getEnd_day();
		c.setStart_date(start_date);
		c.setEnd_date(end_date);
		e_info = c.getE_id().split("/");
		c.setE_id(e_info[0]);
		int e_num = Integer.parseInt(e_info[1]);
		
		c.setE_num(e_num);
			
		dao.insertChildren_e(c);
		}
		if(c.getCategory() ==2)
			dao.insertChildren(c);
		
		return "redirect:/safe/addChildrenSuccess";
		
	}
	
	@RequestMapping(value="/c_zipcode", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String c_zipcodeForm(Model model){
		
		zipcodeBean c_zipcode = new zipcodeBean();
		model.addAttribute("c_zipcode",c_zipcode);
		
		return "/WEB-INF/children/c_zipcodeForm.jsp";
		}
	
	
	@RequestMapping(value="/c_zipcode", method=RequestMethod.POST)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String c_zipcode(@ModelAttribute("c_zipcode") zipcodeBean zip, Model model){
		
		
		
		
		List<zipcodeBean> list = dao.zipselect(zip.getDong());
		
		model.addAttribute("list",list);
		return "/WEB-INF/children/c_zipcodeForm.jsp";
		
	}
	
	@RequestMapping(value="/d_zipcode", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String d_zipcodeForm(Model model){
		
		zipcodeBean d_zipcode = new zipcodeBean();
		model.addAttribute("d_zipcode",d_zipcode);
		
		return "/WEB-INF/children/d_zipcodeForm.jsp";
		}
	
	@RequestMapping(value="/d_zipcode", method=RequestMethod.POST)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String d_zipcode(@ModelAttribute("d_zipcode") zipcodeBean zip, Model model){
		
	List<zipcodeBean> list = dao.zipselect(zip.getDong());
		
		model.addAttribute("list",list);
		return "/WEB-INF/children/d_zipcodeForm.jsp";
		
	}
	
	
	
	@RequestMapping("/addChildrenSuccess")
	public String addBoardMemberSuccess(){
		return "c_addChildrenSuccess";
	}
	
	
	
	
	
	@RequestMapping(value="/E_search", method=RequestMethod.GET)
	public String E_search(@RequestParam(required=false,defaultValue="1") int currentPage,Model model,@RequestParam String start, @RequestParam String end){
		
		PageInfo page = new PageInfo();
		int pageSize = 10;
		int pageBlock=10;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = startRow + pageSize;
		
		
		startRow -=1;
		endRow -=1;
		page.setStartRow(startRow);
		page.setEndRow(endRow);
		
		int numOfChildrens = dao.getChildrenCount();
		
		if(end != "")
			page.setEnd("%"+end+"%");
		 
		if(start != "")
			page.setStart("%"+start+"%");
		if(start != "" && end != ""){
			page.setStart("%"+start+"%");
			page.setEnd("%"+end+"%");
		}
		
		System.out.println(page.getEnd());
		System.out.println(page.getStart());
		
		
		List<ChildrenBean> list = dao.e_search(page);
		
		
	
		page.setChildrens(list);
		
		page.setNumOfChildrens(numOfChildrens);
		page.setCurrentPage(currentPage);
		
		if(numOfChildrens > 0){
			int pageCount = numOfChildrens/pageSize + (numOfChildrens%pageSize==0?0:1);
			int startPage = (int) ((currentPage-1)/pageSize)*pageSize+1;
			int endPage = startPage + pageBlock-1;
			if(endPage>pageCount) endPage = pageCount;
			
			page.setPageCount(pageCount);
			page.setStartPage(startPage);
			page.setEndPage(endPage);
			
			StringBuffer buf = new StringBuffer();
			
			if(startPage > pageBlock){
				buf.append("<a href ='listchildren?currentPage=").append(startPage-pageBlock).append("'>");
				buf.append("[다음]</a>");
			}
			
			for(int i = startPage; i <= endPage; i++){
				buf.append("<a href ='listchildren?currentPage=").append(i).append("'>[").append(i);
				buf.append("]</a>");
				
			}
			if(startPage < pageBlock){
				buf.append("<a href ='listchildren?currentPage=").append(startPage+pageBlock).append("'>");
				buf.append("[이전]</a>");
			}
			page.setBottomPartOfHtml(buf.toString());
		}
		
		page.setNumOfChildrens(numOfChildrens);
		model.addAttribute("pageInfo",page);
		
	
		return "c_e_search";
		
	}
	
	
	
	@RequestMapping(value="/C_search", method=RequestMethod.GET)
	public String C_search(@RequestParam(required=false,defaultValue="1") int currentPage,Model model,@RequestParam String start, @RequestParam String end){
		
		
		
		PageInfo page = new PageInfo();
		int pageSize = 10;
		int pageBlock=10;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = startRow + pageSize;
		
		
		startRow -=1;
		endRow -=1;
		page.setStartRow(startRow);
		page.setEndRow(endRow);
		
		int numOfChildrens = dao.getChildrenCount();
		
		
		
		if(end != "")
			page.setEnd("%"+end.trim()+"%");
		 
		if(start != "")
			page.setStart("%"+start.trim()+"%");
		if(start != "" && end != ""){
			page.setStart("%"+start.trim()+"%");
			page.setEnd("%"+end.trim()+"%");
		}
		
	
		List<ChildrenBean> list = dao.c_search(page);
	
		page.setChildrens(list);
		
		page.setNumOfChildrens(numOfChildrens);
		page.setCurrentPage(currentPage);
		
		if(numOfChildrens > 0){
			int pageCount = numOfChildrens/pageSize + (numOfChildrens%pageSize==0?0:1);
			int startPage = (int) ((currentPage-1)/pageSize)*pageSize+1;
			int endPage = startPage + pageBlock-1;
			if(endPage>pageCount) endPage = pageCount;
			
			
			
			page.setPageCount(pageCount);
			page.setStartPage(startPage);
			page.setEndPage(endPage);
			
			StringBuffer buf = new StringBuffer();
			
			if(startPage > pageBlock){
				buf.append("<a href ='listchildren?currentPage=").append(startPage-pageBlock).append("'>");
				buf.append("[다음]</a>");
			}
			
			for(int i = startPage; i <= endPage; i++){
				buf.append("<a href ='listchildren?currentPage=").append(i).append("'>[").append(i);
				buf.append("]</a>");
				
			}
			if(startPage < pageBlock){
				buf.append("<a href ='listchildren?currentPage=").append(startPage+pageBlock).append("'>");
				buf.append("[이전]</a>");
			}
			page.setBottomPartOfHtml(buf.toString());
		}
		
		page.setNumOfChildrens(numOfChildrens);
		model.addAttribute("pageInfo",page);
		
	
		return "c_e_search";
		
	}
	

	@RequestMapping(value="/listchildren", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String listchildren(@RequestParam(required=false,defaultValue="1") int currentPage,Model model,@RequestParam String id){
		
		int pageSize = 10;
		int pageBlock= 10;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = startRow + pageSize;
		
		PageInfo page = new PageInfo();
		
		startRow -=1;
		endRow -=1;
		page.setStartRow(startRow);
		page.setEndRow(endRow);
		page.setId(id);
		int numOfChildrens = dao.getChildrenCount();
		List<ChildrenBean> list = dao.getChildrens(page);
		
		page.setChildrens(list);
		
		
		page.setNumOfChildrens(numOfChildrens);
		page.setCurrentPage(currentPage);
		
		if(numOfChildrens > 0){
			int pageCount = numOfChildrens/pageSize + (numOfChildrens%pageSize==0?0:1);
			int startPage = (int) ((currentPage-1)/pageSize)*pageSize+1;
			System.out.println(startPage);
			int endPage = startPage + pageBlock-1;
			if(endPage>pageCount) endPage = pageCount;
			
			
			
			page.setPageCount(pageCount);
			page.setStartPage(startPage);
			page.setEndPage(endPage);
			
			StringBuffer buf = new StringBuffer();
			
			if(startPage > pageBlock){
				buf.append("<a href ='listchildren?currentPage=").append(startPage-pageBlock).append("'>");
				buf.append("[다음]</a>");
			}
			
			for(int i = startPage; i < endPage; i++){
				buf.append("<a href ='listchildren?currentPage=").append(i).append("'>[").append(i);
				buf.append("]</a>");
				
			}
			if(startPage < pageBlock){
				buf.append("<a href ='listchildren?currentPage=").append(startPage+pageBlock).append("'>");
				buf.append("[이전]</a>");
			}
			page.setBottomPartOfHtml(buf.toString());
		}
		
		page.setNumOfChildrens(numOfChildrens);
		model.addAttribute("pageInfo",page);
		
	
		return "c_Enterchildren";
		
	}
	@RequestMapping(value="/listchildrenView", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String viewchildren(@RequestParam int num, Model model,@RequestParam (required=false,defaultValue="1") int currentPage){
		
		
		ChildrenBean c = dao.selectChildren(num);
		
		
		String sum = dao.star_sum(c);
		
		
		if(sum != null){
		
		int avar_sum = Integer.parseInt(sum);
		int count = dao.star_count(c.getId());
		String average = avar_sum/count + "";
		c.setStar_average(average);	
		}
		model.addAttribute("c",c);
		model.addAttribute("currentPage",currentPage);
		
		return "/WEB-INF/children/listChildrenView.jsp";
		
	}
	
	
	@RequestMapping("/selectSuccess")
	public String selectSuccess(){
		return "/WEB-INF/children/selectSuccess.jsp";
	}
	
	
	
	@RequestMapping(value="/safe_request")
	public String safe_Request(Model model,@RequestParam String id, @RequestParam int category){
		
		
		if(category == 2){
		List<ChildrenBean> request_list = dao.requestSelect(id);
		
		model.addAttribute("request_list",request_list);
		
		}else {
			ChildrenBean children = dao.p_requestSelect(id);
			model.addAttribute("children",children);
		}
		
		return "c_safe_request";
	}
	
	@RequestMapping(value="/requestView")
	public String requestView(Model model,@RequestParam int num){
		
		ChildrenBean c = dao.selectChildren(num);
		
		model.addAttribute("c",c);
		
		return "c_requestView";
		
	}
	
	
	@RequestMapping(value="/requestDelete")
	public String requestDelete(@RequestParam String id){
		
		System.out.println(id);
		dao.requestDelete(id);
	
		return "c_safe_request";
		
	}
	
	
	
	
	@RequestMapping(value="/childrenupdate", method=RequestMethod.GET)
	public String updatechildrenForm(@RequestParam int num,@RequestParam (required=false,defaultValue="1") int currentPage, Model model, ChildrenBean c){
		
		c = dao.selectChildren(num);
		
		List lista = time();
		
		model.addAttribute("t_list", lista);
		model.addAttribute("c",c);
		model.addAttribute("currentPage",currentPage);
		return "c_updateChildrenForm";
	}
	
	@RequestMapping(value="/childrenupdate", method=RequestMethod.POST)
	public String updatechildren(@ModelAttribute("c") ChildrenBean c, SessionStatus session){
		
		String crime = c.getStart_time() +"/";
		crime += c.getStop_time();
		c.setCrime_time(crime);
		
		dao.updateChildren(c);
		session.setComplete();
		return "redirect:/safe/updateChildren";
	}
	
	@RequestMapping("/updateChildren")
	public String updateSuccess(){
		return "c_updateChildren";
	}
	
	
	
	@RequestMapping(value="/deletechildren", method=RequestMethod.GET)
	public String deleteChildrenForm(@RequestParam int num, Model model,@RequestParam (required=false,defaultValue="1") int currentPage){
		
		ChildrenBean c = dao.selectChildren(num);
		model.addAttribute("c",c);
		model.addAttribute("currentPage",currentPage);
		return "c_deleteForm";
	}
	
	@RequestMapping(value="/deletechildren", method=RequestMethod.POST)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String deleteChildren(@RequestParam String id, @ModelAttribute("c") ChildrenBean c){
		
		if(c.getId().equals(id))
		dao.deleteChildren(c.getNum());
		
		return "c_deleteChildren";
		
	}
	
	
	@RequestMapping(value="/safe_scheduler", method=RequestMethod.GET)
	public String SchedulerForm(){
		return "s_safe_scheduler";
	}
	
	
	
	@RequestMapping(value="/selectEnter", method=RequestMethod.GET)
	public String selectEnter(@RequestParam String start,Model model,@RequestParam String end){
		
		ChildrenBean children  = new ChildrenBean();
		System.out.println(start);
		System.out.println(end);
		String[] select_start = start.split(" ");
		String[] end_start = end.split(" ");
		
		children.setStart_date("%"+select_start[2]+"%");
		children.setEnd_date("%"+end_start[2]+"%");
		
		List<ChildrenBean> list = dao.SelectEnter(children);
		model.addAttribute("list",list);
		
		
		
		if(list.size() == 0) {
			
			List<ChildrenBean> start_list = dao.selectEnter_start(children.getStart_date());
			
			model.addAttribute("list", start_list);
			
			if(start_list.size() == 0){
				
				List<ChildrenBean> end_list = dao.selectEnter_end(children);
				model.addAttribute("list",end_list);
				return "/WEB-INF/children/selectEnter.jsp";
			}
		
		}
		
		return "/WEB-INF/children/selectEnter.jsp";
	
	}
	
	@RequestMapping(value="/radioMember", method=RequestMethod.GET)
	public String radioMember(@RequestParam String id,Model model, @RequestParam String val){
		
	
		ChildrenBean children  = new ChildrenBean();
		
		if(val.equals("p")){
			memberBean member = m_dao.loginMember(id);
			String[] add = member.getAddress().split("");
			children.setStart_date("%"+add[2]+"%");
			List<ChildrenBean> start_list = dao.selectEnter_start(children.getStart_date());
			
			model.addAttribute("list", start_list);
			
			
		}else{
			List<ChildrenBean> list = dao.select_date(id);
			model.addAttribute("list", list);
		}
		
		return "/WEB-INF/children/selectEnter.jsp";
	
	}
	
	
	@RequestMapping(value="/Entersuccess", method=RequestMethod.GET)
	public String Entersuccess(@RequestParam int num, @RequestParam String id, @RequestParam String e_id, @RequestParam String ch_name, @RequestParam String ch_pass,Model model){
		
		dao.Entersuccess(num);
		memberBean s = new memberBean();
		s.setId(ch_name);
		s.setPassword(ch_pass);
		s.setE_name(id);
		s.setCategory(5);
		m_dao.children_insert(s);
		
		
		return "/WEB-INF/children/EnterSuDe.jsp";
		
	}
	@RequestMapping(value="/Enterdelete", method=RequestMethod.GET)
	public String Enterdelete(@RequestParam int num, Model model){
		
		dao.Enterdelete(num);
		return "/WEB-INF/children/EnterSuDe.jsp";
	}
	
	
	
	
	@RequestMapping(value="/EnterView", method=RequestMethod.GET)
	public String EnterView(@RequestParam String e_id, @RequestParam int e_num, Model model) throws ParseException{
		
		ChildrenBean children = new ChildrenBean();
		children.setE_id(e_id);
		children.setE_num(e_num);
		List<ChildrenBean> e_list = dao.EnterView(children);
		
		
		model.addAttribute("e_list",e_list);
		
		return "c_Enterprise";
		
	}
	
	@RequestMapping(value="/Enterprise", method=RequestMethod.GET)
	public String Enterprise(@RequestParam int num, Model model,@RequestParam (required=false,defaultValue="1") int currentPage){
		
		
		ChildrenBean c = dao.selectChildren(num);
		
		String sum = dao.star_sum(c);
		if(sum != null){
		
		int avar_sum = Integer.parseInt(sum);
		int count = dao.star_count(c.getId());
		String average = avar_sum/count + "";
		c.setStar_average(average);	
		}
		int current_count = dao.current_count(c);
		
		c.setCurrent_count(current_count+"");
		
		model.addAttribute("c",c);
		model.addAttribute("currentPage",currentPage);
		
		return "c_Enterprise";
		
	}
	
	
	
	@RequestMapping(value="/children_info", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String children_info(Model model,HttpSession session){
		
		memberBean member = (memberBean) session.getAttribute("s");
		if(member == null){
		member = new memberBean();
		model.addAttribute("s",member);
		
		}
		else{
			model.addAttribute("s",member);
			
		}
		return "c_children_info";
		
	}
	
	@RequestMapping(value="/children_listAll", method=RequestMethod.GET)
	   public String listAll1(Model model,HttpSession session) {
	      memberBean s = (memberBean) session.getAttribute("s");
	      System.out.println(s.getId());
	      ChildrenBean children = new ChildrenBean();
	      children.setId(s.getId());
	      children.setCategory(s.getCategory());
	      List<ChildrenBean> list = dao.children_all(children);
	      
	      model.addAttribute("list",list);
	      return "/WEB-INF/children/children_listAll.jsp";
	   }
	
	

}