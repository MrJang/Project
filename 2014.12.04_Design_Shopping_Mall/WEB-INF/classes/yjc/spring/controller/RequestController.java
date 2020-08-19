package yjc.spring.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import yjc.spring.bean.Board;
import yjc.spring.bean.Canvas;
import yjc.spring.bean.Member;
import yjc.spring.bean.Request;
import yjc.spring.dao.IbatisBoardDao;
import yjc.spring.dao.IbatisCanvasDao;
import yjc.spring.dao.IbatisDesignerDao;
import yjc.spring.dao.IbatisProductDao;
import yjc.spring.dao.IbatisPurchaseDao;
import yjc.spring.dao.IbatisRequestDao;
import yjc.spring.dao.IbatisMemberDao;











import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;




@Controller
@SessionAttributes({"member","request","canvas"})
@Transactional
public class RequestController implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private IbatisRequestDao rdao;
	@Autowired
	private IbatisMemberDao dao;
	@Autowired
	private IbatisCanvasDao cdao;
	@Autowired
	private IbatisBoardDao bdao;
	@Autowired
	private IbatisPurchaseDao psdao;
	@Autowired
	private IbatisDesignerDao ddao;
	@Autowired
	private IbatisProductDao prdao;
	
	
	// TODO
	
	
	@RequestMapping(value = "/req_main", method = RequestMethod.GET)
	public String req_main(@RequestParam String selected_designer, HttpSession session, Model model) {
		Member member = new Member();
		
		member = (Member)session.getAttribute("member");
		if(member.getMem_id()==null){return "req_reject";}
		
		Request request = new Request();
		model.addAttribute("request",request);
		model.addAttribute("member",member);
		
		
		 
		if ((member.getMem_auth().equals("0")||member.getMem_auth().equals("1")||member.getMem_auth().equals("2"))) {
			
			
			List<Member> list = dao.selectAllDesigner();
			model.addAttribute("list", list);
			
			
			
			if(selected_designer.equals("none")){
				
			}else{
				Member ds_id = dao.selectById(selected_designer);
				int my_article1_count = bdao.my_article1_count(ds_id);
				int my_article2_count = bdao.my_article2_count(ds_id);
				
				int if_my_buy_count = psdao.if_my_buy_count(ds_id.getMem_num());
				if(if_my_buy_count>0){
					int my_buy_count = psdao.my_buy_count(ds_id.getMem_num());
					model.addAttribute("my_buy_count", my_buy_count);
					System.out.println("mbc : " + my_buy_count);
				}else{
					model.addAttribute("my_buy_count", 0);
				}
				
					
				int getlogincheck = dao.getlogincheck(ds_id.getMem_num());
				model.addAttribute("getlogincheck", getlogincheck);
				
				int ifdesigner = dao.ifDesigner(ds_id);
				if(ifdesigner!=0){
					int des_num = ddao.select_des_num(ds_id.getMem_num());
					model.addAttribute("des_num",des_num);
					String des_introduce = ddao.getDes_introduce(des_num);
					System.out.println("des_intro"+des_introduce);
					model.addAttribute("des_introduce", des_introduce);
					
					
					int if_my_sell_count = psdao.if_my_sell_count(des_num);
					
					if(if_my_sell_count>0){
						int my_sell_count = psdao.my_sell_count(des_num);
						model.addAttribute("my_sell_count", my_sell_count);
						System.out.println("msc : " + my_sell_count);
					}else{
						model.addAttribute("my_sell_count", 0);
					}
					
					int if_my_request_count = rdao.if_my_request_count(ds_id.getMem_id());
					
					if(if_my_request_count>0){
						int my_request_count = rdao.my_request_count(ds_id.getMem_id());
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
			}
			
			
			
			return "req_main";
		}
			return "reject";
		
	}
	
	@RequestMapping(value = "/req_main", method = RequestMethod.POST)
	public String req_main(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";} 			
		
		System.out.println(request);
		
		
		

		if (member.getMem_auth().equals("0")||member.getMem_auth().equals("1")||member.getMem_auth().equals("2")) {
				
				
				model.addAttribute("request",request);
				
				if(request.getReq_receiver().equals("none")){
					return "redirect:/spring/req_main?selected_designer=none";
				}
				
			System.out.println("req_main_post : " + request);
			
			return "redirect:/spring/req_1?selected_designer="+request.getReq_receiver();
		}
			return "reject";
		
	}
	
	@RequestMapping(value = "/req_1", method = RequestMethod.GET)
	public String req_1(@RequestParam String selected_designer, @ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model, HttpServletRequest reqq) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		if(request.getReq_receiver()==null){
			return "redirect:/spring/req_main?selected_designer=none";
		}
		System.out.println("req_receiver"+request.getReq_receiver());
		System.out.println("req_1 :" + request);
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		

		model.addAttribute("request", request);
		model.addAttribute("member", member);
		return "req_1";
	}
	
	@RequestMapping(value = "/req_1", method = RequestMethod.POST)
	public String req_1(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, Model model, HttpSession session)throws IllegalStateException, IOException {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(request);
 
			
			 String fname=request.getUploadimg();
			 if (fname==null||fname.equals("")) {
				 request.setReq_img("null.jpg");
			 }else{
				 request.setReq_img(fname);
			 }
			 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
		request.setReq_date(time);
		request.setReq_content(request.getReq_content());
		request.setReq_name(request.getReq_name());
		if(request.getReq_category().equals("1")||request.getReq_category().equals("2")){
			request.setReq_category(request.getReq_category());
		}else{
			request.setReq_category("3");
		}
		
		request.setReq_price(0);
		request.setReq_sender(member.getMem_id());
		
		rdao.insertRequest(request);
		
		
		
//		GCMServerSide s = new GCMServerSide();
//
//		s.sendMessage();
		
		
		
		
		return "redirect:/spring/req_2";
	}
	
	@RequestMapping(value = "/req_2", method = RequestMethod.GET)
	public String req_2(HttpSession session) {
		return "req_2";
	}
	
	@RequestMapping(value = "/req_list", method = RequestMethod.GET)
	public String req_list(@RequestParam int pageNum, @ModelAttribute("request") Request request, @ModelAttribute("member") Member member, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		model.addAttribute("request", request);
		model.addAttribute("member", member);
		List<Request> list = rdao.selectAllRequest_sender(member.getMem_id());
		model.addAttribute("list", list);
		model.addAttribute("listsize", list.size());
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());

		return "req_list";
	}
	
	@RequestMapping(value = "/req_receive", method = RequestMethod.GET)
	public String req_receive(@RequestParam int pageNum, @ModelAttribute("member") Member member, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		Request request = new Request();
		model.addAttribute("request", request);
		
		List<Request> list = rdao.selectAllRequest_receiver(member.getMem_id());
//		System.out.println(list);
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		return "req_receive";
	}
	
	@RequestMapping(value = "/req_info", method = RequestMethod.GET)
	public String req_info(@ModelAttribute("member") Member member, @RequestParam String sender, @RequestParam String req_num, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(sender);
		System.out.println(req_num);
			
		request = rdao.getreq(Integer.parseInt(req_num));
		
		if(request.getReq_content()!=null){
			String content = request.getReq_content();
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setReq_content(content);
			
		}
		if(request.getReq_process()==0){
			request.setReq_process(1);
			rdao.req_process_update(request);
		}
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		
//		Request commission = new Request();
//		List<Request> com_list = rdao.selectMyCommission(member.getMem_id());
//		model.addAttribute("com_list", com_list);
//		session.setAttribute("com_list", com_list);
//		session.setAttribute("com_listsize", com_list.size());
//		model.addAttribute("com_listsize", com_list.size());
//		model.addAttribute("commission", commission);
		
		model.addAttribute("member",member);
		model.addAttribute("request",request);
		
		rdao.set_sender_mod_0(request.getReq_num());
	
		return "req_info";
	}
	
	@RequestMapping(value = "/req_info", method = RequestMethod.POST)
	public String req_info(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(request.getFeedback());
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
//		request.setReq_img(request.getUploadimg());
		request.setFeedback_date(time);
//		if(request.getReq_category().equals("1")){
//			String realfilename = request.getReq_img().substring(10);
//			System.out.println("realfilename : "+realfilename);
//			request.setReq_img(request.getUploadimg());
//		}else if(request.getReq_category().equals("2")){
//			request.setReq_img(request.getUploadimg());
//		}
			
//		request.setReq_category("2");
		
		rdao.feedbackupdate(request);
		rdao.set_receiver_mod_1(request.getReq_num());
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
	
		return "req_info";
	}
	
	@RequestMapping(value = "/my_req_info", method = RequestMethod.GET)
	public String my_req_info(@ModelAttribute("member") Member member, @RequestParam String receiver, @RequestParam String req_num, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(receiver);
		System.out.println(req_num);
		Member req_receiver = dao.selectById(receiver);
		int des_num = ddao.select_des_num(req_receiver.getMem_num());
			
		request = rdao.getreq(Integer.parseInt(req_num));
			
		if(request.getFeedback()!=null){
			String content = request.getFeedback();
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setFeedback(content);
		}else{
			String content = "";
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setFeedback(content);
			
		}
		
		
		
		model.addAttribute("member",member);
		model.addAttribute("request",request);
		model.addAttribute("req_receiver_des_num", des_num);
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		
		rdao.set_receiver_mod_0(request.getReq_num());
	
		return "my_req_info";
	}
	
	@RequestMapping(value = "/my_req_info", method = RequestMethod.POST)
	public String my_req_info(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		
		System.out.println(request.getReq_content());
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
		request.setReq_content_date(time);
		
		request.setFeedback_date(time);
//		request.setReq_img(request.getUploadimg());
//		request.setReq_category("2");
		
		
		rdao.req_process_update(request);
		rdao.req_content_update(request);
		Member req_receiver = dao.selectById(request.getReq_receiver());
		int des_num = ddao.select_des_num(req_receiver.getMem_num());
		
		model.addAttribute("request", request);
		model.addAttribute("member", member);
		model.addAttribute("req_receiver_des_num", des_num);
		
		rdao.set_sender_mod_1(request.getReq_num());
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		
		return "my_req_info";
	}
	
	@RequestMapping(value = "/req_Dmain", method = RequestMethod.GET)
	public String req_Dmain(@RequestParam int bod_num, @RequestParam String selected_designer, HttpSession session, Model model) {
		Member member = new Member();
		
		member = (Member)session.getAttribute("member");
		if(member.getMem_id()==null){return "req_reject";}
		
		Request request = new Request();
		model.addAttribute("request",request);
		model.addAttribute("member",member);
		
		Board b = bdao.selectByNum(bod_num);
		
		 
		if ((member.getMem_auth().equals("0")||member.getMem_auth().equals("1")||member.getMem_auth().equals("2"))&&(b.getMem_id().equals(selected_designer))) {
			
			Board board = bdao.selectByNum(bod_num);
			model.addAttribute("board",board);
			
			
			if(selected_designer.equals("none")){
				
			}else{
				Member ds_id = dao.selectById(selected_designer);
				int my_article1_count = bdao.my_article1_count(ds_id);
				int my_article2_count = bdao.my_article2_count(ds_id);
				
				int if_my_buy_count = psdao.if_my_buy_count(ds_id.getMem_num());
				if(if_my_buy_count>0){
					int my_buy_count = psdao.my_buy_count(ds_id.getMem_num());
					model.addAttribute("my_buy_count", my_buy_count);
					System.out.println("mbc : " + my_buy_count);
				}else{
					model.addAttribute("my_buy_count", 0);
				}
				
					
				int getlogincheck = dao.getlogincheck(ds_id.getMem_num());
				model.addAttribute("getlogincheck", getlogincheck);
				
				int ifdesigner = dao.ifDesigner(ds_id);
				if(ifdesigner!=0){
					int des_num = ddao.select_des_num(ds_id.getMem_num());
					model.addAttribute("des_num",des_num);
					String des_introduce = ddao.getDes_introduce(des_num);
					System.out.println("des_intro"+des_introduce);
					model.addAttribute("des_introduce", des_introduce);
					
					
					int if_my_sell_count = psdao.if_my_sell_count(des_num);
					
					if(if_my_sell_count>0){
						int my_sell_count = psdao.my_sell_count(des_num);
						model.addAttribute("my_sell_count", my_sell_count);
						System.out.println("msc : " + my_sell_count);
					}else{
						model.addAttribute("my_sell_count", 0);
					}
					
					int if_my_request_count = rdao.if_my_request_count(ds_id.getMem_id());
					
					if(if_my_request_count>0){
						int my_request_count = rdao.my_request_count(ds_id.getMem_id());
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
			}
			
			
			
			return "req_Dmain";
		}
			return "reject";
		
	}
	
	@RequestMapping(value = "/req_Dmain", method = RequestMethod.POST)
	public String req_Dmain(HttpServletRequest reqq,  @ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";} 			
		
		System.out.println(request);
		
//		String bod_img = reqq.getParameter("bod_img");
		int bod_num = Integer.parseInt(reqq.getParameter("bod_num"));
		Board b = bdao.selectByNum((bod_num));
		
		

		if (member.getMem_auth().equals("0")||member.getMem_auth().equals("1")||member.getMem_auth().equals("2")&&(b.getMem_id().equals(request.getReq_receiver()))) {
				
				
				model.addAttribute("request",request);
				
				if(request.getReq_receiver().equals("none")){
					return "redirect:/spring/req_main?selected_designer=none";
				}
				
			System.out.println("req_main_post : " + request);
			
			return "redirect:/spring/req_D1?selected_designer="+request.getReq_receiver()+"&bod_num="+reqq.getParameter("bod_num");
		}
			return "reject";
		
	}
	
	
	
	@RequestMapping(value = "/req_D1", method = RequestMethod.GET)
	public String req_D1(@RequestParam String selected_designer, @RequestParam int bod_num, @ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model, HttpServletRequest reqq) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		if(request.getReq_receiver()==null){
			return "redirect:/spring/req_main?selected_designer=none";
		}
		System.out.println("req_1 :" + request);
		
		
		Board board = bdao.selectByNum(bod_num);
		model.addAttribute("board",board);
		model.addAttribute("request", request);
		model.addAttribute("member", member);
		return "req_D1";
	}
	
	@RequestMapping(value = "/req_D1", method = RequestMethod.POST)
	public String req_D1(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, Model model, HttpSession session)throws IllegalStateException, IOException {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(request);
			
		String fname=request.getUploadimg();
		System.out.println(fname);	 
		request.setReq_img(fname);
			
			 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
		request.setReq_date(time);
		request.setReq_content(request.getReq_content());
		request.setReq_name(request.getReq_name());
		if(request.getReq_category().equals("1")||request.getReq_category().equals("2")){
			request.setReq_category(request.getReq_category());
		}else{
			request.setReq_category("3");
		}
		request.setReq_sender(member.getMem_id());
		
		rdao.insertRequest(request);
		
		
		
//		GCMServerSide s = new GCMServerSide();
//
//		s.sendMessage();
		
		
		
		
		return "redirect:/spring/req_D2";
//		return "req_2";
	}
	
	@RequestMapping(value = "/req_D2", method = RequestMethod.GET)
	public String req_D2(HttpSession session) {
		return "req_D2";
	}
	
	@RequestMapping(value = "/req_Dlist", method = RequestMethod.GET)
	public String req_Dlist(@RequestParam int pageNum, @ModelAttribute("request") Request request, @ModelAttribute("member") Member member, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		model.addAttribute("request", request);
		model.addAttribute("member", member);
		List<Request> list = rdao.selectAllRequest_sender(member.getMem_id());
		model.addAttribute("list", list);
		session.setAttribute("listsize", list.size());
		session.setAttribute("req_menu", "1");
//		model.addAttribute("listsize", list.size());
//		session.setAttribute("list", list);

		return "req_Dlist";
	}
	
	@RequestMapping(value = "/req_Dreceive", method = RequestMethod.GET)
	public String req_Dreceive(@RequestParam int pageNum, @ModelAttribute("member") Member member, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		Request request = new Request();
		model.addAttribute("request", request);
		
		List<Request> list = rdao.selectAllRequest_receiver(member.getMem_id());
		model.addAttribute("list", list);
		session.setAttribute("listsize", list.size());
		session.setAttribute("req_menu", "2");
//		session.setAttribute("list", list);
//		model.addAttribute("listsize", list.size());
		return "req_Dreceive";
	}
	
	@RequestMapping(value = "/req_Dinfo", method = RequestMethod.GET)
	public String req_Dinfo(@ModelAttribute("member") Member member, @RequestParam String sender, @RequestParam String req_num, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(sender);
		System.out.println(req_num);
			
		request = rdao.getreq(Integer.parseInt(req_num));
		
		if(request.getReq_content()!=null){
			String content = request.getReq_content();
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setReq_content(content);
		}else{
			String content = "";
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setReq_content(content);
		}
		if(request.getFeedback()!=null){
			String content = request.getFeedback();
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setFeedback(content);
		}else{
			String content = "";
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setFeedback(content);
		}
		
		if(request.getReq_process()==0){
			request.setReq_process(1);
			rdao.req_process_update(request);
		}
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		
//		Request commission = new Request();
//		List<Request> com_list = rdao.selectMyCommission(member.getMem_id());
//		model.addAttribute("com_list", com_list);
//		session.setAttribute("com_list", com_list);
//		session.setAttribute("com_listsize", com_list.size());
//		model.addAttribute("com_listsize", com_list.size());
//		model.addAttribute("commission", commission);
		
		model.addAttribute("member",member);
		model.addAttribute("request",request);
		
		rdao.set_sender_mod_0(request.getReq_num());
	
		return "req_Dinfo";
	}
	
	@RequestMapping(value = "/req_Dinfo", method = RequestMethod.POST)
	public String req_Dinfo(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model, HttpServletRequest req) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(request.getFeedback());
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
		request.setFeedback_date(time);
		String fdb = request.getFeedback();
		String fdb_1 = req.getParameter("feedback_1");
		fdb_1="\r\n\r\n"+fdb_1;
		System.out.println(fdb);
		System.out.println(fdb_1);
		request.setFeedback(fdb+fdb_1);

		
		rdao.feedbackupdate(request);
		rdao.set_receiver_mod_1(request.getReq_num());
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
	
		return "redirect:/spring/req_Dinfo?sender="+request.getReq_sender()+"&req_num="+request.getReq_num();
	}
	
	@RequestMapping(value = "/my_req_Dinfo", method = RequestMethod.GET)
	public String my_req_Dinfo(@ModelAttribute("member") Member member, @RequestParam String receiver, @RequestParam String req_num, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println(receiver);
		System.out.println(req_num);
		Member req_receiver = dao.selectById(receiver);
		int des_num = ddao.select_des_num(req_receiver.getMem_num());
			
		request = rdao.getreq(Integer.parseInt(req_num));
			
		if(request.getFeedback()!=null){
			String content = request.getFeedback();
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setFeedback(content);
		}else{
			String content = "";
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setFeedback(content);
		}
		if(request.getReq_content()!=null){
			String content = request.getReq_content();
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setReq_content(content);
		}else{
			String content = "";
			content = content.replaceAll("\r\n", "<br>");       // ÁÙ¹Ù²Þ Ã³¸®
			content = content.replaceAll("\u0020", "&nbsp;");
			request.setReq_content(content);
		}
		
		
		
		model.addAttribute("member",member);
		model.addAttribute("request",request);
		model.addAttribute("req_receiver_des_num", des_num);
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		
		rdao.set_receiver_mod_0(request.getReq_num());
	
		return "my_req_Dinfo";
	}
	
	@RequestMapping(value = "/my_req_Dinfo", method = RequestMethod.POST)
	public String my_req_Dinfo(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model, HttpServletRequest req) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		
		System.out.println(request.getReq_content());
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
		request.setReq_content_date(time);
		
		String rc = request.getReq_content();
		String rc_1 = req.getParameter("req_content_1");
		rc_1="\r\n\r\n"+rc_1;
		System.out.println(rc);
		System.out.println(rc_1);
		request.setReq_content(rc+rc_1);

		
		
		rdao.req_process_update(request);
		rdao.req_content_update(request);
		Member req_receiver = dao.selectById(request.getReq_receiver());
		int des_num = ddao.select_des_num(req_receiver.getMem_num());
		
		model.addAttribute("request", request);
		model.addAttribute("member", member);
		model.addAttribute("req_receiver_des_num", des_num);
		
		rdao.set_sender_mod_1(request.getReq_num());
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		
		return "redirect:/spring/my_req_Dinfo?receiver="+request.getReq_receiver()+"&req_num="+request.getReq_num();
	}

	
	
	
	
	
	
	@RequestMapping(value = "/req_content_update", method = RequestMethod.GET)
	public String req_content_update(@ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		
		System.out.println(request.getReq_content());
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
		request.setReq_content_date(time);
		
		rdao.req_content_update(request);
		
		model.addAttribute("request", request);
		model.addAttribute("member", member);
		
		return "my_req_info";
	}
	
	
	
	
	

	
	
	

	
	
	@RequestMapping(value = "/req_del", method = RequestMethod.GET)
	public String req_del(@RequestParam String req_num, @ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println("req_num :"+req_num);
		System.out.println("req_del : "+request);
		System.out.println(member);
		System.out.println(member.getMem_id());
		
		int req_check = rdao.check_req(member.getMem_id());
		if(req_check>0){
			System.out.println("auth true");
			rdao.del_req(req_num);
		}else{
			System.out.println("auth false");
		}
		
		
		return "redirect:/spring/req_list?pageNum=1";
	}
	
	@RequestMapping(value = "/req_del1", method = RequestMethod.GET)
	public String req_del1(@RequestParam String req_num, @ModelAttribute("member") Member member, @ModelAttribute("request") Request request, HttpSession session) {
		
		member = (Member)session.getAttribute("member");
		if(member==null){return "reject";}
		
		System.out.println("req_num :"+req_num);
		System.out.println("req_del : "+request);
		System.out.println(member);
		System.out.println(member.getMem_id());
		
		int req_check = rdao.check_req1(member.getMem_id());
		if(req_check>0){
			System.out.println("auth true");
			rdao.del_req(req_num);
		}else{
			System.out.println("auth false");
		}
		
		
		return "redirect:/spring/req_receive?pageNum=1";
	}
	
	@RequestMapping(value = "/req_alert", method = RequestMethod.GET)
	public void req_alert() {
		
		System.out.println("req_alert");
	
	}
	
	
	
	
	
	
