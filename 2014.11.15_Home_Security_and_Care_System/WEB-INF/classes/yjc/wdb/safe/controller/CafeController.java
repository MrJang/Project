package yjc.wdb.safe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.safe.dao.CafeDao;
import yjc.wdb.safe.dao.ChildrenDao;
import yjc.wdb.safe.bean.CafeBean;
import yjc.wdb.safe.bean.CafeBoardBean;
import yjc.wdb.safe.bean.CafeMemberBean;
import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.memberBean;

@Controller
@SessionAttributes("cafe")
public class CafeController {

	@Autowired
	private CafeDao dao;
	@Autowired
	private ChildrenDao c_dao;

	
	@RequestMapping(value = "/group_Home", method = RequestMethod.GET)
	public String CafeHome(Model model, @RequestParam String id,
			@RequestParam int num, @RequestParam int category) {
		
		List<CafeMemberBean> cafe_member = dao.cafeselect(id);
		CafeBean cf = new CafeBean();
		
		if (cafe_member == null) {
			cf.setBoard_num(num);
			model.addAttribute("cafe", cf);
			return "cmain_cafehome";
		} else {
			
			
			if (category == 1) {
				
				cf = dao.cafeList_member(id);
				if(cf == null)
					return "v_no_group";
				model.addAttribute("cafe", cf);
				return "cafe_cafe";

			} else {
				
				cf.setBoard_num(num);
				cf.setId(id);
				
				cf = dao.cafeList(cf);
				
				if (cf != null) {
					model.addAttribute("cafe", cf);
					return "cafe_cafe";
				} else {
					System.out.println("else");
					CafeBean cf1 = new CafeBean();
					cf1.setBoard_num(num);
					model.addAttribute("cafe", cf1);
					return "cmain_cafehome";

				}
			}
		}
	}

	
	@RequestMapping(value = "/cafe", method = RequestMethod.GET)
	public String Cafe(@RequestParam int c_num, Model model, HttpSession session) {
		
		CafeBean cf = dao.selectCafe(c_num);
		
		model.addAttribute("cafe", cf);
		return "cafe_cafe";
	}

	
	@RequestMapping(value = "/createCafe", method = RequestMethod.GET)
	public String CreateCafe(Model model, @RequestParam int board_num) {

		CafeBean cf = new CafeBean();
		cf.setBoard_num(board_num);
		model.addAttribute("cafe", cf);

		return "cmain_createCafe";
	}

	@RequestMapping(value = "/createCafe", method = RequestMethod.POST)
	public String CreateCafe(@RequestParam String id,
			@RequestParam String c_name, @RequestParam String c_info,
			@RequestParam("c_image") MultipartFile file,
			@RequestParam int board_num, HttpServletRequest req, Model model,
			HttpSession session) {

		CafeBean cf = new CafeBean();
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
			cf.setC_image(fname);
			
			cf.setC_member("1");
			cf.setId(id);
			cf.setC_name(c_name);
			cf.setC_info(c_info);
			cf.setBoard_num(board_num);
			dao.createCafe(cf);
			model.addAttribute("cafe", cf);

			cf = dao.selectCafeMaster(cf);
			

			CafeMemberBean c_member = new CafeMemberBean();
		
			c_member.setId(id);
			c_member.setGrade("M");

			c_member.setC_num(cf.getC_num());
			dao.JoinMember(c_member);
			model.addAttribute("c_member", c_member);

			stream.close();
		} catch (Exception e) {

			return  e.getMessage();
		}
		return "redirect:/safe/createCafeSuccess";
	}

	
	@RequestMapping("/createCafeSuccess")
	public String CreateCafeSuccess() {
		return "cafe_createCafeSuccess";
	}

	
	@RequestMapping(value = "/cafeJoin", method = RequestMethod.GET)
	public String CafeJoin(Model model, @RequestParam int c_num,
			@RequestParam String id, @RequestParam int board_num) {

		CafeMemberBean c_member = new CafeMemberBean();
		c_member.setC_num(c_num);
		model.addAttribute("c_member", c_member);

		ChildrenBean children = new ChildrenBean();
		children.setE_id(id);
		children.setE_num(board_num);
		List<ChildrenBean> list = c_dao.CafeSelect(children);
		model.addAttribute("cafe_member", list);
		return "cafe_cafeJoin";
	}

	@RequestMapping(value = "/cafeJoin", method = RequestMethod.POST)
	public String CafeJoin(@ModelAttribute("c_member") CafeMemberBean c_member,
			@RequestParam String[] cafe_member, Model model, HttpSession session) {

		for (int i = 0; i < cafe_member.length; i++) {
			CafeMemberBean cafeJoin = dao.selectMember(cafe_member[i]);
			if (cafeJoin != null)
				if (cafeJoin.getId().equals(cafe_member[i])
						&& cafeJoin.getC_num() == c_member.getC_num())
					return "cafe_cafeJoinError";

			c_member.setGrade("n");
			c_member.setId(cafe_member[i]);

			dao.cafeJoin(c_member.getC_num());
			dao.JoinMember(c_member);
			ChildrenBean children = new ChildrenBean();
			children.setId(cafe_member[i]);
			children.setCafe_select(c_member.getC_num());
			c_dao.updateCafe_select(children);

		}

		return "redirect:/safe/cafeJoinSuccess";

	}
	
	
	@RequestMapping("/cafeJoinSuccess")
	public String cafeJoinSuccess() {
		return "cafe_cafeJoinSuccess";
	}
	
	@RequestMapping(value="/group_listAll", method=RequestMethod.GET)
	   public String group_listAll(Model model,HttpSession session) {
	      memberBean s = (memberBean) session.getAttribute("s");
	     List<CafeBean> list = dao.joincafeList(s.getId());
	     List<CafeBean> list_all = null;
	     for(int i=0; i<list.size(); i++){
	    	 list_all = dao.joinCafeList_all(list.get(i).getC_num());
	    	 if(list.size()-1 == i){
	    	 model.addAttribute("cafe",list_all);
	    	 }
	     }
	     	
	     
	      return "/WEB-INF/cafe/cafelist.jsp";
	   }
	
	

}