package yjc.spring.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;

import java.io.IOException;

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
import org.springframework.web.multipart.MultipartFile;














import yjc.spring.bean.Member;
import yjc.spring.bean.d_shop;
import yjc.spring.bean.product;

import yjc.spring.dao.IbatisD_shop;
import yjc.spring.dao.IbatisMemberDao;
import yjc.spring.dao.IbatisProductDao;

@Controller
@SessionAttributes({"d_shop","member","product"})

@Transactional

public class d_shopController {
	@Autowired
	private IbatisD_shop  d_shopdao;
	@Autowired
	private IbatisMemberDao member_dao;
	@Autowired
	private IbatisProductDao pdao;
	

	

	@RequestMapping(value = "/d_shop", method = RequestMethod.GET)
	public String d_shop(@RequestParam int des_num,HttpSession session,Model model) {
		int re_des_num = des_num;
		String logo = d_shopdao.findlogo(re_des_num);
		String back = d_shopdao.findback(re_des_num);
		String re_des_id = d_shopdao.findmemid(des_num);
		session.setAttribute("re_memid",re_des_id);
		session.setAttribute("logo", logo);
		session.setAttribute("back", back);
		Member m = (Member) session.getAttribute("member");
	
		
		if(m.getMem_auth().equals("1") ){
			
		int cu_des_num = d_shopdao.findDes_num(m.getMem_num());
		
		session.setAttribute("re_des_num",re_des_num);
		session.setAttribute("cu_des_num",cu_des_num);
		
		}else{
			session.setAttribute("re_des_num",re_des_num);
			
		}
		
		return "d_shop";
	}
//	-----디자인샵 공지-----
	@RequestMapping(value = "/d_gongji", method = RequestMethod.GET)
	public String d_gongji(HttpSession session,Model model) {
		int des_num =  (int) session.getAttribute("re_des_num");
		model.addAttribute("d_gongji",d_shopdao.selectGBoard(des_num));
		session.setAttribute("m_size", d_shopdao.selectGBoard(des_num).size());
		Member m = (Member) session.getAttribute("member");
		m.toString();
	
		return "d_gongji";
	}
//	-----글정보 보기-----
	@RequestMapping(value = "/d_gongji_info", method = RequestMethod.GET)
	public String d_gongji_info(int dsh_boardnum,HttpSession session,Model model) {
		model.addAttribute("d_gongji_info",d_shopdao.selectBoardByNum(dsh_boardnum));
		return "d_gongji_info";
	}
	
//	--------글삽입------- 
	@RequestMapping(value = "/d_gongji_insert", method = RequestMethod.GET)
	public String d_gongji_insert(Model model,HttpSession session) {
		
		Member m = (Member) session.getAttribute("member");
		System.out.println(m.getMem_id());
		
		if(m.getMem_auth().equals("1") ){
		int re_des_num =  (int) session.getAttribute("re_des_num");
		int cu_des_num = (int) session.getAttribute("cu_des_num");
		}else{
			int re_des_num =  (int) session.getAttribute("re_des_num");
		}
		d_shop d_shop = new d_shop();
		model.addAttribute("d_shop", d_shop);
		
		return "d_gongji_insert";
		
		}
	
		
	@RequestMapping(value="/d_gongji_insert", method=RequestMethod.POST)
	public String d_gongji_insert(@ModelAttribute("d_shop") d_shop d_shop,String des_num1){
		int des_num = Integer.parseInt(des_num1);
		System.out.println("디자인 넘버 넘어가냐??"+des_num);
		
		d_shop.setDes_num(des_num);
		d_shopdao.insertD_shop(d_shop);
	
		return "d_shop";
		
	}
//	---------글 업데이트---------
	@RequestMapping(value = "/d_gongji_upDate", method = RequestMethod.GET)
	public String d_gongji_upDate(int dsh_boardnum,HttpSession session,Model model) {
		model.addAttribute("d_gongji_upDate",d_shopdao.selectBoardByNum(dsh_boardnum));
		return "d_gongji_upDate";
	}
		
