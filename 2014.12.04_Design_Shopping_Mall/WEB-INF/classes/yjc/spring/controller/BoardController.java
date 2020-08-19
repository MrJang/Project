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
import yjc.spring.dao.IbatisBoardDao;
import yjc.spring.dao.IbatisCanvasDao;
import yjc.spring.dao.IbatisMemberDao;

@Controller
@SessionAttributes({"board","member"})
@Transactional
public class BoardController implements Serializable {
	
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private IbatisBoardDao  bdao;
	@Autowired
	private IbatisMemberDao dao;
	@Autowired
	private IbatisCanvasDao cdao;
	
	@RequestMapping(value = "/reject")
	public String reject() {
		return "reject";
	}
	
	// http://localhost:8080/INNO/spring/main
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public String main(Model model, HttpSession session) {
//		Member member = new Member();
//		model.addAttribute("member", member);
//		Board b = new Board();
//		model.addAttribute("board", b);
//		List<Board> sablist = bdao.selectAllBoard();
//		System.out.println("sablist : "+ sablist);
//		model.addAttribute("sablist", sablist);
//		session.setAttribute("sablist", sablist);
//		List<Board> saplist = bdao.selectAllPopular();
//		System.out.println("saplist : "+ saplist);
//		model.addAttribute("saplist", saplist);
//		session.setAttribute("saplist", saplist);
//		
//		return "main";
//	}
	
	// http://localhost:8080/INNO/spring/m_main
		@RequestMapping(value = "/m_main", method = RequestMethod.GET)
		public String m_main(Model model, HttpSession session) {
			Member member = new Member();
			model.addAttribute("member", member);
			Board board = new Board();
			model.addAttribute("board", board);
			List<Board> sablist = bdao.selectAllBoard();
			System.out.println("sablist : "+ sablist);
			model.addAttribute("sablist", sablist);
			session.setAttribute("sablist", sablist);
			List<Board> saplist = bdao.selectAllPopular();
			System.out.println("saplist : "+ saplist);
			model.addAttribute("saplist", saplist);
			session.setAttribute("saplist", saplist);
			
			return "m_main";
		}
		
		@RequestMapping(value = {"board1","board2"}, method = RequestMethod.POST)
		String main(@ModelAttribute ("member") Member member, HttpSession session, HttpServletRequest  req) {
			return "";
		}
	
	//TODO insertArticle1
	@RequestMapping(value = "/insertArticle1", method = RequestMethod.GET)
	public String insertArticle1(@RequestParam int pageNum, @ModelAttribute("member") Member member, Model model, HttpSession session) {
		Board board = new Board();
		member = (Member)session.getAttribute("member");
		System.out.println("insertArticle1 "+member);
		
		if(member == null){
			return "reject";
			
		}else if(member != null&&(member.getMem_auth().equals("0") || member.getMem_auth().equals("1") || member.getMem_auth().equals("2"))){
			
			member = (Member)session.getAttribute("member");
			member = dao.selectById(member.getMem_id());
			List<Canvas> list1 = cdao.selectMyCanvas(member.getMem_num());
			List<Canvas> list2 = cdao.selectMyCapture(member.getMem_num());
			model.addAttribute("list1", list1);
			model.addAttribute("list2", list2);
			model.addAttribute("member", member);
			model.addAttribute("board", board);
			model.addAttribute("pageNum", pageNum);
			return "insertArticle1";

		}	
		return "reject";
	}	
	@Transactional
	@RequestMapping(value = "/insertArticle1", method = RequestMethod.POST)
	public String insertArticle1(@ModelAttribute ("member") Member member, @ModelAttribute ("board") Board board, HttpServletRequest request)throws IllegalStateException, IOException {
//		System.out.println("insertArticle1 : " + board);
//		System.out.println("insertArticle1 : " + member);
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
		 
		 
		 if(uploadfile!=null){
			 String fname = uploadfile.getOriginalFilename();
			 System.out.println(fname);
			 board.setBod_img(member.getMem_id()+time2+".jpg");
//				// 1. FileOutputStream 사용
//	         byte[] fileData = uploadfile.getBytes();
//	         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//	         output.write(fileData);
//	         output.close();
	         
        // 2. transferTo 함수 사용
	    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" +member.getMem_id()+time2+".jpg"));
	    	 
	    	 //	Thumbnail image 만들기 시작		    	 
	    	 ParameterBlock pb = new ParameterBlock();
//			 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
	     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
			 RenderedOp rOp = JAI.create("fileload", pb);
	 	 	 BufferedImage bi = rOp.getAsBufferedImage();
			 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
			 Graphics2D g = thumb.createGraphics();
			 g.drawImage(bi, 0, 0, 100, 100, null);	
//			 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
			 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
			 ImageIO.write(thumb,"png", fileObj);
//			 ImageIO.write(thumb,"png", fileObj1);
		 } else if(board.getBod_img2()!=null){
			 board.setBod_img(board.getBod_img2());
		 } else if(board.getBod_img3()!=null){
			 board.setBod_img(board.getBod_img3());
		 } else {
			 board.setBod_img("null.jpg");
		 }
		  
		 
//		 if (fname.equals("")) {
//		       board.setBod_img("null.jpg");
//		 } else {
//		       board.setBod_img(member.getMem_id()+time2+".jpg");
//		       
////			// 1. FileOutputStream 사용
////		         byte[] fileData = uploadfile.getBytes();
////		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
////		         output.write(fileData);
////		         output.close();
//		         
//	        // 2. transferTo 함수 사용
//		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" +member.getMem_id()+time2+".jpg"));
//		    	 
//		    	 //	Thumbnail image 만들기 시작		    	 
//		    	 ParameterBlock pb = new ParameterBlock();
////				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
//		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
//				 RenderedOp rOp = JAI.create("fileload", pb);
//		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
//				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
//				 Graphics2D g = thumb.createGraphics();
//				 g.drawImage(bi, 0, 0, 100, 100, null);	
////				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
//				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
//				 ImageIO.write(thumb,"png", fileObj);
////				 ImageIO.write(thumb,"png", fileObj1);
//		  }
		 
		 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = dayTime.format(new Date(System.currentTimeMillis()));
//		board.setBod_date(new Timestamp(System.currentTimeMillis()));
		board.setBod_date(time);
//		board.setIp(request.getRemoteAddr());
		board.setBod_readcount(0);
		int bod_des_category =  Integer.parseInt(request.getParameter("bod_des_category")); 
		board.setBoard_des_category(bod_des_category);
		
					
//		System.out.println(" id : "+b.getWriter()+" maxNum : "+(bdao.selectMaxNum()+1));
		bdao.insertBoard(board);
	
		return "redirect:/spring/board1?pageNum=1";
		
//		return "redirect:/spring/addMemberResult?id="+m.getId();
	}
	

	
		
	//TODO board1
	@RequestMapping(value = "/board1", method = RequestMethod.GET)
	public String board1(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectBoard1();
		model.addAttribute("list", list);
//		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		Member member = (Member)session.getAttribute("member");
		session.setAttribute("member", member);
//		int lsDiv = list.size()%12;
//		int lsMul = list.size()/12;
//		int maxPageNum = 0;
//		if(lsDiv==0){
//			maxPageNum = lsMul;
//		}else {
//			maxPageNum = lsMul+1;
//		}
//		System.out.println("lsDiv : " + lsDiv);
//		System.out.println("lsMul : " + lsMul);
//		System.out.println("maxPageNum : " + maxPageNum);
		
//		model.addAttribute("maxPageNum", maxPageNum);
//		session.setAttribute("maxPageNum", maxPageNum);
		
//		System.out.println(list);
//		System.out.println(bdao.selectAllBoard());	
		return "board1";		
	}
	
	@RequestMapping(value = "/top1", method = RequestMethod.GET)
	public String top1(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectTop1();
		model.addAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		Member member = (Member)session.getAttribute("member");
		session.setAttribute("member", member);

		return "board1";		
	}
	
	@RequestMapping(value = "/bottom1", method = RequestMethod.GET)
	public String bottom1(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectBottom1();
		model.addAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		Member member = (Member)session.getAttribute("member");
		session.setAttribute("member", member);

		return "board1";		
	}
	
	@RequestMapping(value = "/acce1", method = RequestMethod.GET)
	public String acce1(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectAcce1();
		model.addAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		Member member = (Member)session.getAttribute("member");
		session.setAttribute("member", member);

		return "board1";		
	}
	
	@RequestMapping(value = "/etc1", method = RequestMethod.GET)
	public String etc1(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectEtc1();
		model.addAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		Member member = (Member)session.getAttribute("member");
		session.setAttribute("member", member);

		return "board1";		
	}
	
	//TODO getArticle1
	@RequestMapping(value = "/getArticle1", method = RequestMethod.GET)
	public String getArticle1(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, int pageNum, Model model, HttpSession session) {
		member = (Member)session.getAttribute("member");
		board = (Board)session.getAttribute("board");
			
		if(member==null){
			return "reject";
			
		}
		
		model.addAttribute("member", member);
		board = bdao.selectByNum(num);
		session.setAttribute("mem_id", board.getMem_id());
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("bod_img", board.getBod_img());
		
		bdao.updateReadCount(num);
		model.addAttribute("board", board);
		
		return "getArticle1";
	}
	//TODO deleteArticle1
	@RequestMapping(value = "/deleteArticle1", method = RequestMethod.GET)
	public String deleteArticle1(@ModelAttribute("member") Member member,@ModelAttribute("board") Board board, @RequestParam int num, HttpSession session) {
		member = (Member)session.getAttribute("member");
		
		System.out.println(member);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
			board = bdao.selectByNum(num);
			bdao.deleteBoardByNum(num);
			return "redirect:/spring/board1?pageNum=1";
			
		}
		return "reject";
	}
	
