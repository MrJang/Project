package yjc.spring.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import yjc.spring.bean.Board;
import yjc.spring.bean.Canvas;
import yjc.spring.bean.Designer;
//import yjc.spring.bean.Etc;
import yjc.spring.bean.Member;
import yjc.spring.bean.Purchase;
import yjc.spring.bean.Request;
import yjc.spring.bean.d_shop;
import yjc.spring.dao.IbatisBoardDao;
import yjc.spring.dao.IbatisCanvasDao;
import yjc.spring.dao.IbatisD_shop;
import yjc.spring.dao.IbatisDesignerDao;
import yjc.spring.dao.IbatisMemberDao;
import yjc.spring.dao.IbatisProductDao;
import yjc.spring.dao.IbatisPurchaseDao;
import yjc.spring.dao.IbatisRequestDao;
//import yjc.spring.service.MemberService;

//	@	: annotation
@Controller
@SessionAttributes({ "member", "board", "designer"})
public class MemberController {
	@Autowired
	private IbatisMemberDao dao;
	@Autowired
	private IbatisBoardDao bdao;
	@Autowired
	private IbatisDesignerDao ddao;
	@Autowired
	private IbatisD_shop dsdao;
	@Autowired
	private IbatisPurchaseDao psdao;
	@Autowired
	private IbatisProductDao prdao;
	@Autowired
	private IbatisCanvasDao cdao;
	@Autowired
	private IbatisRequestDao rdao;
	
	
//	@Autowired
//	MemberService memberService;
	
	@ModelAttribute("member")
    public Member getMemberObject() {
        return new Member();

    }
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		
		System.out.println("main_member : "+ member);
				
		Board b = new Board();
		model.addAttribute("board", b);
		Request request = new Request();
		model.addAttribute("request",request);
		session.setAttribute("request", request);
//		List<Board> sablist = bdao.selectAllBoard();
//		model.addAttribute("sablist", sablist);
//		session.setAttribute("sablist", sablist);
//		List<Board> saplist = bdao.selectAllPopular();
//		model.addAttribute("saplist", saplist);
//		session.setAttribute("saplist", saplist);
		
		List<Board> list3 = bdao.selectBoard3();
		model.addAttribute("list3", list3);
//		session.setAttribute("list3", list3);
		model.addAttribute("list3size", list3.size());
//		session.setAttribute("list3size", list3.size());
		
		List<Canvas> c_list = cdao.c_list();
		model.addAttribute("c_list", c_list);
		model.addAttribute("c_listsize", c_list.size());
		
		List<Member> ps_list = dao.ps_list();
		model.addAttribute("ps_list", ps_list);
		model.addAttribute("ps_listsize", ps_list.size());
		
		List<Request> r_list = rdao.r_list();
		model.addAttribute("r_list", r_list);
		model.addAttribute("r_listsize", r_list.size());
		
