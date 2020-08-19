package yjc.wdb.safe.controller;

import java.util.ArrayList;
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
import yjc.wdb.safe.bean.PageInfo;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.bean.zipcodeBean;
import yjc.wdb.safe.dao.ChildrenDao;
import yjc.wdb.safe.dao.memberDao;

@Controller
@SessionAttributes("c")
public class m_ChildrenController {
	@Autowired private ChildrenDao dao;
	@Autowired private memberDao m_dao;
	
	@RequestMapping(value="/m_childrenForm", method=RequestMethod.GET)
	//http://localhost:8080/minProject/minpro/addMinBoard
	public String addChildrenForm(Model model, @ModelAttribute("s") memberBean s,HttpSession session){
		
		
		ChildrenBean c = new ChildrenBean();
		s = (memberBean)session.getAttribute("s");
		
		if(s.getCategory() == 1)
			c.setCategory(1);
		else if(s.getCategory() == 2)
			c.setCategory(2);
	
		
		List lista = time();
		
		model.addAttribute("t_list", lista);
		model.addAttribute("c",c);
		model.addAttribute("s",s);
		
		
		return "m_addChildrenForm.children";
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
	
	@RequestMapping(value="/m_childrenForm",method=RequestMethod.POST)
	public String addChildren(@ModelAttribute("c") ChildrenBean c){
		
		
		String crime = c.getStart_time() +"/";
		crime += c.getStop_time();
		c.setCrime_time(crime);
		
		if(c.getCategory() == 1)
			dao.insertChildren(c);
		
		if(c.getCategory() ==2)
			dao.insertChildren_e(c);
		
		return "redirect:/safe/m_addChildrenSuccess";
		
	}
	
//	@RequestMapping(value="/c_zipcode", method=RequestMethod.GET)
//	//http://localhost:8080/SpringWeb/spring/addBoardMember
//	public String c_zipcodeForm(Model model){
//		
//		zipcodeBean c_zipcode = new zipcodeBean();
//		model.addAttribute("c_zipcode",c_zipcode);
//		
//		return "/WEB-INF/children/c_zipcodeForm.jsp";
//		}
//	
//	@RequestMapping(value="/c_zipcode", method=RequestMethod.POST)
//	//http://localhost:8080/SpringWeb/spring/addBoardMember
//	public String c_zipcode(@ModelAttribute("c_zipcode") zipcodeBean zip, Model model){
//		
//		
//		
//		
//		List<zipcodeBean> list = dao.zipselect(zip.getDong());
//		
//		model.addAttribute("list",list);
//		return "/WEB-INF/children/c_zipcodeForm.jsp";
//		
//	}
//	
//	
//	@RequestMapping(value="/d_zipcode", method=RequestMethod.GET)
//	//http://localhost:8080/SpringWeb/spring/addBoardMember
//	public String d_zipcodeForm(Model model){
//		
//		zipcodeBean d_zipcode = new zipcodeBean();
//		model.addAttribute("d_zipcode",d_zipcode);
//		
//		return "/WEB-INF/children/d_zipcodeForm.jsp";
//		}
//	
//	@RequestMapping(value="/d_zipcode", method=RequestMethod.POST)
//	//http://localhost:8080/SpringWeb/spring/addBoardMember
//	public String d_zipcode(@ModelAttribute("d_zipcode") zipcodeBean zip, Model model){
//		
//		
//		
//		
//		List<zipcodeBean> list = dao.zipselect(zip.getDong());
//		
//		model.addAttribute("list",list);
//		return "/WEB-INF/children/d_zipcodeForm.jsp";
//		
//	}
	
	@RequestMapping("/m_addChildrenSuccess")
	public String addBoardMemberSuccess(){
		return "m_addChildrenSuccess.children";
	}
	
	
	@RequestMapping(value="/m_E_search", method=RequestMethod.GET)
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
				buf.append("<a href ='m_listchildren?currentPage=").append(startPage-pageBlock).append("'>");
				buf.append("[다음]</a>");
			}
			