	//TODO updateArticle1
	@RequestMapping(value = "/updateArticle1", method = RequestMethod.GET)
	public String updateArticle1(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, String pageNum, Model model, HttpSession session) {
		
		board = (Board)session.getAttribute("board");
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		System.out.println(board);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
		board = bdao.selectByNum(num);
		model.addAttribute("board", board);
		System.out.println("GET messag "+board);
		
			return "updateArticle1";
		}
			return "reject";
	}
	
	@RequestMapping(value = "/updateArticle1", method = RequestMethod.POST)
	public String updateArticle1(@ModelAttribute ("member") Member member, @ModelAttribute("board") Board board, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
			  
		 } else {
			 board.setBod_img(member.getMem_id()+time2+".jpg");     
		    // 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+time2+".jpg"));
		    	 
//		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);
		 }
		
		System.out.println("POST messag "+board);
		
		int bod_des_category =  Integer.parseInt(request.getParameter("bod_des_category")); 
		board.setBoard_des_category(bod_des_category);
		
		bdao.updateBoardByNum(board);
		
//		session.setComplete();	// 이 컨트롤러에 의해 생성되어 session에 저장된 객체는 모두 삭제된다.
		return "redirect:/spring/getArticle1?num=" + board.getBod_num() + "&pageNum=" + board.getPageNum();
	}
	
	//TODO insertArticle2
	@RequestMapping(value = "/insertArticle2", method = RequestMethod.GET)
	public String insertArticle2(@RequestParam int pageNum, @ModelAttribute("member") Member member, Model model, HttpSession session) {
		Board board = new Board();
		member = (Member)session.getAttribute("member");
		System.out.println("insertArticle1 "+member);
		
		if(member == null){
			return "reject";
			
		}else if(member != null&&(member.getMem_auth().equals("0") || member.getMem_auth().equals("1") || member.getMem_auth().equals("2"))){
			
			member = (Member)session.getAttribute("member");
			member = dao.selectById(member.getMem_id());
			model.addAttribute("member", member);
			model.addAttribute("board", board);
			model.addAttribute("pageNum", pageNum);
			return "insertArticle2";

		}	
		return "reject";
	}	
	@Transactional
	@RequestMapping(value = "/insertArticle2", method = RequestMethod.POST)
	public String insertArticle2(@ModelAttribute ("member") Member member, @ModelAttribute ("board") Board board, HttpServletRequest request)throws IllegalStateException, IOException {
//		System.out.println("insertArticle1 : " + board);
//		System.out.println("insertArticle1 : " + member);
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
	
		 
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 System.out.println(fname);
		 if (fname.equals("")) {
		       board.setBod_img("null.jpg");
		 } else {
		       board.setBod_img(member.getMem_id()+time2+".jpg");
		       
//			// 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" +member.getMem_id()+time2+".jpg"));
		    	 
		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"png", fileObj);
//				 ImageIO.write(thumb,"png", fileObj1);
		  }
		 
		 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = dayTime.format(new Date(System.currentTimeMillis()));
