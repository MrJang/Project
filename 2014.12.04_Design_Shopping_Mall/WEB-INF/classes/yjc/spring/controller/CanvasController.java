package yjc.spring.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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

import yjc.spring.bean.Member;
import yjc.spring.bean.Canvas;
import yjc.spring.bean.Request;
import yjc.spring.dao.IbatisCanvasDao;
import yjc.spring.dao.IbatisMemberDao;
import yjc.spring.dao.IbatisRequestDao;

@Controller
@SessionAttributes({"member","canvas"})
@Transactional
public class CanvasController {
	@Autowired
	private IbatisCanvasDao  cdao;
	@Autowired
	private IbatisMemberDao dao;
	@Autowired
	private IbatisRequestDao rdao;
	
	
	// TODO
	
	
	
	@RequestMapping(value = "/canvas", method = RequestMethod.GET)
	public String canvas(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		Canvas canvas = new Canvas();
		member = (Member)session.getAttribute("member");
//		if(member==null){
//			return "reject";
//		}else{
			model.addAttribute("member", member);	
			model.addAttribute("canvas", canvas);
//		}
		
		return "canvas";
	}
	
	@RequestMapping(value = "/canvas", method = RequestMethod.POST)
	public String canvas(@ModelAttribute("member") Member member, @ModelAttribute("canvas") Canvas canvas, HttpSession session, Model model) throws IllegalStateException, IOException {
		member = (Member)session.getAttribute("member");
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = dayTime.format(new Date(System.currentTimeMillis()));
		
		if(member==null){
			return "reject";
		}else{
			
			
			
			String uploadimg = canvas.getCan_img();
//			System.out.println(uploadimg);
			 
			 String fname = uploadimg; 
			 
			 canvas.setCan_img(fname);
			       	
			  }
			
			System.out.println("can_title : " + canvas.getCan_title());
			canvas.setCan_img(canvas.getCan_img());
			canvas.setCan_title(canvas.getCan_title());
			canvas.setCan_category(2);
			canvas.setCan_date(time);
			canvas.setMem_num(member.getMem_num());
			canvas.setMem_id(member.getMem_id());
			
	
			model.addAttribute("canvas", canvas);
			cdao.insertCanvas(canvas);
		
		
			return "my_canvas";
	}
	
	@RequestMapping(value = "/my_commission")
	public String my_commission(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		member = (Member)session.getAttribute("member");
		model.addAttribute("member", member);
		
		Request commission = new Request();
		model.addAttribute("commission", commission);
		List<Request> list = rdao.selectMyCommission(member.getMem_id());
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
		return "my_commission";
	}
	
	
	@RequestMapping(value = "/my_capture")
	public String my_capture(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		member = (Member)session.getAttribute("member");
		model.addAttribute("member", member);
		if(member.getMem_id()==null){return "reject";}
		
		Canvas canvas = new Canvas();
		model.addAttribute("canvas", canvas);
		List<Canvas> list = cdao.selectMyCapture(member.getMem_num());
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
		return "my_capture";
	}
	
	
	
	@RequestMapping(value = "/my_canvas")
	public String my_canvas(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		member = (Member)session.getAttribute("member");
		model.addAttribute("member", member);
		if(member.getMem_id()==null){return "reject";}
		
		Canvas canvas = new Canvas();
		model.addAttribute("canvas", canvas);
		List<Canvas> list = cdao.selectMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
//		System.out.println(list);
//		System.out.println(cdao.selectAllCanvas());
		
		
		return "my_canvas";
	}
	
	@RequestMapping(value = "/my_design", method = RequestMethod.GET)
	public String my_design(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		Canvas canvas = new Canvas();
		model.addAttribute("canvas", canvas);
		List<Canvas> list = cdao.selectAllCanvas();
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
//		System.out.println(list);
//		System.out.println(cdao.selectAllCanvas());	
		return "my_design";
	}
	