			for(int i = startPage; i <= endPage; i++){
				buf.append("<a href ='m_listchildren?currentPage=").append(i).append("'>[").append(i);
				buf.append("]</a>");
				
			}
			if(startPage < pageBlock){
				buf.append("<a href ='m_listchildren?currentPage=").append(startPage+pageBlock).append("'>");
				buf.append("[이전]</a>");
			}
			page.setBottomPartOfHtml(buf.toString());
		}
		
		page.setNumOfChildrens(numOfChildrens);
		model.addAttribute("pageInfo",page);
		
	
		return "m_e_search.children";
		
	}
	
	@RequestMapping(value="/m_C_search", method=RequestMethod.GET)
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
				buf.append("<a href ='m_listchildren?currentPage=").append(startPage-pageBlock).append("'>");
				buf.append("[다음]</a>");
			}
			
			for(int i = startPage; i <= endPage; i++){
				buf.append("<a href ='m_listchildren?currentPage=").append(i).append("'>[").append(i);
				buf.append("]</a>");
				
			}
			if(startPage < pageBlock){
				buf.append("<a href ='m_listchildren?currentPage=").append(startPage+pageBlock).append("'>");
				buf.append("[이전]</a>");
			}
			page.setBottomPartOfHtml(buf.toString());
		}
		
		page.setNumOfChildrens(numOfChildrens);
		model.addAttribute("pageInfo",page);
		
	
		return "m_e_search.children";
		
	}
	
	
	@RequestMapping(value="/m_listchildren", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String listchildren(@RequestParam(required=false,defaultValue="1") int currentPage,Model model,@RequestParam String id){
		
		
		
		int pageSize = 10;
		int pageBlock=10;
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
		
	
		return "m_listChildren.children";
		
	}
	
	@RequestMapping(value="/m_Enterprise", method=RequestMethod.GET)
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
		
		return "m_Enterprise.children";
		
	}
	
	
	
	
	@RequestMapping(value="/m_listchildrenView", method=RequestMethod.GET)
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
		
		return "m_listChildrenView.children";
		
	}
	
	@RequestMapping("/m_selectSuccess")
	public String selectSuccess(){
		return "/WEB-INF/children/m_selectSuccess.jsp";
	}
	
	
	@RequestMapping(value="/m_safe_request")
	public String safe_Request(Model model,@RequestParam String id, @RequestParam int category){
		
		if(category == 2){
		List<ChildrenBean> request_list = dao.requestSelect(id);
		
		model.addAttribute("request_list",request_list);
		
		}else {
			ChildrenBean children = dao.p_requestSelect(id);
			model.addAttribute("children",children);
		}
		
		return "m_safe_request.children";
	}
	
	@RequestMapping(value="/m_requestView")
	public String requestView(Model model,@RequestParam int num){
		
		ChildrenBean c = dao.selectChildren(num);
		
		model.addAttribute("c",c);
		
		return "m_requestView.children";
		
	}
	
	@RequestMapping(value="/m_requestDelete")
	public String requestDelete(@RequestParam String id){
		
		dao.requestDelete(id);
	
		return "m_safe_request.children";
		
	}
	
	
	@RequestMapping(value="/m_childrenupdate", method=RequestMethod.GET)
	public String updatechildrenForm(@RequestParam int num,@RequestParam (required=false,defaultValue="1") int currentPage, Model model, ChildrenBean c){
		
		c = dao.selectChildren(num);
		
		List lista = time();
		
		model.addAttribute("t_list", lista);
		model.addAttribute("c",c);
		model.addAttribute("currentPage",currentPage);
		return "m_updateChildrenForm.children";
	}
	
	
	@RequestMapping(value="/m_childrenupdate", method=RequestMethod.POST)
	public String updatechildren(@ModelAttribute("c") ChildrenBean c, SessionStatus session){
		
		String crime = c.getStart_time() +"/";
		crime += c.getStop_time();
		c.setCrime_time(crime);
		
		dao.updateChildren(c);
		session.setComplete();
		return "redirect:/safe/m_updateChildren";
	}
	
	
	@RequestMapping("/m_updateChildren")
	public String updateSuccess(){
		return "m_updateChildren.children";
	}
	
	
	@RequestMapping(value="/m_deletechildren", method=RequestMethod.GET)
	public String deleteChildrenForm(@RequestParam int num, Model model,@RequestParam (required=false,defaultValue="1") int currentPage){
		
		ChildrenBean c = dao.selectChildren(num);
		model.addAttribute("c",c);
		model.addAttribute("currentPage",currentPage);
		return "m_deleteForm.children";
	}
	
	@RequestMapping(value="/m_deletechildren", method=RequestMethod.POST)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String deleteChildren(@RequestParam String id, @ModelAttribute("c") ChildrenBean c){
		
		if(c.getId().equals(id))
		dao.deleteChildren(c.getNum());
		
		return "m_deleteChildren.children";
		
	}
	
	
	

}