		if(session.getAttribute("member")==null||session.getAttribute("member").equals("1")){
			
		} else if(session.getAttribute("member")!=null) {
			if(member.getMem_auth()!=null){
				
				if(member.getMem_auth().equals("1")){
					int new_req_count = rdao.new_req_count(member.getMem_id());
					session.setAttribute("new_req_count", new_req_count);
					int modified_req_count1 = rdao.modified_req_count1(member.getMem_id());
					session.setAttribute("modified_req_count1", modified_req_count1);
					int modified_req_count2 = rdao.modified_req_count2(member.getMem_id());
					session.setAttribute("modified_req_count2", modified_req_count2);
					
				}else if(member.getMem_auth().equals("2")){
					int modified_req_count2 = rdao.modified_req_count2(member.getMem_id());
					session.setAttribute("modified_req_count2", modified_req_count2);
					
				}

				
			}
						
		}
		
		
		

		
		return "main";
	}
	
	
	

	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String main(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		model.addAttribute("member", member);
//		String url = member.getUrl();
		Member lm = dao.selectById(member.getMem_id());
		
		// System.out.println(m.getUrl());
		if (lm != null) {
			
			System.out.println("lm : " + lm.getMem_id());
			System.out.println("lm : " + lm.getMem_pw());
			System.out.println("member : " + member.getMem_id());
			System.out.println("member : " + member.getMem_pw());
			System.out.println(" lm : " + lm + " (아이디 일치) ");
			
			if (lm.getMem_pw().equals(member.getMem_pw())){
				System.out.println( lm + " (로그인 성공) ");
				model.addAttribute("member", lm);
				session.setAttribute("member", lm);
				
				int modified_req_count2 = rdao.modified_req_count2(lm.getMem_id());
				session.setAttribute("modified_req_count2", modified_req_count2);
				
			
				if(lm.getMem_auth().equals("1")){
					int cu_des_num = dsdao.findDes_num(lm.getMem_num());
					session.setAttribute("cu_des_num",cu_des_num);
					
					int new_req_count = rdao.new_req_count(lm.getMem_id());
					session.setAttribute("new_req_count", new_req_count);
					
					int modified_req_count1 = rdao.modified_req_count1(lm.getMem_id());
					session.setAttribute("modified_req_count1", modified_req_count1);
					
				}
				
				
				if(lm.getLast_login()!=null){
					String MM = lm.getLast_login().split(" ")[0];
					System.out.println("MM : "+MM);
					
					SimpleDateFormat dayTime2 = new SimpleDateFormat("yyyy-MM-dd");
					String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
					
					System.out.println("time2 : "+time2);
					if(MM.equals(time2)){
						SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String time = dayTime.format(new Date(System.currentTimeMillis()));
						lm.setLast_login(time);
						dao.logincheck_but(lm);
					}else{
						SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String time = dayTime.format(new Date(System.currentTimeMillis()));
						lm.setLast_login(time);
						dao.logincheck(lm);
					}
					
				}else{
					SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String time = dayTime.format(new Date(System.currentTimeMillis()));
					lm.setLast_login(time);
					dao.logincheck(lm);
					
				}
				
				List<Board> list3 = bdao.selectBoard3();
				model.addAttribute("list3", list3);
				model.addAttribute("list3size", list3.size());
				List<Canvas> c_list = cdao.c_list();
				model.addAttribute("c_list", c_list);
				model.addAttribute("c_listsize", c_list.size());
				List<Member> ps_list = dao.ps_list();
				model.addAttribute("ps_list", ps_list);
				model.addAttribute("ps_listsize", ps_list.size());
				List<Request> r_list = rdao.r_list();
				model.addAttribute("r_list", r_list);
				model.addAttribute("r_listsize", r_list.size());
				
				return "main";
				
			} else {
				logout(member,model,session);
			}
		} else {
			// ((SessionStatus) session).setComplete();
			logout(member,model,session);
		}
//		return "redirect:/spring" + m.getUrl();
//		return "redirect:/spring" + url;
		
		List<Board> list3 = bdao.selectBoard3();
		model.addAttribute("list3", list3);
		model.addAttribute("list3size", list3.size());
		List<Canvas> c_list = cdao.c_list();
		model.addAttribute("c_list", c_list);
		model.addAttribute("c_listsize", c_list.size());
		List<Member> ps_list = dao.ps_list();
		model.addAttribute("ps_list", ps_list);
		model.addAttribute("ps_listsize", ps_list.size());
		List<Request> r_list = rdao.r_list();
		model.addAttribute("r_list", r_list);
		model.addAttribute("r_listsize", r_list.size());
		return "main";
	}