//		board.setBod_date(new Timestamp(System.currentTimeMillis()));
		board.setBod_date(time);
//		board.setIp(request.getRemoteAddr());
		board.setBod_readcount(0);
		board.setBod_category(1);
		
		
					
//		System.out.println(" id : "+b.getWriter()+" maxNum : "+(bdao.selectMaxNum()+1));
		bdao.insertBoard(board);
	
		return "redirect:/spring/board2?pageNum=1";
		
//		return "redirect:/spring/addMemberResult?id="+m.getId();
	}
	

	
		
	//TODO board2
	@RequestMapping(value = "/board2", method = RequestMethod.GET)
	public String board2(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectBoard2();
		model.addAttribute("list", list);
//		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
//		int lsDiv = list.size()%12;
//		int lsMul = list.size()/12;
//		int maxPageNum = 0;
//		if(lsDiv==0){
//			maxPageNum = lsMul;
//		}else {
//			maxPageNum = lsMul+1;
//		}
//		System.out.println("lsDiv : " + lsDiv);
//		System.out.println("lsMul : " + lsMul);
//		System.out.println("maxPageNum : " + maxPageNum);
		
//		model.addAttribute("maxPageNum", maxPageNum);
//		session.setAttribute("maxPageNum", maxPageNum);
		
//		System.out.println(list);
//		System.out.println(bdao.selectAllBoard());	
		return "board2";		
	}		
	
	//TODO getArticle2
	@RequestMapping(value = "/getArticle2")
	public String getArticle2(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, int pageNum, Model model, HttpSession session) {
		member = (Member)session.getAttribute("member");
		board = (Board)session.getAttribute("board");
			
		if(member==null){
			return "reject";
			
		}
		
		model.addAttribute("member", member);
		board = bdao.selectByNum(num);
		session.setAttribute("mem_id", board.getMem_id());
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("bod_img", board.getBod_img());
		
		bdao.updateReadCount(num);
		model.addAttribute("board", board);
		
		return "getArticle2";
	}
	
	//TODO deleteArticle2
	@RequestMapping(value = "/deleteArticle2", method = RequestMethod.GET)
	public String deleteArticle2(@ModelAttribute("member") Member member,@ModelAttribute("board") Board board, @RequestParam int num, HttpSession session) {
		member = (Member)session.getAttribute("member");
		
		System.out.println(member);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
			board = bdao.selectByNum(num);
			bdao.deleteBoardByNum(num);
			return "redirect:/spring/board2?pageNum=1";
			
		}
		return "reject";
	}
	
	
	@RequestMapping(value = "/updateArticle2", method = RequestMethod.GET)
	public String updateArticle2(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, String pageNum, Model model, HttpSession session) {
		
		board = (Board)session.getAttribute("board");
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		System.out.println(board);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
		board = bdao.selectByNum(num);
		model.addAttribute("board", board);
		System.out.println("GET messag "+board);
		
			return "updateArticle2";
		}
			return "reject";
	}
	
	@RequestMapping(value = "/updateArticle2", method = RequestMethod.POST)
	public String updateArticle2(@ModelAttribute ("member") Member member, @ModelAttribute("board") Board board, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
			  
		 } else {
			 board.setBod_img(member.getMem_id()+time2+".jpg");     
		    // 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+time2+".jpg"));
		    	 
//		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);
		 }
		
		System.out.println("POST messag "+board);
		bdao.updateBoardByNum(board);
		