//	public class GCMServerSide {
//
//		public void sendMessage() throws IOException {
//			
//			String title = "DMarket";
//			String sub = "°í°´À¸·ÎºÎÅÍ ÀÇ·Ú¿äÃ»ÀÌ µé¾î¿Ô½À´Ï´Ù.";
//
//			Sender sender = new Sender("AIzaSyDA5OlUIV_GD7xZuIupEeYvc5clCjzm1YU");
//			String regId = "APA91bH0Zor_W9GYZkY0aYLPdwhe6h7Vnr75WJHD-LDhHq_CvguFPgTnBFNkV42FAlJNc9R-YVWX4bRFCEUlV4OdfdQEEscRDv42XQZcznL4FQYLnQZhX_fmY7EBvXMDLN11pDCT8N6xfnP17cVnl32Hs62ReYc5nQ";
//
//			Message message = new Message.Builder()
//			.addData("title", URLEncoder.encode(title, "euc-kr"))
//	        .addData("msg", URLEncoder.encode(sub, "euc-kr"))
//	        .build();
//
//			List<String> list = new ArrayList<String>();
//
//			list.add(regId);
//
//			MulticastResult multiResult = sender.send(message, list, 5);
//
//			if (multiResult != null) {
//
//				List<Result> resultList = multiResult.getResults();
//
//				for (Result result : resultList) {
//
//					System.out.println(result.getMessageId());
//
//				}
//			}
//		}
//	}	
	
	
}