//서비스 예시
//	// http://localhost:8080/INNO/spring/addMember
//	@RequestMapping(value = "/addMember", method = RequestMethod.GET)
//	public String addMember(Model model, HttpSession session) {
//		
//		boolean result = memberService.addMember(session,model);
//			
//		if (!result) return "reject";
//
//		return "addMember";
//	}
	
	
	// http://localhost:8080/INNO/spring/addMember
		@RequestMapping(value = "/addMember", method = RequestMethod.GET)
		public String addMemberForm(Model model, HttpSession session) {
//			int year = Calendar.getInstance().get(Calendar.YEAR);
//			int[] years = new int[200];
//			for (int i = year; i > year - 200; i--) {
//				years[year - i] = i;
//			}
//			model.addAttribute("years", years);
			Member member = new Member();
			member.setMem_gender("M");
			model.addAttribute("member", member);


			return "addMember";
		}
	

	@RequestMapping(value = "/addMember", method = RequestMethod.POST)
	public String addMember(@ModelAttribute("member") Member member, HttpServletRequest request, Model model, HttpSession session) {
		// Result result = new Result();
		// boolean flag = dao.isRegistered(id);
		// if(flag == true) {
		// result.setDuplicated(true);
		// } else {
		// result.setDuplicated(false);
		// }
		 String phone_1 = request.getParameter("phone_1");
		 String phone_2 = request.getParameter("phone_2");
		 String phone_3 = request.getParameter("phone_3");
		 member.setMem_phone(phone_1+"-"+phone_2+"-"+phone_3);
		 
		 String mail = request.getParameter("mail");
		 member.setMem_email(member.getMem_email()+"@"+mail);
		
		 String post1 = request.getParameter("post1");
		 String post2 = request.getParameter("post2");
		 member.setMem_post(post1+"-"+post2);

		 
			model.addAttribute("member", member);
		
			
			dao.insertMember(member);
			
			
//			Member mm = dao.selectById(m.getMem_id());
//			m.setMem_id(mm.getMem_id());
//			m.setMem_auth(mm.getMem_auth());
//			session.setAttribute("member", member);
			session.setAttribute("addedmember", member);

//			return "redirect:/spring/addMemberResult?id=" + m.getId();
			return "redirect:/spring/addMemberResult?mem_id=" + member.getMem_id();

	}

	@RequestMapping(value = "/addMemberResult", method = RequestMethod.GET)
	public String addMemberResult(@ModelAttribute("member") Member member, @RequestParam String mem_id, Model model, HttpSession session) {
		
		Member addedmember = (Member)session.getAttribute("addedmember");
		System.out.println("addmemberresult"+addedmember);
		
		if(member==null||addedmember==null){
			System.out.println(member);
			return "reject";
		}else if(member.getMem_id().equals(addedmember.getMem_id())) {
			return "addMemberResult";
		}
		return "reject";
	}

	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	// http://localhost:8080/SpringWeb/spring/updateMember?id=#
	public String updateMember(@RequestParam String mem_id, @ModelAttribute("member") Member member, Model model,
			HttpSession session) {

		member = (Member)session.getAttribute("member");
		System.out.println(member);
		if(member==null){
			System.out.println(member);
			return "reject";
		}else if((member.getMem_id().equals(mem_id)) || (member.getMem_auth().equals("0"))) {
//			int year = Calendar.getInstance().get(Calendar.YEAR);
//			int[] years = new int[200];
//			for (int i = year; i > year - 200; i--) {
//				years[year - i] = i;
//			}
		
			member = dao.selectById(mem_id);
			String phone_1 = member.getMem_phone().split("-")[0];member.setPhone_1(phone_1);
			String phone_2 = member.getMem_phone().split("-")[1];member.setPhone_2(phone_2);
			String phone_3 = member.getMem_phone().split("-")[2];member.setPhone_3(phone_3);
			
			String post1 = member.getMem_post().split("-")[0];member.setPost1(post1);
			String post2 = member.getMem_post().split("-")[1];member.setPost2(post2);
			
			
			Designer designer = new Designer();
			designer = ddao.selectAll_des_num(member.getMem_num());
			if(member.getMem_auth().equals("1")){
				if(designer.getDes_account()==null){
					String bank = "농협";member.setBank(bank);
					String account = "";member.setAccount(account);
				}else{
					String bank = designer.getDes_account().split("-")[0];member.setBank(bank);
					String account = designer.getDes_account().split("-")[1];member.setAccount(account);
				}
			}
			
			
			
			model.addAttribute("member", member);
//			model.addAttribute("years", years);
			System.out.println("GET messag " + member);
			
			return "updateMember";
		}
		return "reject";
	}

	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(@ModelAttribute("member") Member member, Model model, HttpServletRequest request, SessionStatus session)throws IllegalStateException, IOException {
		System.out.println(member.getMem_phone());
		 System.out.println("member : " + member);
		 MultipartFile mem_uploadfile = member.getMem_uploadfile(); 
//		 String fname = mem_uploadfile.getOriginalFilename(); 
		 
		 
		 
		 String phone_1 = request.getParameter("phone_1");
		 String phone_2 = request.getParameter("phone_2");
		 String phone_3 = request.getParameter("phone_3");
		 member.setMem_phone( phone_1 + "-" + phone_2 + "-" + phone_3 );
		 
		 String post1 = request.getParameter("post1");
		 String post2 = request.getParameter("post2");
		 member.setMem_post(post1+"-"+post2);
		 
		 
		 if (mem_uploadfile.getOriginalFilename().equals("")) {
		       
		 } else {
			   String fname = member.getMem_id()+".jpg";
			   
			   
		       member.setMem_img(fname);
		       
//			 1. FileOutputStream 사용
		         byte[] fileData = mem_uploadfile.getBytes();
		         FileOutputStream output1 = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/INNO/profile/" + fname);
		         FileOutputStream output = new FileOutputStream("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/profile/" + fname);
		         output.write(fileData);
		         output.close();
		         output1.write(fileData);
		         output1.close();
		         
	        // 2. transferTo 함수 사용
//		         mem_uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/profile/" + fname));
		    	 
		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/profile/"+fname);		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/profile/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/profile/sm_"+fname);
				 ImageIO.write(thumb,"png", fileObj);
//				 ImageIO.write(thumb,"png", fileObj1);
		  }

		dao.updateMemberById(member);
		
		if(member.getMem_auth().equals("1")){
			
			member.setAccount(member.getBank()+"-"+member.getAccount());
			
			ddao.update_account(member);
			
			int a = dao.ifDesigner(member);
			
			if(a==0){
				dao.promotion(member);
			}
			
			d_shop d_shop = new d_shop();
			
			int des_num = ddao.select_des_num(member.getMem_num());
			
			d_shop.setMem_id(member.getMem_id());
			d_shop.setDes_num(des_num);
			
			
			if(a==0){
				
				member.setDes_num(des_num);
				dsdao.insertLogo(member);	
			}
			
			
			
			
			
		}else if(member.getMem_auth().equals("2")){
			dao.demotion(member);
			dsdao.deleteBoardByNum(member.getMem_num());
		}
		model.addAttribute("member", member);
		System.out.println("POST " + member);
		return "redirect:/spring/getMember?id=" + member.getMem_id();
	}
	

	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(@RequestParam String mem_id, @ModelAttribute("member") Member member, HttpSession session) {
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		
		if(member==null){
			System.out.println(member);
			return "reject";
		
		}else if (member.getMem_id().equals(mem_id)||(member.getMem_auth().equals("0"))) {
			dao.deleteMemberById(mem_id);
			return "redirect:/spring/memberList";
		}
		return "reject";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	// http://localhost:8080/SpringWeb/spring/updateMember?id=#
	public String info(@RequestParam String id, Model model, @ModelAttribute("member") Member member, HttpSession session) {
		
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		
		if(member==null){
			
			System.out.println(member);
			return "reject";
			
		}else if ((member.getMem_id().equals(id)) || (member.getMem_auth().equals("0"))) {
			member = dao.selectById(id);
			model.addAttribute("member", member);
			
			System.out.println("GET messag " + member);;
			return "info";
		}
		return "reject";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public String info(@ModelAttribute("member") Member member, SessionStatus session) {
		return "";
	}
	
	@RequestMapping(value = "/p_info", method = RequestMethod.GET)
	public String p_info(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		System.out.println(member);
		int my_article1_count = bdao.my_article1_count(member);
		int my_article2_count = bdao.my_article2_count(member);
		
		int if_my_buy_count = psdao.if_my_buy_count(member.getMem_num());
		if(if_my_buy_count>0){
			int my_buy_count = psdao.my_buy_count(member.getMem_num());
			model.addAttribute("my_buy_count", my_buy_count);
			System.out.println("mbc : " + my_buy_count);
		}else{
			model.addAttribute("my_buy_count", 0);
		}
		
			
		int getlogincheck = dao.getlogincheck(member.getMem_num());
		model.addAttribute("getlogincheck", getlogincheck);
		
		int ifdesigner = dao.ifDesigner(member);
		if(ifdesigner!=0){
			
			
			int des_num = ddao.select_des_num(member.getMem_num());
	
			String des_introduce = ddao.getDes_introduce(des_num);
			model.addAttribute("des_introduce", des_introduce);
			
			int if_my_sell_count = psdao.if_my_sell_count(des_num);
			
			if(if_my_sell_count>0){
				int my_sell_count = psdao.my_sell_count(des_num);
				model.addAttribute("my_sell_count", my_sell_count);
				System.out.println("msc : " + my_sell_count);
			}else{
				model.addAttribute("my_sell_count", 0);
			}
			
			int if_my_request_count = rdao.if_my_request_count(member.getMem_id());
			
			if(if_my_request_count>0){
				int my_request_count = rdao.my_request_count(member.getMem_id());
				model.addAttribute("my_request_count", my_request_count);
				System.out.println("mrc : " + my_request_count);
			}else{
				model.addAttribute("my_request_count", 0);
			}
			
			int my_product_count = prdao.my_product_count(des_num);
			model.addAttribute("my_product_count", my_product_count);
		
		}
					
			
		
		model.addAttribute("my_article1_count", my_article1_count);
		model.addAttribute("my_article2_count", my_article2_count);
		
//		System.out.println("mac : " + my_article1_count);
		
		return "p_info";
	}
	
	@RequestMapping(value = "/p_info", method = RequestMethod.POST)
	public String p_info(@ModelAttribute("member") Member member, HttpServletRequest request, Model model, HttpSession session) {
		String des_introduce = request.getParameter("des_introduce");
		member.setDes_introduce(des_introduce);
		ddao.setDes_introduce(member);
		
		int my_article1_count = bdao.my_article1_count(member);
		int my_article2_count = bdao.my_article2_count(member);
		
		int if_my_buy_count = psdao.if_my_buy_count(member.getMem_num());
		if(if_my_buy_count>0){
			int my_buy_count = psdao.my_buy_count(member.getMem_num());
			model.addAttribute("my_buy_count", my_buy_count);
			System.out.println("mbc : " + my_buy_count);
		}else{
			model.addAttribute("my_buy_count", 0);
		}
		
			
		int getlogincheck = dao.getlogincheck(member.getMem_num());
		model.addAttribute("getlogincheck", getlogincheck);
		
		int ifdesigner = dao.ifDesigner(member);
		if(ifdesigner!=0){
			
			
			int des_num = ddao.select_des_num(member.getMem_num());
			
			
			
			int if_my_sell_count = psdao.if_my_sell_count(des_num);
			
			if(if_my_sell_count>0){
				int my_sell_count = psdao.my_sell_count(des_num);
				model.addAttribute("my_sell_count", my_sell_count);
				System.out.println("msc : " + my_sell_count);
			}else{
				model.addAttribute("my_sell_count", 0);
			}
			
			int if_my_request_count = rdao.if_my_request_count(member.getMem_id());
			
			if(if_my_request_count>0){
				int my_request_count = rdao.my_request_count(member.getMem_id());
				model.addAttribute("my_request_count", my_request_count);
				System.out.println("mrc : " + my_request_count);
			}else{
				model.addAttribute("my_request_count", 0);
			}
			
			int my_product_count = prdao.my_product_count(des_num);
			model.addAttribute("my_product_count", my_product_count);
		
		}
					
		model.addAttribute("my_article1_count", my_article1_count);
		model.addAttribute("my_article2_count", my_article2_count);
		
		return "p_info";
	}

	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(@ModelAttribute("member") Member member, Model model, HttpSession session) {	
		member = (Member)session.getAttribute("member");
		if(member==null){
			
			System.out.println(member);
			return "reject";
		
		}else if (member.getMem_auth().equals("0")) {
			List<Member> list = dao.selectAllMember();
			model.addAttribute("list", list);
			return "memberList";
		}
		return "reject";
	}

	@RequestMapping(value = "/memberList", method = RequestMethod.POST)
	public String memberList1(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		return "memberList";
	}

	@RequestMapping(value = "/getMember", method = RequestMethod.GET)
	public String getMember(@RequestParam String id, @ModelAttribute("member") Member member, Model model, HttpSession session) {
		member = (Member)session.getAttribute("member");
		System.out.println("gemMember : " + member);
	
		if(member==null){
			return "reject";
			
		}else if((member.getMem_id().equals(id)) || (member.getMem_auth().equals("0"))) {
			
		Member usermember = dao.selectById(id);
		model.addAttribute("usermember", usermember);
		model.addAttribute("member", member);
		if(usermember.getMem_auth().equals("1")){
			int des_num = ddao.select_des_num(usermember.getMem_num());
			//TODO 디자이너 정보보기에서 계좌번호 보이기
		}
			return "getMember";
		}
		return "reject";
	}
	
	@RequestMapping(value = "/getMember2", method = RequestMethod.GET)
	public String getMember2(@ModelAttribute("member") Member member, @RequestParam String id, Model model, HttpSession session) {
		member = (Member)session.getAttribute("member");
		System.out.println(member);
	
		if(member==null){
			return "reject";
			
		}else if (member.getMem_auth().equals("0")||member.getMem_auth().equals("1")||member.getMem_auth().equals("2")) {
			
		member = dao.selectById(id);
		model.addAttribute("member", member);
			return "getMember";
		}
		return "reject";
	}

//	@RequestMapping(value = "/getMember", method = RequestMethod.POST)
//	public String getMember(@RequestParam String id, Model model,
//			HttpSession session) {
//		Member m = dao.selectById(id);
//		model.addAttribute("member", m);
//		if (auth(session) == false) {
//			return "reject";
//		}
//		session.setAttribute("u_authority", m.getAuthority());
//		return "getMember";
//	}
	//TODO logout
	@RequestMapping(value = "/logout")
	public String logout(@ModelAttribute("member") Member member,Model model, HttpSession session) {
		Member blank_member = new Member();
//		session.invalidate();
		session.setAttribute("member", 1);
		
		member = blank_member;
//		member.setMem_auth(null);
//		member.setAccount(account);
//		member.setBank(bank);
//		member.setDes_introduce(des_introduce);
//		member.setDes_num(des_num);
//		member.setDsh_back(dsh_back);
//		member.setDsh_logo(dsh_logo);
//		member.
		model.addAttribute("member", member);
//		session.setAttribute("member", member);
//		member.setMem_num(0);
		
		
		return "redirect:/spring/main";
//		return "main";
	}
	
	@RequestMapping(value = "/select_achivement", method = RequestMethod.GET)
	public String select_achivement(@RequestParam int ach_num, @ModelAttribute("member") Member member,Model model, HttpSession session) {
		int my_article1_count = bdao.my_article1_count(member);
		int my_article2_count = bdao.my_article2_count(member);
		System.out.println("ach_num :"+ach_num);
		int if_my_buy_count = psdao.if_my_buy_count(member.getMem_num());
		if(if_my_buy_count>0){
			int my_buy_count = psdao.my_buy_count(member.getMem_num());
			model.addAttribute("my_buy_count", my_buy_count);
			System.out.println("mbc : " + my_buy_count);
		}else{
			model.addAttribute("my_buy_count", 0);
		}
		
			
		int getlogincheck = dao.getlogincheck(member.getMem_num());
		model.addAttribute("getlogincheck", getlogincheck);
		
		int ifdesigner = dao.ifDesigner(member);
		if(ifdesigner!=0){
			int des_num = ddao.select_des_num(member.getMem_num());
			
			int if_my_sell_count = psdao.if_my_sell_count(des_num);
			if(if_my_sell_count>0){
				int my_sell_count = psdao.my_sell_count(des_num);
				model.addAttribute("my_sell_count", my_sell_count);
				System.out.println("msc : " + my_sell_count);
			}else{
				model.addAttribute("my_sell_count", 0);
			}
			
			
			int my_product_count = prdao.my_product_count(des_num);
			
			model.addAttribute("my_product_count", my_product_count);
			
		}
				
			System.out.println("mac : " + my_article1_count);
		
		model.addAttribute("my_article1_count", my_article1_count);
		model.addAttribute("my_article2_count", my_article2_count);
		
		if(ach_num==1){
			model.addAttribute("ach_val", getlogincheck);
		}

		return "select_achivement";
	}
	
	@RequestMapping(value = "/app_main", method = RequestMethod.GET)
	   public String app_main( Model model, HttpSession session) {
	      
//	      @ModelAttribute("member") Member member,
	      
	      Member member = new Member();
	      Member m = (Member)session.getAttribute("member");
	      if(m!=null){
	      if(m.getMem_num()==0){
	         
	      }else{
	         member = (Member)session.getAttribute("member");
	      }
	      }
	      model.addAttribute("member", member);
	      
	      
	      
	      System.out.println("main_member : "+ member);
	      
	      Board b = new Board();
	      model.addAttribute("board", b);
	      List<Board> sablist = bdao.selectAllBoard();
	      model.addAttribute("sablist", sablist);
	      session.setAttribute("sablist", sablist);
	      List<Board> saplist = bdao.selectAllPopular();
	      model.addAttribute("saplist", saplist);
	      session.setAttribute("saplist", saplist);
	      
	      return "app_main";
	   }
	   @RequestMapping(value = "/app_main", method = RequestMethod.POST)
	   public String app_main(@ModelAttribute("member") Member member, HttpSession session, Model model) {
	      model.addAttribute("member", member);
	      String url = member.getUrl();
	      Member lm = dao.selectById(member.getMem_id());
	      
	      // System.out.println(m.getUrl());
	      if (lm != null) {
	         
	         System.out.println("lm : " + lm.getMem_id());
	         System.out.println("lm : " + lm.getMem_pw());
	         System.out.println("member : " + member.getMem_id());
	         System.out.println("member : " + member.getMem_pw());
	         
	         System.out.println(" lm : " + lm + " (아이디 일치) ");
	         if (lm.getMem_pw().equals(member.getMem_pw())){
	            model.addAttribute("member", lm);
	            session.setAttribute("member", lm);
	            
	            if(lm.getLast_login()!=null){
	               String MM = lm.getLast_login().split(" ")[0];
	               System.out.println("MM : "+MM);
	               
	               SimpleDateFormat dayTime2 = new SimpleDateFormat("yyyy-MM-dd");
	               String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
	               
	               System.out.println("time2 : "+time2);
	               if(MM.equals(time2)){
	                  SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                  String time = dayTime.format(new Date(System.currentTimeMillis()));
	                  lm.setLast_login(time);
	                  dao.logincheck_but(lm);
	               }else{
	                  SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                  String time = dayTime.format(new Date(System.currentTimeMillis()));
	                  lm.setLast_login(time);
	                  dao.logincheck(lm);
	               }
	               
	            }else{
	               SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	               String time = dayTime.format(new Date(System.currentTimeMillis()));
	               lm.setLast_login(time);
	               dao.logincheck(lm);
	               
	            }
	            System.out.println("1: "+member);
	    		int my_article1_count = bdao.my_article1_count(member);
	    		int my_article2_count = bdao.my_article2_count(member);
	    		
	    		int if_my_buy_count = psdao.if_my_buy_count(member.getMem_num());
	    		System.out.println("2: "+ if_my_buy_count);
	    		if(if_my_buy_count>0){
	    			int my_buy_count = psdao.my_buy_count(member.getMem_num());
	    			model.addAttribute("my_buy_count", my_buy_count);
	    			System.out.println("mbc : " + my_buy_count);
	    		}else{
	    			model.addAttribute("my_buy_count", 0);
	    		}
	    		int ifdesigner = dao.ifDesigner(member);
	    		if(ifdesigner!=0){
	    			int des_num = ddao.select_des_num(member.getMem_num());
	    			
	    			int if_my_sell_count = psdao.if_my_sell_count(des_num);
	    			
	    			if(if_my_sell_count>0){
	    				int my_sell_count = psdao.my_sell_count(des_num);
	    				model.addAttribute("my_sell_count", my_sell_count);
	    				System.out.println("msc : " + my_sell_count);
	    			}else{
	    				model.addAttribute("my_sell_count", 0);
	    			}
	    			
	    			int if_my_request_count = rdao.if_my_request_count(member.getMem_id());
	    			
	    			if(if_my_request_count>0){
	    				int my_request_count = rdao.my_request_count(member.getMem_id());
	    				model.addAttribute("my_request_count", my_request_count);
	    				System.out.println("mrc : " + my_request_count);
	    			}else{
	    				model.addAttribute("my_request_count", 0);
	    			}
	    			int my_product_count = prdao.my_product_count(des_num);
	    			model.addAttribute("my_product_count", my_product_count);
	    		}
	    		int my_articleAll_count = my_article1_count + my_article2_count;
	    		model.addAttribute("my_articleAll_count", my_articleAll_count);
	    		
	    		System.out.println(lm.getMem_num());
	    		int getlogincheck = dao.getlogincheck(lm.getMem_num());
	    		model.addAttribute("getlogincheck", getlogincheck);
	            
	            return "app_main";
	            
	         } else {logout(member,model,session);}
	      } else {
	         // ((SessionStatus) session).setComplete();
	         logout(member,model,session);
	      }
//	      return "redirect:/spring" + m.getUrl();
	      return "redirect:/spring" + url;
	   }
	   @RequestMapping(value = "/app_logout", method = RequestMethod.GET)
	   public String app_logout(@ModelAttribute("member") Member member,Model model, HttpSession session) {
	      session.invalidate();
	      member.setMem_id(null);
	      member.setMem_num(0);
	      
	      return "redirect:/spring/app_main";
	   }
	

	
	
	
	
//	@RequestMapping(value = "/getArticle", method = RequestMethod.GET)
//	String getArticleForm(@RequestParam int num, int pageNum, Model model, HttpSession session) {
//		return "getArticle";
//	}

}