//		session.setComplete();	// 이 컨트롤러에 의해 생성되어 session에 저장된 객체는 모두 삭제된다.
		return "redirect:/spring/getArticle2?num=" + board.getBod_num() + "&pageNum=" + board.getPageNum();
	}
	
	
	//TODO app부분
	@RequestMapping(value = "/app_board", method = RequestMethod.GET)
	public String app_articleList1(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectBoard1();
		model.addAttribute("list", list);
//		session.setAttribute("list", list);
//		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
//		int lsDiv = list.size()%12;
//		int lsMul = list.size()/12;
//		int maxPageNum = 0;
//		if(lsDiv==0){
//			maxPageNum = lsMul;
//		}else {
//			maxPageNum = lsMul+1;
//		}
//		System.out.println("lsDiv : " + lsDiv);
//		System.out.println("lsMul : " + lsMul);
//		System.out.println("maxPageNum : " + maxPageNum);
		
//		model.addAttribute("maxPageNum", maxPageNum);
//		session.setAttribute("maxPageNum", maxPageNum);
		
//		System.out.println(list);
//		System.out.println(bdao.selectAllBoard());	
		return "app_board";		
	}
	@RequestMapping(value = "/app_insertArticle", method = RequestMethod.GET)
	public String app_insertArticle1(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		Board board = new Board();
		member = (Member)session.getAttribute("member");
		System.out.println("insertArticle1 "+member);
		
		if(member == null){
			return "reject";
			
		}else if(member != null&&(member.getMem_auth().equals("0") || member.getMem_auth().equals("1") || member.getMem_auth().equals("2"))){
			
			member = (Member)session.getAttribute("member");
			member = dao.selectById(member.getMem_id());
			model.addAttribute("member", member);
			model.addAttribute("board", board);
			return "app_insertArticle";

		}	
		return "reject";
	}	
	@Transactional
	@RequestMapping(value = "/app_insertArticle", method = RequestMethod.POST)
	public String app_insertArticle(@ModelAttribute ("member") Member member, @ModelAttribute ("board") Board board, HttpServletRequest request)throws IllegalStateException, IOException {
//		System.out.println("insertArticle1 : " + board);
//		System.out.println("insertArticle1 : " + member);
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
	
		 
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 System.out.println(fname);
		 if (fname.equals("")) {
		       board.setBod_img("null.jpg");
		 } else {
		       board.setBod_img(member.getMem_id()+time2+".jpg");
		       
//			// 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" +member.getMem_id()+time2+".jpg"));
		    	 
		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"png", fileObj);
//				 ImageIO.write(thumb,"png", fileObj1);
		  }
		 
		 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = dayTime.format(new Date(System.currentTimeMillis()));