	@RequestMapping(value = "/addcanvas", method = RequestMethod.GET)
	public String addcanvas(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		Canvas canvas = new Canvas();
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		
		if(member == null){
			return "reject";
			
		}else if(member != null&&(member.getMem_auth().equals("0") || member.getMem_auth().equals("1") || member.getMem_auth().equals("2"))){
			
			member = dao.selectById(member.getMem_id());
			model.addAttribute("member", member);
			model.addAttribute("canvas", canvas);
			return "addcanvas";

		}	
		return "reject";
		
	}
	
	@RequestMapping(value = "/addcanvas", method = RequestMethod.POST)
	public String addcanvas(@ModelAttribute ("member") Member member, @ModelAttribute ("canvas") Canvas canvas, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		member = (Member)session.getAttribute("member");
//		System.out.println("m : " + member);
//		System.out.println("c : " + canvas);
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = canvas.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
		       canvas.setCan_img("null.jpg");
		 } else {
		       canvas.setCan_img(member.getMem_id()+"-capture-"+time2+".jpg");
		       
//			// 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+"-capture-"+time2+".jpg"));
		    	 
		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+"-capture-"+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+"-capture-"+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);
		  }
		 
		  
		  
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = dayTime.format(new Date(System.currentTimeMillis()));
				  
//		canvas.setCan_date(new Timestamp(System.currentTimeMillis()));
		canvas.setCan_date(time);
		canvas.setMem_num(member.getMem_num());
		canvas.setMem_id(member.getMem_id());
		canvas.setCan_category(1);
		
			
		cdao.insertCanvas(canvas);
	
		return "redirect:/spring/my_canvas";
	}

	
	@RequestMapping(value = "/my_design_write", method = RequestMethod.GET)
	public String my_design_write(@ModelAttribute("member") Member member, Model model, HttpSession session) {
		Canvas canvas = new Canvas();
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		
		if(member == null){
			return "reject";
			
		}else if(member != null&&(member.getMem_auth().equals("0") || member.getMem_auth().equals("1") || member.getMem_auth().equals("2"))){
			
			member = dao.selectById(member.getMem_id());
			model.addAttribute("member", member);
			model.addAttribute("canvas", canvas);
			return "my_design_write";

		}	
		return "reject";
		
	}
	
	@RequestMapping(value = "/my_design_write", method = RequestMethod.POST)
	public String my_design_write(@ModelAttribute ("member") Member member, @ModelAttribute ("canvas") Canvas canvas,Model model, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		member = (Member)session.getAttribute("member");
		
		System.out.println("member : " + member);
//		System.out.println("canvas : " + canvas);
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		
		 MultipartFile uploadfile = canvas.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
		       canvas.setCan_img("null.jpg");
		 } else {
//		       canvas.setCan_img(fname);
		       canvas.setCan_img(member.getMem_id()+"-capture-"+time2+".jpg");     
		       
//			// 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		       uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+"-capture-"+time2+".jpg"));
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + fname));
//		    	 uploadfile.transferTo(new File("/" + fname+"0"));
//		    	 uploadfile.transferTo(new File("../" + fname+"1"));
//		    	 uploadfile.transferTo(new File("../../" + fname+"2"));
//		    	 uploadfile.transferTo(new File("../../../" + fname+"3"));
		    	 
		    	 //	Thumbnail image 만들기 시작		    	 	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+"-capture-"+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+"-capture-"+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);

		  }
		 
		  
		  
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String time = dayTime.format(new Date(System.currentTimeMillis()));
				  