	@RequestMapping(value="/d_gongji_upDate", method=RequestMethod.POST)
	public String d_gongji_upDate(@RequestParam int dsh_boardnum,@ModelAttribute("d_gongji_upDate") d_shop d_shop){
		System.out.println(d_shop);
		d_shopdao.upDateD_shop(d_shop);
	System.out.print(" 업데이트 됫나??");
		return "redirect:/spring/d_shop";
		
	}

//	---------글 삭제------------
	@RequestMapping(value = "/d_gongji_delete", method = RequestMethod.GET)
	public String d_gongji_delete(int dsh_boardnum,HttpSession session,Model model) {
		d_shopdao.deleteBoardByNum(dsh_boardnum);
		return "redirect:/spring/d_gongji";

	}
	
	
	@RequestMapping(value = "/d_qna", method = RequestMethod.GET)
	public String d_qna(HttpSession session,Model model) {
		int des_num =  (int) session.getAttribute("re_des_num");
		model.addAttribute("d_qna",d_shopdao.selectQBoard(des_num));
		session.setAttribute("m_size", d_shopdao.selectQBoard(des_num).size());
		return "d_qna";
	}
//	쇼핑몰
	
	@RequestMapping(value = "/d_shopping", method = RequestMethod.GET)
	public String d_shopping(HttpSession session,Model model) {
		int re_des_num =  (int) session.getAttribute("re_des_num");
//		model.addAttribute("product2", d_shopdao.selectshoping(re_des_num));
		List<product> product = d_shopdao.selectshoping(re_des_num);
		System.out.println(product);
		model.addAttribute("product", product);
		return "d_shopping";
	}
	@RequestMapping(value = "/d_shopping_cate", method = RequestMethod.GET)
	public String d_shopping_cate(@RequestParam int category_num,HttpSession session,Model model) {
		int re_des_num =  (int) session.getAttribute("re_des_num");
//		model.addAttribute("product2", d_shopdao.selectshoping(re_des_num));
		int pro_category=category_num;
		product product1 = new product();
		product1.setDes_num(re_des_num);
		product1.setPro_category(pro_category);
		System.out.println(pro_category);
		List<product> productt = d_shopdao.selectcateshoping(product1);
		System.out.println(productt);
		model.addAttribute("productt", productt);
		return "d_shopping_cate";

	}

	
	@RequestMapping(value = "/d_manager", method = RequestMethod.GET)
	public String d_manager(HttpSession session) {
		return "d_manager";
		
	}
	@RequestMapping(value = "/d_manager_reg", method = RequestMethod.GET)
	public String d_manager_reg(HttpSession session) {
		
		
		
		return "d_manager_reg";
		
	}
	
	@RequestMapping(value = "/d_manager_order", method = RequestMethod.GET)
	public String d_manager_order(HttpSession session,Model model,d_shop d_shop ) {
		int re_des_num =  (int) session.getAttribute("re_des_num");
		int cu_des_num = (int)session.getAttribute("cu_des_num");
		model.addAttribute("d_manager_order",d_shopdao.selectOBoard(re_des_num));
		session.setAttribute("m_size",d_shopdao.selectOBoard(re_des_num).size());
		model.addAttribute("d_shop",d_shop);
		if(cu_des_num == re_des_num){
			
			return "d_manager_order";
		}else{
			return "d_shop";
		}
	}

	@RequestMapping(value = "/d_manager_order", method = RequestMethod.POST)
	public String d_manager_order(@ModelAttribute("d_shop") d_shop d_shop,HttpSession session,Model model,HttpServletRequest request ) {
		String num=request.getParameter("num");
		
		int re_des_num =  (int) session.getAttribute("re_des_num");
		int cu_des_num = (int)session.getAttribute("cu_des_num");
		int p_num = d_shop.getP_num();
		String p_status=d_shopdao.findStatus(p_num);
		if(p_status.equals("입금대기")){
			d_shopdao.moneyEnter(p_num);
		}else if(p_status.equals("입금완료")&&num.equals("1")){
			System.out.println(num);
			d_shopdao.deliver(p_num);
			return "redirect:/spring/d_manager_order";
		}else if(p_status.equals("입금완료")&&num.equals("2")){
			d_shopdao.moneyWait(p_num);
			return "redirect:/spring/d_manager_order";
		}
		if(cu_des_num == re_des_num){
			
			return "redirect:/spring/d_manager_order";
		}else{
			return "d_shop";
		}
	}
		
		
	