//		board.setBod_date(new Timestamp(System.currentTimeMillis()));
		board.setBod_date(time);
//		board.setIp(request.getRemoteAddr());
		board.setBod_readcount(0);
		
		
					
//		System.out.println(" id : "+b.getWriter()+" maxNum : "+(bdao.selectMaxNum()+1));
		bdao.insertBoard(board);
	
		return "redirect:/spring/app_board?pageNum=1";
	}
	
//	return "redirect:/spring/addMemberResult?id="+m.getId();
		
	@RequestMapping(value = "/app_getArticle")
	public String app_getArticle1(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, int pageNum, Model model, HttpSession session) {
		member = (Member)session.getAttribute("member");
		board = (Board)session.getAttribute("board");
			
		if(member==null){
			return "reject";
			
		}
		
		model.addAttribute("member", member);
		board = bdao.selectByNum(num);
		session.setAttribute("mem_id", board.getMem_id());
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("bod_img", board.getBod_img());
		
		bdao.updateReadCount(num);
		model.addAttribute("board", board);
		
		return "app_getArticle";
	}
	
	@RequestMapping(value = "/app_deleteArticle", method = RequestMethod.GET)
	public String app_deleteBoard(@ModelAttribute("member") Member member,@ModelAttribute("board") Board board, @RequestParam int num, HttpSession session) {
		member = (Member)session.getAttribute("member");
		
		System.out.println(member);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
			board = bdao.selectByNum(num);
			bdao.deleteBoardByNum(num);
			return "redirect:/spring/app_board?pageNum=1";
			
		}
		return "reject";
	}
	
	
	@RequestMapping(value = "/app_updateArticle", method = RequestMethod.GET)
	public String app_updateArticle1(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, String pageNum, Model model, HttpSession session) {
		
		board = (Board)session.getAttribute("board");
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		System.out.println(board);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
		board = bdao.selectByNum(num);
		model.addAttribute("board", board);
		System.out.println("GET messag "+board);
		
			return "app_updateArticle";
		}
			return "reject";
	}
	
	@RequestMapping(value = "/app_updateArticle", method = RequestMethod.POST)
	public String app_updateArticle1(@ModelAttribute ("member") Member member, @ModelAttribute("board") Board board, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
			  
		 } else {
			 board.setBod_img(member.getMem_id()+time2+".jpg");     
		    // 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+time2+".jpg"));
		    	 
//		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);
		 }
		
		System.out.println("POST messag "+board);
		bdao.updateBoardByNum(board);
		