//		canvas.setCan_date(new Timestamp(System.currentTimeMillis()));
			System.out.println("my_design_write : "+member.getMem_num());
		canvas.setCan_date(time);
		canvas.setMem_num(member.getMem_num());
		canvas.setMem_id(member.getMem_id());
		canvas.setCan_category(1);
		
		System.out.println("my_design_write : "+canvas.getMem_num());
			
		cdao.insertCanvas(canvas);
		
		model.addAttribute("member", member);
	
		return "redirect:/spring/my_capture";
	}
	
	
	
	@RequestMapping(value = "/getCanvas")
	public String getCanvas(@RequestParam int can_num, Model model, HttpSession session) {
		
		Canvas canvas = cdao.selectBycan_num(can_num);
		session.setAttribute("mem_num", canvas.getMem_num());
		session.setAttribute("can_img", canvas.getCan_img());
		session.setAttribute("can_img", canvas.getCan_img());
		
		model.addAttribute("canvas", canvas);
		
		return "getCanvas";
	}
	
	@RequestMapping(value = "/getDesign")
	public String getDesign(@RequestParam int can_num, Model model, HttpSession session) {
		
		Canvas canvas = cdao.selectBycan_num(can_num);
		session.setAttribute("mem_num", canvas.getMem_num());
		session.setAttribute("can_img", canvas.getCan_img());
		session.setAttribute("can_img", canvas.getCan_img());
		
		model.addAttribute("canvas", canvas);
		
		return "getDesign";
	}
	
	@RequestMapping(value = "/deleteCanvas", method = RequestMethod.GET)
	public String deleteCanvas(@ModelAttribute("member") Member member,@ModelAttribute("canvas") Canvas canvas, @RequestParam int can_num, HttpSession session) {
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		if(member==null){
			return "reject";
			
		}else if(member.getMem_num()==canvas.getMem_num()||(member.getMem_auth().equals("0"))){
			
			canvas = cdao.selectBycan_num(can_num);
			cdao.deleteCanvasBycan_num(can_num);
			return "redirect:/spring/my_canvas";
			
		}
		return "reject";
	}
	
	@RequestMapping(value = "/deleteCapture", method = RequestMethod.GET)
	public String deleteCapture(@ModelAttribute("member") Member member,@ModelAttribute("canvas") Canvas canvas, @RequestParam int can_num, HttpSession session) {
		member = (Member)session.getAttribute("member");
		System.out.println(member);
		if(member==null){
			return "reject";
			
		}else if(member.getMem_num()==canvas.getMem_num()||(member.getMem_auth().equals("0"))){
			
			canvas = cdao.selectBycan_num(can_num);
			cdao.deleteCanvasBycan_num(can_num);
			return "redirect:/spring/my_capture";
			
		}
		return "reject";
	}
	
	
	@RequestMapping(value = "/my_design_update", method = RequestMethod.GET)
	public String updateCanvas(@ModelAttribute("member") Member member, @ModelAttribute("canvas") Canvas canvas,@RequestParam int can_num, Model model, HttpSession session) {
		canvas = (Canvas)session.getAttribute("canvas");
		member = (Member)session.getAttribute("member");
		System.out.println(member);
//		System.out.println(canvas);
		
		if(member==null){
			return "reject";
			
		}else if(member.getMem_num()==canvas.getMem_num()||member.getMem_auth().equals("0")){
			       
		canvas = cdao.selectBycan_num(can_num);
		model.addAttribute("canvas", canvas);
		model.addAttribute("member", member);
			
			return "my_design_update";
		}
			return "reject";
	}
	
	@RequestMapping(value = "/my_design_update", method = RequestMethod.POST)
	public String updateCanvas(@ModelAttribute("member") Member member, @ModelAttribute("canvas") Canvas canvas, HttpSession session, HttpServletRequest request)throws IllegalStateException, IOException {
		
		SimpleDateFormat dayTime2 = new SimpleDateFormat(" - yyyy.MM.dd.HH.mm.ss");
		 String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
		 
		 MultipartFile uploadfile = canvas.getUploadfile();
		 
		 String fname = uploadfile.getOriginalFilename(); 
		 if (fname.equals("")) {
			  
		 } else {
		       canvas.setCan_img(member.getMem_id()+"-capture-"+time2+".jpg");     
//		    // 1. FileOutputStream 사용
//		         byte[] fileData = uploadfile.getBytes();
//		         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//		         output.write(fileData);
//		         output.close();
		         
	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + member.getMem_id()+"-capture-"+time2+".jpg"));
		    	 
//		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
//				 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
		     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+member.getMem_id()+"-capture-"+time2+".jpg");		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