	@RequestMapping(value = "/d_manager_bb", method = RequestMethod.GET)
	public String d_manager_bb(HttpSession session,Model model,d_shop d_shop){
	model.addAttribute("d_shop",d_shop);
	int cu_des_num = (int)session.getAttribute("cu_des_num");
	int re_des_num = (int)session.getAttribute("re_des_num");
	String logo = d_shopdao.findlogo(re_des_num);
	String back = d_shopdao.findback(re_des_num);
	System.out.println("로고"+logo);
	System.out.println("배경"+back);
	
	session.setAttribute("logo", logo);
	session.setAttribute("back", back);
	if(cu_des_num == re_des_num){
		
		return "d_manager_bb";
	}else{
		return "d_shop";
	}
	
	}
	

	@RequestMapping(value = "/d_manager_bb", method = RequestMethod.POST)
	public String d_manager_bb(@ModelAttribute("d_shop")d_shop d_shop,HttpSession session, Model model,HttpServletRequest request) throws IllegalStateException, IOException{
		String cate = request.getParameter("cate");
		Member m=(Member)session.getAttribute("member");
		m.getMem_id();
		MultipartFile uploadfile = d_shop.getUploadfile();
		System.out.println(uploadfile);
		 String fname = uploadfile.getOriginalFilename();
				
		
		if(cate.equals("1")){
			System.out.println("이건되나");
			fname = d_shop.getMem_id()+fname;
			if (fname.equals("")) {
			 d_shop.setDsh_logo("");
		 } else {
			 d_shop.setDsh_logo(fname);
		       

	        // 2. transferTo 함수 사용
		    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/d_shop_img/" + fname));
//			     uploadfile.transferTo(new File("C:/Users/oh/Documents/workspace-sts-3.5.1.RELEASE/INNO/WebContent/d_shop_img/" + fname));
		    	 //	Thumbnail image 만들기 시작		    	 
		    	 ParameterBlock pb = new ParameterBlock();
				 pb.add("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/d_shop_img/"+fname);	
//				 pb.add("C:/Users/oh/Documents/workspace-sts-3.5.1.RELEASE/INNO/WebContent/d_shop_img/"+fname);		
				 RenderedOp rOp = JAI.create("fileload", pb);
		 	 	 BufferedImage bi = rOp.getAsBufferedImage();
				 BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				 Graphics2D g = thumb.createGraphics();
				 g.drawImage(bi, 0, 0, 100, 100, null);	
				 File fileObj = new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/d_shop_img/sm_"+fname);
//				 File fileObj = new File("C:/Users/oh/Documents/workspace-sts-3.5.1.RELEASE/INNO/WebContent/d_shop_img/sm_"+fname);
				 ImageIO.write(thumb,"png", fileObj);
				
		  }
				
		d_shopdao.updateLogo(d_shop);
		}else{
			
			fname = "bg_"+d_shop.getMem_id()+fname;
			 if (fname.equals("")) {
				 d_shop.setDsh_back("");
			 } else {
				 d_shop.setDsh_back(fname);
			       

		        // 2. transferTo 함수 사용
			    	 uploadfile.transferTo(new File("/workspace-sts-3.4.0.RELEASE/INNO/WebContent/d_shop_img/" + fname));
//				     uploadfile.transferTo(new File("C:/Users/oh/Documents/workspace-sts-3.5.1.RELEASE/INNO/WebContent/d_shop_img/"+fname));
				     
			 }
		d_shopdao.updateBack(d_shop);
		}
			
				return "redirect:/spring/d_manager_bb";
		
	}
	@RequestMapping(value = "/d_manager_sales", method = RequestMethod.GET)
	public String d_manager_sales(HttpSession session,Model model) {
		int re_des_num =  (int) session.getAttribute("re_des_num");
		System.out.println(re_des_num);
		List<d_shop> list = d_shopdao.findDes_sales(re_des_num);
//		System.out.println(list);
		model.addAttribute("list", list);
		System.out.println(list);
		return "d_manager_sales"  ;
		
	}


}
	