//		session.setComplete();	// 이 컨트롤러에 의해 생성되어 session에 저장된 객체는 모두 삭제된다.
		return "redirect:/spring/app_getArticle?num=" + board.getBod_num() + "&pageNum=" + board.getPageNum();
	}
	
	//TODO app_ insertArticle2
	@RequestMapping(value = "/app_free_insertArticle2", method = RequestMethod.GET)
	public String app_free_insertArticle2(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		Board board = new Board();
		member = (Member)session.getAttribute("member");
		System.out.println("insertArticle1 "+member);
		
		if(member == null){
			return "reject";
			
		}else if(member != null&&(member.getMem_auth().equals("0") || member.getMem_auth().equals("1") || member.getMem_auth().equals("2"))){
			
			member = (Member)session.getAttribute("member");
			member = dao.selectById(member.getMem_id());
			model.addAttribute("member", member);
			model.addAttribute("board", board);
			return "app_free_insertArticle2";

		}	
		return "reject";
	}	
	@Transactional
	@RequestMapping(value = "/app_free_insertArticle2", method = RequestMethod.POST)
	public String app_free_insertArticle2(@ModelAttribute ("member") Member member, @ModelAttribute ("board") Board board, HttpServletRequest request)throws IllegalStateException, IOException {
//		System.out.println("insertArticle1 : " + board);
//		System.out.println("insertArticle1 : " + member);
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
	
		 
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 System.out.println(fname);
		 if (fname.equals("")) {
		       board.setBod_img("null.jpg");
		 } else {
		       board.setBod_img(member.getMem_id()+time2+".jpg");
		       
//			// 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" +member.getMem_id()+time2+".jpg"));
		    	 
		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"png", fileObj);
//				 ImageIO.write(thumb,"png", fileObj1);
		  }
		 
		 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = dayTime.format(new Date(System.currentTimeMillis()));
//		board.setBod_date(new Timestamp(System.currentTimeMillis()));
		board.setBod_date(time);
//		board.setIp(request.getRemoteAddr());
		board.setBod_readcount(0);
		board.setBod_category(1);
		
		
					
//		System.out.println(" id : "+b.getWriter()+" maxNum : "+(bdao.selectMaxNum()+1));
		bdao.insertBoard(board);
	
		return "redirect:/spring/app_free_board2?pageNum=1";
		