//				 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+member.getMem_id()+"-capture-"+time2+".jpg");
				 ImageIO.write(thumb,"jpg", fileObj);
//				 ImageIO.write(thumb,"jpg", fileObj1);
		 }
		
		cdao.updateCanvasBycan_num(canvas);
		

		return "redirect:/spring/getCanvas?can_num=" + canvas.getCan_num();
	}
	
	@RequestMapping(value = "/boardCanvas", method = RequestMethod.GET)
	public String canvas_capture(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		member = (Member)session.getAttribute("member");
		model.addAttribute("member", member);
		
		Canvas canvas = new Canvas();
		model.addAttribute("canvas", canvas);
//		List<Canvas> list = cdao.selectMyCapture(member.getMem_id());
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
//		System.out.println(list);
		System.out.println(cdao.selectAllCanvas());
		
		
		return "boardCanvas";
	}
	
	@RequestMapping(value = "/boardCanvas", method = RequestMethod.POST)
	public String captureValue(@ModelAttribute("member") Member member,HttpServletRequest request ,HttpSession session, Model model) {
		String capture_img = request.getParameter("capture_img");
		member = (Member)session.getAttribute("member");
		model.addAttribute("member", member);
		
		Canvas canvas = new Canvas();
		model.addAttribute("canvas", canvas);
//		List<Canvas> list = cdao.selectMyCapture(member.getMem_id());
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		request.setAttribute("capture_img", capture_img);
//		System.out.println(list);
//		System.out.println(cdao.selectAllCanvas());
//		System.out.println(capture_img);
		
		return "canvas";
	}
	@RequestMapping(value = "/canvas1", method = RequestMethod.GET)
	public String canvas1(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		Canvas canvas = new Canvas();
		member = (Member)session.getAttribute("member");
//		if(member==null){
//			return "reject";
//		}else{
		
		List<Canvas> list = cdao.selectAllMyCanvas(member.getMem_num());
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
		model.addAttribute("member", member);	
		model.addAttribute("canvas", canvas);
			
		Request commission = new Request();
		List<Request> com_list = rdao.selectMyCommission(member.getMem_id());
		model.addAttribute("com_list", com_list);
		session.setAttribute("com_list", com_list);
		session.setAttribute("com_listsize", com_list.size());
		model.addAttribute("com_listsize", com_list.size());
		model.addAttribute("commission", commission);
		
		Request commission2 = new Request();
		List<Request> com_list2 = rdao.selectMyCommission2(member.getMem_id());
		model.addAttribute("com_list2", com_list2);
		session.setAttribute("com_list2", com_list2);
		session.setAttribute("com_listsize2", com_list2.size());
		model.addAttribute("com_listsize2", com_list2.size());
		model.addAttribute("commission2", commission2);

		
		return "canvas1";
	}
	
	@RequestMapping(value = "/canvas2", method = RequestMethod.GET)
	public String canvas2(@ModelAttribute("member") Member member, HttpSession session, Model model) {
		Request commission = new Request();
		member = (Member)session.getAttribute("member");
//		if(member==null){
//			return "reject";
//		}else{
		
		List<Request> list = rdao.selectMyCommission(member.getMem_id());
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("listsize", list.size());
		model.addAttribute("listsize", list.size());
		
			model.addAttribute("member", member);	
			model.addAttribute("commission", commission);
//		}
		
		return "canvas2";
	}
	
	//TODO app 부분
		@RequestMapping(value = "/app_my_capture", method = RequestMethod.GET)
		public String app_my_capture(@RequestParam int pageNum, @ModelAttribute("member") Member member, HttpSession session, Model model) {
			member = (Member)session.getAttribute("member");
			model.addAttribute("member", member);
			
			Canvas canvas = new Canvas();
			model.addAttribute("canvas", canvas);
			List<Canvas> list = cdao.selectMyCapture(member.getMem_num());
			model.addAttribute("list", list);
			session.setAttribute("list", list);
			session.setAttribute("listsize", list.size());
			model.addAttribute("listsize", list.size());
			
//			System.out.println(list);
//			System.out.println(cdao.selectAllCanvas());
			
			
			return "app_my_capture";
		}
		@RequestMapping(value = "/app_my_capture", method = RequestMethod.POST)
		public String app_my_capture1(@ModelAttribute ("member") Member member, @ModelAttribute ("canvas") Canvas canvas,Model model, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
			member = (Member)session.getAttribute("member");
			System.out.println("member : " + member);
//			System.out.println("canvas : " + canvas);
			 MultipartFile uploadfile = canvas.getUploadfile();
			 
			 String fname = uploadfile.getOriginalFilename(); 
			 if (fname.equals("")) {
			       canvas.setCan_img("null.jpg");
			 } else {
			       canvas.setCan_img(fname);
			       
//				// 1. FileOutputStream 사용
//			         byte[] fileData = uploadfile.getBytes();
//			         FileOutputStream output = new FileOutputStream("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/" + fname);
//			         output.write(fileData);
//			         output.close();
			         
		        // 2. transferTo 함수 사용
			    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/" + fname));
//			    	 uploadfile.transferTo(new File("/" + fname+"0"));
//			    	 uploadfile.transferTo(new File("../" + fname+"1"));
//			    	 uploadfile.transferTo(new File("../../" + fname+"2"));
//			    	 uploadfile.transferTo(new File("../../../" + fname+"3"));
			    	 
			    	 //	Thumbnail image 만들기 시작		    	 
			    	 ParameterBlock pb = new ParameterBlock();
//					 pb.add("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/"+fname);
			     	 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/"+fname);		
					 RenderedOp rOp = JAI.create("fileload", pb);
			 	 	 BufferedImage bi = rOp.getAsBufferedImage();
					 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
					 Graphics2D g = thumb.createGraphics();
					 g.drawImage(bi, 0, 0, 100, 100, null);	
//					 File fileObj1 = new File("D:/workspace-sts-3.4.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/INNO/upload/sm_"+fname);
					 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/upload/sm_"+fname);
					 ImageIO.write(thumb,"jpg", fileObj);
//					 ImageIO.write(thumb,"jpg", fileObj1);
			  }
			 
			  
			  
				SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String time = dayTime.format(new Date(System.currentTimeMillis()));
					  
//			canvas.setCan_date(new Timestamp(System.currentTimeMillis()));
				System.out.println("my_design_write : "+member.getMem_num());
			canvas.setCan_date(time);
			canvas.setMem_num(member.getMem_num());
			canvas.setMem_id(member.getMem_id());
			canvas.setCan_category(1);
			
			System.out.println("my_design_write : "+canvas.getMem_num());
				
			cdao.insertCanvas(canvas);
			
			model.addAttribute("member", member);
		
			return "redirect:/spring/app_my_capture";
		}
		
		@RequestMapping(value = "/app_my_design_write", method = RequestMethod.GET)
		public String app_my_design_write(@ModelAttribute("member") Member member, Model model, HttpSession session) {
			Canvas canvas = new Canvas();
			member = (Member)session.getAttribute("member");
			System.out.println(member);
			
			if(member == null){
				return "reject";
				
			}else if(member != null&&(member.getMem_auth().equals("0") || member.getMem_auth().equals("1") || member.getMem_auth().equals("2"))){
				
				member = dao.selectById(member.getMem_id());
				model.addAttribute("member", member);
				model.addAttribute("canvas", canvas);
				return "my_design_write";

			}	
			return "reject";
			
		}
		@RequestMapping(value = "/app_getCanvas")
		public String app_getCanvas(@RequestParam int can_num, @RequestParam int pageNum, Model model, HttpSession session) {
			
			Canvas canvas = cdao.selectBycan_num(can_num);
			session.setAttribute("mem_num", canvas.getMem_num());
			session.setAttribute("can_img", canvas.getCan_img());
			session.setAttribute("can_img", canvas.getCan_img());
			session.setAttribute("pageNum", pageNum);
			model.addAttribute("canvas", canvas);
			
			return "app_getCanvas";
		}
		
	
	
	
}

