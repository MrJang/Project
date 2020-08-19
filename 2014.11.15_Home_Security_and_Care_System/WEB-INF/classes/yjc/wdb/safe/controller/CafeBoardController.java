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









import yjc.wdb.safe.bean.CafeBean;
import yjc.wdb.safe.bean.CafeBoardBean;
import yjc.wdb.safe.bean.CafeMemberBean;
import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.PageInfo;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.dao.CafeBoardDao;
import yjc.wdb.safe.dao.CafeDao;
import yjc.wdb.safe.dao.ChildrenDao;
import yjc.wdb.safe.dao.memberDao;

@Controller
@SessionAttributes("cbb")
public class CafeBoardController {
	
	@Autowired
	private CafeBoardDao dao;
	
	@Autowired
	private CafeDao c_dao;
	@Autowired
	private memberDao m_dao;
	
	
	@RequestMapping(value="/childrenreview", method=RequestMethod.GET)
	public String addReviewForm_u(Model model,int cafe_num, int board_cate){
		System.out.println(cafe_num);
		System.out.println(board_cate);
		CafeBean cafe = c_dao.selectCafe(cafe_num);
		
		CafeBoardBean c = new CafeBoardBean();
		c.setCafe_num(cafe_num);
		c.setBoard_cate(board_cate);
		model.addAttribute("c",c);
		
		model.addAttribute("cafe",cafe);
		
		return "r_addReviewForm";
	}
	
	@RequestMapping(value="/childrenreview",method=RequestMethod.POST)
	public String addReview(@ModelAttribute("c") CafeBoardBean c){
		
	
		dao.insertReview(c);
		return "redirect:/safe/ReviewSuccess";
		
	}
	
	
	
	@RequestMapping("/ReviewSuccess")
	public String addReviewSuccess(){
		return "r_ReviewSuccess";
	}
	
	
	// review ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Îºï¿½
	
	@RequestMapping(value="/listreview", method=RequestMethod.GET)
	//http://localhost:8080/SpringWeb/spring/addBoardMember
	public String listReview(Model model,@RequestParam(required=false,defaultValue="1") int currentPage,int cafe_num, int board_cate){
		
		int pageSize = 10;
		int pageBlock=10;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = startRow + pageSize;
		
		PageInfo page = new PageInfo();
		
		startRow -=1;
		endRow -=1;
		page.setStartRow(startRow);
		page.setEndRow(endRow);
		
		page.setBoard_cate(board_cate);
		page.setCafe_num(cafe_num);
		
		int numOfChildrens = dao.getReviewCount(page);
		List<CafeBoardBean> list = dao.getReviews(page);
		
		
		page.setReviews(list);
		
		
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
				buf.append("<a href ='listreview?currentPage=").append(startPage-pageBlock).append("'>");
				buf.append("[´ÙÀ½]</a>");
			}
			
			for(int i = startPage; i <= endPage; i++){
				buf.append("<a href ='listreview?currentPage=").append(i).append("'>[").append(i);
				buf.append("]</a>");
				
			}
			if(startPage < pageBlock){
				buf.append("<a href ='listreview?currentPage=").append(startPage+pageBlock).append("'>");
				buf.append("[ÀÌÀü]</a>");
			}
			page.setBottomPartOfHtml(buf.toString());
		}
		
		page.setNumOfChildrens(numOfChildrens);
		model.addAttribute("pageInfo",page);
		
		
	
		return "r_listReview";
		
	}
	
	

	
	
	@RequestMapping(value="/reViewView", method=RequestMethod.GET)
	public String reviewchildren(@RequestParam int num, Model model){
		
		CafeBoardBean c = dao.selectReview(num);
		model.addAttribute("c",c);
		
		return "r_reViewView";
		
	}
	
	
	@RequestMapping(value="/Reviewupdate", method=RequestMethod.GET)
	public String updateReviewForm(@RequestParam int num, Model model, CafeBoardBean c){
		
		c = dao.selectReview(num);
		model.addAttribute("c",c);
		return "r_updateReviewForm";
	}
	
	@RequestMapping(value="/Reviewupdate", method=RequestMethod.POST)
	public String updateReview(@ModelAttribute("c") CafeBoardBean c, SessionStatus session){
		
		dao.Reviewupdate(c);
		session.setComplete();
		return "redirect:/safe/updateReview";
	}
	
	@RequestMapping("/updateReview")
	public String updateReviewSuccess(){
		return "r_updateReviewSuccess";
	}
	
	@RequestMapping(value="/deleteReview", method=RequestMethod.GET)
	public String deleteReviewForm(@RequestParam int num, Model model){
		
		CafeBoardBean c = dao.selectReview(num);
		model.addAttribute("c",c);
		return "r_deleteReviewForm";
	}
	
	@RequestMapping(value="/deleteReview", method=RequestMethod.POST)
	public String deleteReview(HttpSession session,@ModelAttribute("c") ChildrenBean c){
		memberBean s = (memberBean) session.getAttribute("s");
		if(c.getId().equals(s.getId()))
			dao.deleteChildren_cafe(c.getNum());
		
		return "r_deleteReview";
		
	}
		
}