//		return "redirect:/spring/addMemberResult?id="+m.getId();
	}
	

	
		
	//TODO app_free_board2
	@RequestMapping(value = "/app_free_board2", method = RequestMethod.GET)
	public String app_free_board2(@RequestParam int pageNum, Model model, HttpSession session) {
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectBoard2();
		model.addAttribute("list", list);
//		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
//		int lsDiv = list.size()%12;
//		int lsMul = list.size()/12;
//		int maxPageNum = 0;
//		if(lsDiv==0){
//			maxPageNum = lsMul;
//		}else {
//			maxPageNum = lsMul+1;
//		}
//		System.out.println("lsDiv : " + lsDiv);
//		System.out.println("lsMul : " + lsMul);
//		System.out.println("maxPageNum : " + maxPageNum);
		
//		model.addAttribute("maxPageNum", maxPageNum);
//		session.setAttribute("maxPageNum", maxPageNum);
		
//		System.out.println(list);
//		System.out.println(bdao.selectAllBoard());	
		return "app_free_board2";		
	}		
	
	//TODO app_free_getArticle2
	@RequestMapping(value = "/app_free_getArticle2")
	public String app_free_getArticle2(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, int pageNum, Model model, HttpSession session) {
		member = (Member)session.getAttribute("member");
		board = (Board)session.getAttribute("board");
			
		if(member==null){
			return "reject";
			
		}
		
		model.addAttribute("member", member);
		board = bdao.selectByNum(num);
		session.setAttribute("mem_id", board.getMem_id());
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("bod_img", board.getBod_img());
		
		bdao.updateReadCount(num);
		model.addAttribute("board", board);
		
		return "app_free_getArticle2";
	}
	
	//TODO app_free_deleteArticle2
	@RequestMapping(value = "/app_free_deleteArticle2", method = RequestMethod.GET)
	public String app_free_deleteArticle2(@ModelAttribute("member") Member member,@ModelAttribute("board") Board board, @RequestParam int num, HttpSession session) {
		member = (Member)session.getAttribute("member");
		
		System.out.println(member);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
			board = bdao.selectByNum(num);
			bdao.deleteBoardByNum(num);
			return "redirect:/spring/app_free_board2?pageNum=1";
			
		}
		return "reject";
	}
	
	
	@RequestMapping(value = "/app_free_updateArticle2", method = RequestMethod.GET)
	public String app_free_updateArticle2(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, String pageNum, Model model, HttpSession session) {
		
		board = (Board)session.getAttribute("board");
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		System.out.println(board);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
		board = bdao.selectByNum(num);
		model.addAttribute("board", board);
		System.out.println("GET messag "+board);
		
			return "app_free_updateArticle2";
		}
			return "reject";
	}
	
	@RequestMapping(value = "/app_free_updateArticle2", method = RequestMethod.POST)
	public String app_free_updateArticle2(@ModelAttribute ("member") Member member, @ModelAttribute("board") Board board, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
			  
		 } else {
			 board.setBod_img(member.getMem_id()+time2+".jpg");     
		    // 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+time2+".jpg"));
		    	 
//		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);
		 }
		
		System.out.println("POST messag "+board);
		bdao.updateBoardByNum(board);
		
//		session.setComplete();	// 이 컨트롤러에 의해 생성되어 session에 저장된 객체는 모두 삭제된다.
		return "redirect:/spring/app_free_getArticle2?num=" + board.getBod_num() + "&pageNum=" + board.getPageNum();
	}
	
	
	
	
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(HttpSession session) {
		return "notice";
	}
	
	@RequestMapping(value = "/insert_notice", method = RequestMethod.GET)
	public String insert_notice(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		Board board = new Board();
		member = (Member)session.getAttribute("member");
		
		if(member == null){
			return "reject";
			
		}else if(member != null&&(member.getMem_auth().equals("0"))){
			
			member = (Member)session.getAttribute("member");
			member = dao.selectById(member.getMem_id());
			model.addAttribute("member", member);
			model.addAttribute("board", board);
			return "insert_notice";

		}	
		return "reject";
	}
	//TODO insert_notice
	@RequestMapping(value = "/insert_notice", method = RequestMethod.POST)
	public String insert_notice(@ModelAttribute ("member") Member member, @ModelAttribute ("board") Board board, HttpServletRequest request)throws IllegalStateException, IOException {

		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
	
		 
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 System.out.println(fname);
		 if (fname.equals("")) {
		       board.setBod_img("null.jpg");
		 } else {
		       board.setBod_img(member.getMem_id()+time2+".jpg");
		       
//			// 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" +member.getMem_id()+time2+".jpg"));
		    	 
		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"png", fileObj);
//				 ImageIO.write(thumb,"png", fileObj1);
		  }
		 
		 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = dayTime.format(new Date(System.currentTimeMillis()));
		board.setBod_date(time);
		board.setBod_readcount(0);
		board.setBod_category(2);
		
		
					
		bdao.insertBoard(board);
	
		return "redirect:/spring/intro?pageNum=1";
		
	}
	
	@RequestMapping(value = "/update_intro", method = RequestMethod.GET)
	public String update_intro(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, String pageNum, Model model, HttpSession session) {
		
		board = (Board)session.getAttribute("board");
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		System.out.println(board);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
			
		board = bdao.selectByNum(num);
		model.addAttribute("board", board);
		System.out.println("GET messag "+board);
		
			return "update_intro";
		}
			return "reject";
	}
	
	@RequestMapping(value = "/update_intro", method = RequestMethod.POST)
	public String update_intro(@ModelAttribute ("member") Member member, @ModelAttribute("board") Board board, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = board.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
			  
		 } else {
			 board.setBod_img(member.getMem_id()+time2+".jpg");     
		    // 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+time2+".jpg"));
		    	 
//		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);
		 }
		
		System.out.println("POST messag "+board);
		bdao.updateBoardByNum(board);
		
//		session.setComplete();	// 이 컨트롤러에 의해 생성되어 session에 저장된 객체는 모두 삭제된다.
		return "redirect:/spring/get_intro?num=" + board.getBod_num() + "&pageNum=" + board.getPageNum();
	}
	
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro(@RequestParam int pageNum, @ModelAttribute("member") Member member, Model model, HttpSession session) {
		model.addAttribute("member", member);
		Board board = new Board();
		model.addAttribute("board", board);
		List<Board> list = bdao.selectBoard3();
		model.addAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		return "intro";
	}
	@RequestMapping(value = "/get_intro")
	public String get_intro(@ModelAttribute("member") Member member, @ModelAttribute("board") Board board, @RequestParam int num, int pageNum, Model model, HttpSession session) {
		member = (Member)session.getAttribute("member");
		board = (Board)session.getAttribute("board");
			
		if(member==null){
			return "reject";
			
		}
		
		model.addAttribute("member", member);
		board = bdao.selectByNum(num);
		session.setAttribute("mem_id", board.getMem_id());
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("bod_img", board.getBod_img());
		
		bdao.updateReadCount(num);
		model.addAttribute("board", board);
		
		return "get_intro";
	}
	
	//TODO delete_intro
		@RequestMapping(value = "/delete_intro", method = RequestMethod.GET)
		public String delete_intro(@ModelAttribute("member") Member member,@ModelAttribute("board") Board board, @RequestParam int num, @RequestParam int pageNum, HttpSession session) {
			member = (Member)session.getAttribute("member");
			
			System.out.println(member);
			
			if(member==null){
				return "reject";
				
			}else if(member.getMem_id().equals(board.getMem_id())||(member.getMem_auth().equals("0"))){
				
				board = bdao.selectByNum(num);
				bdao.deleteBoardByNum(num);
				return "redirect:/spring/intro1?pageNum="+pageNum;
				
			}
			return "reject";
		}
	@RequestMapping(value = "/intro1", method = RequestMethod.GET)
	public String intro1(@ModelAttribute("member") Member member, Model model) {
		model.addAttribute("member", member);
		return "intro1";
	}
	@RequestMapping(value = "/intro2", method = RequestMethod.GET)
	public String intro2(@ModelAttribute("member") Member member, Model model) {
		model.addAttribute("member", member);
		return "intro2";
	}
	
		
	
	
}

