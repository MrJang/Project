package yjc.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


import yjc.spring.bean.Cart;
import yjc.spring.bean.Member;
import yjc.spring.bean.Purchase;
import yjc.spring.bean.product;
import yjc.spring.dao.IbatisCartDao;
import yjc.spring.dao.IbatisDesignerDao;
import yjc.spring.dao.IbatisMemberDao;
import yjc.spring.dao.IbatisProductDao;
import yjc.spring.dao.IbatisPurchaseDao;
@Controller
@SessionAttributes({"product","member"})


public class ShopController {
	
	@Autowired
	private IbatisMemberDao dao;
	@Autowired
	private IbatisProductDao pdao;
	@Autowired
	private IbatisPurchaseDao phsdao;
	@Autowired
	private IbatisDesignerDao ddao;
	@Autowired
	private IbatisCartDao cartdao;
	
	public int page_scale=8;
	public int total_record=0; 
	public int page_size=0;
	public int start_pageNum=0;
	public int start_row_num=0;
	public int end_pageNum=0;
	
	//TODO SHOP_MAIN
	//-------------------shop Main-----------------------
	@RequestMapping(value = "/shop_main", method = RequestMethod.GET)
	public String shop_main(HttpSession session, Model model) {
		
		System.out.println("shop_main");
		
		product product =new product();
		
		 List<product> list_best= pdao.Best_Product_select();
		 System.out.println(list_best.size());
		
		  
		 model.addAttribute("list_best", list_best);
					
		 List<product> list1=pdao.new_product_select(1);
		 List<product> list2=pdao.new_product_select(2);
		 List<product> list3=pdao.new_product_select(3);
	
		 		
		 	    model.addAttribute("list1",list1);
		 	    model.addAttribute("list2",list2);
		 	 	model.addAttribute("list3",list3); 	 	
			    model.addAttribute("product",product);
			    
		return "shop";
	}
	//TODO TOP_PRODUCT
    //---------------------------top_product---------------------
	@RequestMapping(value = "/top_product", method = RequestMethod.GET)
	public String top_product(@RequestParam int pageNum,int category_num,HttpSession session, Model model) {
		
		
		System.out.println("top_product");
		
		
		product product =new product();
	    model.addAttribute("product",product);
	    
	    if(pageNum==0){
	    	pageNum=1;
	    	
	    }
	    start_pageNum=1;
	    List<product> top_list = pdao.selectAllTop_product(1);
	    String mode = "nomal";
	    model.addAttribute("mode",mode);
	    if(top_list.size()==0){
	    	 String list_exist= "no";
	    	 model.addAttribute("list_exist",list_exist);
	    	 model.addAttribute("category_num",category_num);
	    }else{
	    total_record=top_list.size();
	    if(total_record%page_scale==0)
	    	page_size=total_record/page_scale;
	    else
	    	page_size=(total_record/page_scale)+1;
	    if(pageNum>page_size){
	    	pageNum=page_size;
	    }
	    end_pageNum=page_size;
	    	Integer[] page_list =new Integer[page_size];
	    	
	    	for(int i=0; i<page_size; i++){
	    		page_list[i]=i+1;
	    	}
	    start_row_num=(pageNum-1)*page_scale;
	    
	 
	    model.addAttribute("start_row_num",start_row_num);
	    model.addAttribute("start_pageNum",start_pageNum);
	    model.addAttribute("end_pageNum",end_pageNum);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("page_list",page_list);    
	    model.addAttribute("top_list",top_list);
	    model.addAttribute("category_num",category_num);
	    String list_exist= "yes";
   	 	model.addAttribute("list_exist",list_exist);
	    }
	    
	    return "top_product";
	}
	//TODO BOTTOMS_PRODUCT
	//------------------------bottoms_product---------------------
	@RequestMapping(value = "/bottoms_product", method = RequestMethod.GET)
	public String bottoms_product(@RequestParam int pageNum,int category_num,HttpSession session, Model model) {
		
		System.out.println("bottoms_product");
		product product =new product();
	    model.addAttribute("product",product);
	    
	    if(pageNum==0){
	    	pageNum=1;
	    	
	    }
	    start_pageNum=1;
	    List<product> bottoms_list = pdao.selectAllTop_product(2);
	    String mode = "nomal";
	    model.addAttribute("mode",mode);
	    if(bottoms_list.size()==0){
	    	 String list_exist= "no";
	    	 model.addAttribute("list_exist",list_exist);
	    	 model.addAttribute("category_num",category_num);
	    }else{
	    total_record=bottoms_list.size();
	    if(total_record%page_scale==0)
	    	page_size=total_record/page_scale;
	    else
	    	page_size=(total_record/page_scale)+1;
	    if(pageNum>page_size){
	    	pageNum=page_size;
	    }
	    end_pageNum=page_size;
	    	Integer[] page_list =new Integer[page_size];
	    	
	    	for(int i=0; i<page_size; i++){
	    		page_list[i]=i+1;
	    	}
	    start_row_num=(pageNum-1)*page_scale;

	 
	    model.addAttribute("start_row_num",start_row_num);
	    model.addAttribute("start_pageNum",start_pageNum);
	    model.addAttribute("end_pageNum",end_pageNum);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("page_list",page_list); 
	    model.addAttribute("bottoms_list",bottoms_list);
	    
	    String list_exist= "yes";
   	    model.addAttribute("list_exist",list_exist);
   	    model.addAttribute("category_num",category_num);
	    }
		return "bottoms_product";
	}
	//TODO ACCESSORY_PRODUCT
	//-----------------------accessory_product--------------------
	@RequestMapping(value = "/accessory_product", method = RequestMethod.GET)
	public String accessory_product(@RequestParam int pageNum,int category_num,HttpSession session, Model model) {
		
		System.out.println("accessory_product");
		product product =new product();
	    model.addAttribute("product",product);
	    
	    if(pageNum==0){
	    	pageNum=1;
	    }
	    start_pageNum=1;
	    List<product> accessory_list = pdao.selectAllTop_product(3);
	    total_record=accessory_list.size();
	    String mode = "nomal";
	    model.addAttribute("mode",mode);
	    
	    if(accessory_list.size()==0){
	    	 String list_exist= "no";
	    	 model.addAttribute("list_exist",list_exist);
	    	 model.addAttribute("category_num",category_num);
	    }else{
	    
	    if(total_record%page_scale==0)
	    	page_size=total_record/page_scale;
	    else
	    	page_size=(total_record/page_scale)+1;
	    if(pageNum>page_size){
	    	pageNum=page_size;
	    }
	    end_pageNum=page_size;
	    	Integer[] page_list =new Integer[page_size];
	    	
	    	for(int i=0; i<page_size; i++){
	    		page_list[i]=i+1;
	    	}
	    start_row_num=(pageNum-1)*page_scale;
	    
	    model.addAttribute("start_row_num",start_row_num);
	    model.addAttribute("start_pageNum",start_pageNum);
	    model.addAttribute("end_pageNum",end_pageNum);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("page_list",page_list); 
	    String list_exist= "yes";
        model.addAttribute("list_exist",list_exist);
        model.addAttribute("category_num",category_num);
	    } 
	   
	    model.addAttribute("accessory_list",accessory_list);
		return "accessory_product";
	}
	//TODO OTHERS
	//----------------------others--------------------------------
	@RequestMapping(value = "/others", method = RequestMethod.GET)
	public String ohters(@RequestParam int pageNum,int category_num,HttpSession session, Model model) {
		
		System.out.println("others");
		product product =new product();
	    model.addAttribute("product",product);
	    if(pageNum==0){
	    	pageNum=1;
	    	
	    }
	    start_pageNum=1;
	    List<product> others_list = pdao.selectAllTop_product(4);
	    String mode = "nomal";
	    model.addAttribute("mode",mode);
	    if(others_list.size()==0){
	    	 String list_exist= "no";
	    	 model.addAttribute("list_exist",list_exist);
	    	 model.addAttribute("category_num",category_num);
	    }else{
	    total_record=others_list.size();
	    if(total_record%page_scale==0)
	    	page_size=total_record/page_scale;
	    else
	    	page_size=(total_record/page_scale)+1;
	    if(pageNum>page_size){
	    	pageNum=page_size;
	    }
	    end_pageNum=page_size;
	    	Integer[] page_list =new Integer[page_size];
	    	
	    	for(int i=0; i<page_size; i++){
	    		page_list[i]=i+1;
	    	}
	    start_row_num=(pageNum-1)*page_scale;
	 
	    model.addAttribute("start_row_num",start_row_num);
	    model.addAttribute("start_pageNum",start_pageNum);
	    model.addAttribute("end_pageNum",end_pageNum);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("page_list",page_list); 
	    model.addAttribute("others_list",others_list);
	    
	    String list_exist= "yes";
   	    model.addAttribute("list_exist",list_exist);
   	    model.addAttribute("category_num",category_num);
	    }
		return "others";
	}
	//TODO SELECT_PRODUCT(POST)
	//--------------------------select_product(POST)---------------------
	@RequestMapping(value = "/select_product", method = RequestMethod.POST)
	public String select_product(@RequestParam int pageNum,int category_num,HttpSession session, Model model,HttpServletRequest request) {
		System.out.println("select_product");
	
		 String search_category=request.getParameter("search_category");
		 String search_content=request.getParameter("search_content");
		 product p =new product();
		 System.out.println("search_category : "+search_category+", search_content : "+search_content);
		 
		 if(pageNum==0){
		    	pageNum=1;
		    }
		    start_pageNum=1;
		    p.setSearch_category(search_category);
		    p.setSearch_content(search_content);
		    p.setPro_category(category_num);
		    System.out.println(p.getSearch_category()+","+p.getSearch_content()+","+p.getPro_category());
		    
		    List<product> search_list = pdao.search_product(p);
		    System.out.println(search_list);
		    if(search_list.size()==0){
		    	 String list_exist= "no";
		    	 model.addAttribute("list_exist",list_exist);
		    	 model.addAttribute("category_num",category_num);
		    }else{
		    total_record=search_list.size();
		    if(total_record%page_scale==0)
		    	page_size=total_record/page_scale;
		    else
		    	page_size=(total_record/page_scale)+1;
		    if(pageNum>page_size){
		    	pageNum=page_size;
		    }
		    end_pageNum=page_size;
		    	Integer[] page_list =new Integer[page_size];
		    	
		    	for(int i=0; i<page_size; i++){
		    		page_list[i]=i+1;
		    	}
		    start_row_num=(pageNum-1)*page_scale;
		 
		    model.addAttribute("start_row_num",start_row_num);
		    model.addAttribute("start_pageNum",start_pageNum);
		    model.addAttribute("end_pageNum",end_pageNum);
		    model.addAttribute("pageNum",pageNum);
		    model.addAttribute("page_list",page_list);
		    String list_exist= "yes";
	   	    model.addAttribute("list_exist",list_exist);
	   	    model.addAttribute("category_num",category_num);
	   	    model.addAttribute("search_category",search_category);
	   	    model.addAttribute("search_content",search_content);
	   	    String mode="select";
		    if(category_num==1){
		    	model.addAttribute("top_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"top_product";
		    }else if(category_num==2){
		    	model.addAttribute("bottoms_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"bottoms_product";
		    }else if(category_num==3){
		    	model.addAttribute("accessory_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"accessory_product";
		    }else if(category_num==4){
		    	model.addAttribute("others_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"others";
		    	}
		    }
		    return"redirect:/spring/shop_main";
	}
	//TODO SELECT_PRODUCT(GET)
	//--------------------select_product(GET)-----------------------------
	@RequestMapping(value = "/select_product", method = RequestMethod.GET)
	public String select_product(@RequestParam int pageNum,String mode,int category_num,String search_category,String search_content,HttpSession session, Model model,HttpServletRequest request) {
		System.out.println("select_product");
	
		 product p =new product();
		 System.out.println("search_category : "+search_category+", search_content : "+search_content);
		 
		 if(pageNum==0){
		    	pageNum=1;
		    }
		    start_pageNum=1;
		    p.setSearch_category(search_category);
		    p.setSearch_content(search_content);
		    p.setPro_category(category_num);
		    System.out.println(p.getSearch_category()+","+p.getSearch_content()+","+p.getPro_category());
		    
		    List<product> search_list = pdao.search_product(p);
		    System.out.println(search_list);
		    if(search_list.size()==0){
		    	 String list_exist= "no";
		    	 model.addAttribute("list_exist",list_exist);
		    	 model.addAttribute("category_num",category_num);
		    }else{
		    total_record=search_list.size();
		    if(total_record%page_scale==0)
		    	page_size=total_record/page_scale;
		    else
		    	page_size=(total_record/page_scale)+1;
		    if(pageNum>page_size){
		    	pageNum=page_size;
		    }
		    end_pageNum=page_size;
		    	Integer[] page_list =new Integer[page_size];
		    	
		    	for(int i=0; i<page_size; i++){
		    		page_list[i]=i+1;
		    	}
		    start_row_num=(pageNum-1)*page_scale;
		 
		    model.addAttribute("start_row_num",start_row_num);
		    model.addAttribute("start_pageNum",start_pageNum);
		    model.addAttribute("end_pageNum",end_pageNum);
		    model.addAttribute("pageNum",pageNum);
		    model.addAttribute("page_list",page_list);
		    String list_exist= "yes";
	   	    model.addAttribute("list_exist",list_exist);
	   	    model.addAttribute("category_num",category_num);
	   	    model.addAttribute("search_category",search_category);
	   	    model.addAttribute("search_content",search_content);
		    if(category_num==1){
		    	model.addAttribute("top_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"top_product";
		    }else if(category_num==2){
		    	model.addAttribute("bottoms_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"bottoms_product";
		    }else if(category_num==3){
		    	model.addAttribute("accessory_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"accessory_product";
		    }else if(category_num==4){
		    	model.addAttribute("others_list",search_list);
		    	model.addAttribute("mode",mode);
		    	return"others";
		    	}
		    }
		    return"redirect:/spring/shop_main";
	}
	//TODO PRODUCT_REGIST(GET)
	//------------------------product_regist(GET)-----------------------
	@RequestMapping(value = "/product_regist", method = RequestMethod.GET)
	public String product_regist(HttpSession session,int category_num,int pageNum, Model model) {
		
		System.out.println("product_regist");
		product product =new product();
		Member m = new Member();
	     m = (Member)session.getAttribute("member");
	   
	    
	     if(m.getMem_id()==null){
	    	 System.out.println("null");
	    	 return "wrong_permission";
	    	 
	     }else{
	    	 
	    	 if(m.getMem_auth().equals("1")){
	    			
	    			System.out.println(m.getMem_auth()); 
			 	    model.addAttribute("product",product);
			 	   
			 	    model.addAttribute("category_num", category_num);
			 	    model.addAttribute("pageNum", pageNum);
			 	    
			 		return "product_regist";
	    		 
	    	 }else if(m.getMem_auth().equals("2")){
	    		 
	    		 return "wrong_permission2";
	    	 }
	    	 	
	    	 return "wrong_permission";
	    	}
	    	 
	     }
	//TODO PRODUCT_REGIST(POST)    
	//----------------------product_regist(POST)-------------------
	@RequestMapping(value = "/product_regist", method = RequestMethod.POST)
	public String product_regist(@ModelAttribute ("product") product p,int pageNum,int category_num,HttpSession session, Model model ,HttpServletRequest request) throws IOException {
		
		System.out.println("product_regist");
//		String file_path = "C:/workspace/INNO/WebContent/shop_item/";
		String file_path = "/workspace-sts-3.4.0.RELEASE/INNO/WebContent/shop_item/";
		
		String tmp_file_path=session.getServletContext().getRealPath("/");
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = dayTime.format(new Date(System.currentTimeMillis()));
        
        SimpleDateFormat dayTime2 = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
        String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
        
    	Member m = new Member();
	    m = (Member)session.getAttribute("member");
	    
	    MultipartFile img_stream_1 =p.getImg_stream_1();
	    MultipartFile img_stream_2 =p.getImg_stream_2();
	    MultipartFile img_stream_3 =p.getImg_stream_3();
	    
	    if(img_stream_1.getOriginalFilename().equals("") || img_stream_2.getOriginalFilename().equals("") || img_stream_3.getOriginalFilename().equals("")){
	    	return"redirect:/spring/product_regist?category_num="+category_num+"&pageNum="+pageNum;
	    }else{		
	    
		p.setPro_date(time);
		System.out.println(m.getMem_id());
		Integer des_num=ddao.select_des_num(m.getMem_num());
		
		String ext1=img_stream_1.getOriginalFilename().substring(img_stream_1.getOriginalFilename().lastIndexOf(".")+1);
		String ext2=img_stream_2.getOriginalFilename().substring(img_stream_2.getOriginalFilename().lastIndexOf(".")+1);
		String ext3=img_stream_3.getOriginalFilename().substring(img_stream_3.getOriginalFilename().lastIndexOf(".")+1);
		
		System.out.println("파일 이름 : "+img_stream_1.getOriginalFilename());
		System.out.println("확장자 명 : "+ext1);
		
		String img_name_1=des_num+"_"+time2+"_1."+ext1;
		String img_name_2=des_num+"_"+time2+"_2."+ext2;
		String img_name_3=des_num+"_"+time2+"_3."+ext3;
		
		p.setPro_img(img_name_1);
		p.setPro_img_2(img_name_2);
		p.setPro_img_3(img_name_3);
		
		byte[] fileData1 = img_stream_1.getBytes();
		byte[] fileData2 = img_stream_2.getBytes();
		byte[] fileData3 = img_stream_3.getBytes();
		
		FileOutputStream output1 = new FileOutputStream(file_path+img_name_1);
		FileOutputStream output2 = new FileOutputStream(file_path+img_name_2);
		FileOutputStream output3 = new FileOutputStream(file_path+img_name_3);
		
		FileOutputStream output1_tmp = new FileOutputStream(tmp_file_path+"/shop_item/"+img_name_1);
		FileOutputStream output2_tmp = new FileOutputStream(tmp_file_path+"/shop_item/"+img_name_2);
		FileOutputStream output3_tmp = new FileOutputStream(tmp_file_path+"/shop_item/"+img_name_3);
		
		System.out.println(file_path+img_name_1);
		System.out.println(file_path+img_name_2);
		System.out.println(file_path+img_name_3);
		
		output1.write(fileData1);
        output1.close();
        
        output1_tmp.write(fileData1);
        output1_tmp.close();
        
        output2.write(fileData2);
        output2.close();
        
        output2_tmp.write(fileData2);
        output2_tmp.close();
		
        output3.write(fileData3);
        output3.close();
        
        output3_tmp.write(fileData3);
        output3_tmp.close();
		
		
		
		p.setDes_num(des_num);
		pdao.Insert_Product(p);
		model.addAttribute("product",p);
		
		
		if(category_num == 1){
			return "redirect:/spring/top_product?pageNum="+pageNum+"&category_num="+category_num;
		}else if(category_num == 2){
			return "redirect:/spring/bottoms_product?pageNum="+pageNum+"&category_num="+category_num;
		}else if(category_num == 3){
			return "redirect:/spring/accessory_product?pageNum="+pageNum+"&category_num="+category_num;
		}else if(category_num == 4){
			return "redirect:/spring/others?pageNum="+pageNum+"&category_num="+category_num;
		}
		return "product_regist";
	    }
	}
	//TODO PRODUCT_VIEW
	//------------------------product_view----------------------------
	@RequestMapping(value = "/product_view", method = RequestMethod.GET)
	public String product_view(HttpSession session,int category_num,int pageNum,Model model, int pro_num) {
		Member m=new Member();
		 m = (Member)session.getAttribute("member");
		
		System.out.println("product_view"+","+pro_num);
		product product =new product();
		
		model.addAttribute("product",product);
		List<product> product_view = pdao.select_view_product(pro_num);
		
		model.addAttribute("product_view",product_view);
		if(m.getMem_id()==null){
			int	des_num	=0;
			model.addAttribute("des_num", des_num);
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("category_num",category_num);
			return "product_view";
			
		}else{
			System.out.println("hellow");
			if(m.getMem_auth().equals("1")){
				
				 List<product> des_list=pdao.select_view_product(pro_num);
				 	int	des_num	 =  des_list.get(0).getDes_num();
				 	int My_design_num =ddao.select_des_num(m.getMem_num());
				 	System.out.println(des_num+","+My_design_num);
				 	model.addAttribute("des_num", des_num);
				 	model.addAttribute("My_design_num", My_design_num);
				 	model.addAttribute("pageNum",pageNum);
				 	model.addAttribute("category_num",category_num);
				 	
				 return "product_view";
			}
			int	des_num	=0;
			model.addAttribute("des_num", des_num);
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("category_num",category_num);
		}
		return "product_view";
		
	}
	//TODO SELET_PRODUCT_VIEW
	@RequestMapping(value = "/select_product_view", method = RequestMethod.GET)
	public String select_product_view(HttpSession session,String search_content,String search_category,int category_num,int pageNum,String mode,Model model, int pro_num) {
		Member m=new Member();
		 m = (Member)session.getAttribute("member");
		System.out.println("product_view"+","+pro_num);
		product product =new product();

		model.addAttribute("product",product);
		List<product> product_view = pdao.select_view_product(pro_num);
		
		model.addAttribute("product_view",product_view);
		if(m.getMem_id()==null){
			int	des_num	=0;
			model.addAttribute("des_num", des_num);
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("category_num",category_num);
			model.addAttribute("search_content",search_content);
		 	model.addAttribute("search_category",search_category);
		 	model.addAttribute("mode",mode);
			return "product_view";
			
		}else{
			System.out.println("hellow");
			if(m.getMem_auth().equals("1")){
				
				 List<product> des_list=pdao.select_view_product(pro_num);
				 	int	des_num	 =  des_list.get(0).getDes_num();
				 	int My_design_num =ddao.select_des_num(m.getMem_num());
				 	System.out.println(des_num+","+My_design_num);
				 	model.addAttribute("des_num", des_num);
				 	model.addAttribute("My_design_num", My_design_num);
				 	model.addAttribute("pageNum",pageNum);
				 	model.addAttribute("category_num",category_num);
				 	model.addAttribute("search_content",search_content);
				 	model.addAttribute("search_category",search_category);
				 	model.addAttribute("mode",mode);
				 return "product_view";
			}
			int	des_num	=0;
			model.addAttribute("des_num", des_num);
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("category_num",category_num);
			model.addAttribute("search_content",search_content);
		 	model.addAttribute("search_category",search_category);
		 	model.addAttribute("mode",mode);
		}
		return "product_view";
		
	}
	//TODO PRODUCT_PURCHASE(GET)
	//-----------------------product_purchase(GET)------------------------
	@RequestMapping(value = "/product_purchase", method = RequestMethod.GET)
	public String product_purchase(HttpSession session, Model model, int pro_num,int pageNum, int category_num) {
		
		System.out.println("product_purchase"+","+pro_num);
		product product =new product();
		Purchase purchase = new Purchase(); 
		model.addAttribute("product",product);
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("category_num",category_num);
		
		Member m = new Member();
	     m = (Member)session.getAttribute("member");
		
		     if(m.getMem_id()==null){
		    	 return "wrong_permission";
		     }
		     else
		     {
		    	 List<product> purchase_enroll = pdao.select_view_product(pro_num);
		    	 int product_amount=purchase_enroll.get(0).getPro_amount();
		    	 String mem_name = m.getMem_name();
		    	 String mem_addr = m.getMem_addr();
		    	 String mem_phone = m.getMem_phone();
		    	 String[] phone = mem_phone.split("-");
		    	 String Phone1 =phone[0];
		    	 String Phone2 =phone[1];
		    	 String Phone3 =phone[2];
		    	 String post  =m.getMem_post();
		    	 String[] post_num = post.split("-");
		    	 String post_num1	=	post_num[0];
		    	 String post_num2	=	post_num[1];
		   
		    	 
		    
		    	 
		    	 List<Integer> product_amounts=new ArrayList<Integer>();
		    	 	for(int i=1; i<product_amount+1; i++){
		    	 		product_amounts.add(i);
		    	 	}
		    	 model.addAttribute("Phone1", Phone1);
		    	 model.addAttribute("Phone2", Phone2);
		    	 model.addAttribute("Phone3", Phone3);
		    	 model.addAttribute("mem_addr",mem_addr);
		    	 model.addAttribute("mem_name",mem_name);
		    	 model.addAttribute("product_amounts",product_amounts); 
		    	 model.addAttribute("purchase_enroll",purchase_enroll);
		    	 model.addAttribute("post_num1",post_num1); 
		    	 model.addAttribute("post_num2",post_num2); 
		    	 model.addAttribute("purchase",purchase);
		    	 return "product_purchase";
		     }  

		}
	//-----------------------product_purchase_modify(GET)------------------------
		@RequestMapping(value = "/product_purchase_modify", method = RequestMethod.GET)
		public String product_purchase_modify(HttpSession session, Model model, int p_num,int pageNum, int category_num) {
			
			System.out.println("product_purchase_modify"+","+p_num);
			product product =new product();
			Purchase purchase = new Purchase(); 
			model.addAttribute("product",product);
			
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("category_num",category_num);
			
			Member m = new Member();
		     m = (Member)session.getAttribute("member");
			
			     if(m.getMem_id()==null){
			    	 return "wrong_permission";
			     }
			     else
			     {
			    	 List<Purchase> purchase_modify = phsdao.Purchase_view(p_num);
			    	 String mem_name =m.getMem_name();
			         String purchase_phone_num=purchase_modify.get(0).getP_phone_num();
			    	 String[] phone = purchase_phone_num.split("-");
			    	 String Phone1 =phone[0];
			    	 String Phone2 =phone[1];
			    	 String Phone3 =phone[2];
			    	 String post = purchase_modify.get(0).getP_post_num();
			    	 String[] post_num = post.split("-");
			    	 String post_num1	=	post_num[0];
			    	 String post_num2	=	post_num[1];
			    	
			    	
			    	 model.addAttribute("Phone1", Phone1);
			    	 model.addAttribute("Phone2", Phone2);
			    	 model.addAttribute("Phone3", Phone3);
			    	 model.addAttribute("mem_name",mem_name);
			    	 model.addAttribute("category_num",category_num);
			    	 model.addAttribute("pageNum",pageNum);
			    	 model.addAttribute("purchase_modify",purchase_modify);
			    	 model.addAttribute("post_num1",post_num1); 
			    	 model.addAttribute("post_num2",post_num2); 
			    	 model.addAttribute("purchase",purchase);
			    	 
			    	 return "purchase_modify";
			     }  

			}
		@RequestMapping(value = "/product_purchase_modify", method = RequestMethod.POST)
		public String product_purchase_modify(@ModelAttribute ("Purchase") Purchase phs,HttpSession session,int pageNum, int category_num, HttpServletRequest request) {
				
			
				String receiver=request.getParameter("receiver");
				String post_num=request.getParameter("post_num1")+"-"+request.getParameter("post_num2");
				String addr=request.getParameter("addr");
				String phone_num=request.getParameter("phone_num1")+"-"+request.getParameter("phone_num2")+"-"+request.getParameter("phone_num3");
				int p_num=Integer.parseInt(request.getParameter("p_num"));
				phs.setP_num(p_num);
		        phs.setP_address(addr);
		        phs.setP_receiver(receiver);
		        phs.setP_post_num(post_num);
		        phs.setP_phone_num(phone_num);
		        
		       
		        phsdao.update_purchase(phs);
		//TODO 
		        return"redirect:/spring/purchase_view?pageNum="+pageNum+"&category_num="+category_num+"&p_num="+p_num;
		        		
		      
		}
	//TODO PRODUCT_REGIST(POST)
	//-----------------------------product_purchase(POST)----------------------
	@RequestMapping(value = "/product_purchase", method = RequestMethod.POST)
	public String product_purchase(@ModelAttribute ("Purchase") Purchase phs,HttpSession session,int pro_num, HttpServletRequest request) {
			
		
		 	Member m =  (Member)session.getAttribute("member");
		 	int mem_num	=	m.getMem_num();
		
		 	
			String receiver=request.getParameter("receiver");
			String post_num=request.getParameter("post_num1")+"-"+request.getParameter("post_num2");
			String addr=request.getParameter("addr");
			String phone_num=request.getParameter("phone_num1")+"-"+request.getParameter("phone_num2")+"-"+request.getParameter("phone_num3");
			int des_num=pdao.des_select(request.getParameter("pro_num"));
			int minus_amount=Integer.parseInt(request.getParameter("p_amount"));
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	        String time = dayTime.format(new Date(System.currentTimeMillis()));
	        
	        String status="입금대기";
			System.out.println(mem_num);
	        phs.setMem_num(mem_num);
	        phs.setP_address(addr);
	        phs.setP_date(time);
	        phs.setP_receiver(receiver);
	        phs.setP_post_num(post_num);
	        phs.setDes_num(des_num);
	        phs.setP_phone_num(phone_num);
	        phs.setP_status(status);
	       
	        phsdao.Insert_Purchase(phs);
	        
	       
	        System.out.println(minus_amount+","+pro_num);
	        
	        product p =new product();
	        p.setMinus_amount(minus_amount);
	        p.setPro_num(pro_num);
	     
	       
	        pdao.Update_amount(p);
	//TODO 
	        return"redirect:/spring/customer_purchase_list?category_num=6&pageNum=1";
	        		
	      
	}
	//TODO CART_REGIST(GET)
	//---------------------------cart_regist(GET)-----------------------
	@RequestMapping(value = "/cart_regist", method = RequestMethod.GET)
	public String cart_regist(@ModelAttribute ("Purchase") Purchase phs,HttpSession session,int pro_num,int category_num, HttpServletRequest request) {
			
			Member m =  (Member)session.getAttribute("member");
		 	int mem_num	=	m.getMem_num();
		 	System.out.println(mem_num);
		 	Cart cart =new Cart();
		 	cart.setMem_num(mem_num);
		 	cart.setPro_num(pro_num);
		 	
		 	cartdao.Insert_Cart(cart);
			
		 return "redirect:/spring/cart_list?pageNum=1&category_num=5";
	}
	//TODO CART_LIST(GET)
	//-----------------------cart_list------------------------------
	@RequestMapping(value = "/cart_list", method = RequestMethod.GET)
	public String cart_list(Model model,HttpSession session,int pageNum,int category_num, HttpServletRequest request) {
			
			Member m =  (Member)session.getAttribute("member");
			System.out.println(m);
			if(m.getMem_id()==null){
				return "wrong_permission";
			}else{
			System.out.println("hellow");
		 	int mem_num	=	m.getMem_num();
		 	System.out.println(mem_num);
			Cart cart =new Cart();
			page_scale=5;
		 	List<product> cart_list=cartdao.cart_list(mem_num);
		 	System.out.println(cart_list);
		 	model.addAttribute("category_num",category_num);
		 	
		 	if(cart_list.size()==0){
		    	 String list_exist= "no";
		    	 model.addAttribute("list_exist",list_exist);
		    }else{
		    total_record=cart_list.size();
		    if(total_record%page_scale==0)
		    	page_size=total_record/page_scale;
		    else
		    	page_size=(total_record/page_scale)+1;
		    if(pageNum>page_size){
		    	pageNum=page_size;
		    }
		    end_pageNum=page_size;
		    	Integer[] page_list =new Integer[page_size];
		    	
		    	for(int i=0; i<page_size; i++){
		    		page_list[i]=i+1;
		    	}
		    start_row_num=(pageNum-1)*page_scale;
		    System.out.println("page_size :"+page_size);
		    System.out.println("pageNum :"+pageNum);
		    System.out.println(page_list.length);
		 
		    model.addAttribute("start_row_num",start_row_num);
		    model.addAttribute("start_pageNum",start_pageNum);
		    model.addAttribute("end_pageNum",end_pageNum);
		    model.addAttribute("pageNum",pageNum);
		    model.addAttribute("page_list",page_list); 
		    
		    String list_exist= "yes";
	   	    model.addAttribute("list_exist",list_exist);
		 	model.addAttribute("cart_list",cart_list);
		 	model.addAttribute("cart",cart);
		    }		 	
		 return "cart_list";
		}
	}
	//TODO CART_DELETE(GET)
	//---------------------cart_delete--------------------------------
	@RequestMapping(value = "/cart_delete", method = RequestMethod.GET)
	public String cart_delete(Model model,HttpSession session, int cart_num,int category_num,HttpServletRequest request) {
			
			Member m =  (Member)session.getAttribute("member");
			System.out.println("hellow");
		 	int mem_num	=	m.getMem_num();
		 	System.out.println(mem_num);
			cartdao.cart_delete(cart_num);
			
			
		 return "redirect:/spring/cart_list?pageNum=1&category_num=5";
	}
	
	//TODO PRODUCT_MODIFY(GET)
	//-----------------------product_modify-----------------------
	@RequestMapping(value = "/product_modify", method = RequestMethod.GET)
	public String product_modify(HttpSession session,int pageNum,int category_num, Model model, int pro_num) {
		
		System.out.println("product_modify");
		product product =new product();
		Member m = new Member();
	     m = (Member)session.getAttribute("member");
	   
	    
	     if(m.getMem_id()==null){
	    	 System.out.println("null");
	    	 return "wrong_permission";
	     }else{
	    	 
	    	 if(m.getMem_auth().equals("1")){
	    			
	    			System.out.println(m.getMem_auth()); 
	    			List<product> pro_list = pdao.select_view_product(pro_num);
	    			
			 	    model.addAttribute("product",product);
			 	    model.addAttribute("pro_list",pro_list);
			 	    model.addAttribute("pageNum", pageNum);
			 	    model.addAttribute("category_num", category_num);
			 	    
			 		return "product_modify";
	    		 
	    	 }else if(m.getMem_auth().equals("2")){
	    		 
	    		 return "wrong_permission2";
	    	 }
	    	 	
	    	 return "wrong_permission";
	    	}
		
	     }
	//TODO PRODUCT_MODIFY(POST)    
	//-----------------------product_modify------------------------------
	@RequestMapping(value = "/product_modify", method = RequestMethod.POST)
	public String product_modify(@ModelAttribute ("product") product p,int pageNum,int category_num, HttpSession session, Model model ,HttpServletRequest request) throws IOException {
		
		System.out.println("product_modify2");
//		String file_path = "C:/workspace/INNO/WebContent/shop_item/";
		String file_path = "/workspace-sts-3.4.0.RELEASE/INNO/WebContent/shop_item/";
		String tmp_file_path=session.getServletContext().getRealPath("/");
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = dayTime.format(new Date(System.currentTimeMillis()));
        int pro_num = Integer.parseInt(request.getParameter("pro_num"));
    	Member m = new Member();
	     m = (Member)session.getAttribute("member");
	     
	    product p2= new product();
	    p2.setPro_num(pro_num);
	    
	    List<product> pro_list=pdao.select_view_product(pro_num);
	    
	   String original_name= pro_list.get(0).getPro_img();
	   String original_name2= pro_list.get(0).getPro_img_2();
	   String original_name3= pro_list.get(0).getPro_img_3();
	    
	     SimpleDateFormat dayTime2 = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
	        String time2 = dayTime2.format(new Date(System.currentTimeMillis()));
	        
	    int pro_category=Integer.parseInt(request.getParameter("pro_category")); 
	    System.out.println(pro_category);
	    
	    MultipartFile img_stream_1 =p.getImg_stream_1();
	    MultipartFile img_stream_2 =p.getImg_stream_2();
	    MultipartFile img_stream_3 =p.getImg_stream_3();
	    
	    Integer des_num=ddao.select_des_num(m.getMem_num());
		
		String ext1=img_stream_1.getOriginalFilename().substring(img_stream_1.getOriginalFilename().lastIndexOf(".")+1);
		String ext2=img_stream_2.getOriginalFilename().substring(img_stream_2.getOriginalFilename().lastIndexOf(".")+1);
		String ext3=img_stream_3.getOriginalFilename().substring(img_stream_3.getOriginalFilename().lastIndexOf(".")+1);
		
		System.out.println("파일 이름 : "+img_stream_1.getOriginalFilename());
		System.out.println("확장자 명 : "+ext1);
		
		String img_name_1=des_num+"_"+time2+"_1."+ext1;
		String img_name_2=des_num+"_"+time2+"_2."+ext2;
		String img_name_3=des_num+"_"+time2+"_3."+ext3;
	    
	    if(p.getImg_stream_1().getOriginalFilename()==""){
	    	
	    }else{
	    	File del_file1= new File(file_path+original_name);
	    	del_file1.delete();
	    	byte[] fileData1 = img_stream_1.getBytes();
	    	FileOutputStream output1 = new FileOutputStream(file_path+img_name_1);
	    	FileOutputStream output1_tmp = new FileOutputStream(tmp_file_path+"/shop_item/"+img_name_1);
	    
	    	output1.write(fileData1);
	        output1.close();
	        
	        output1_tmp.write(fileData1);
	        output1_tmp.close();
	    	
	    	p2.setPro_img(img_name_1);
	    	pdao.update_product_img(p2);
	    }
	    if(p.getImg_stream_2().getOriginalFilename()==""){
	    	
	    }else{
	    	File del_file2= new File(file_path+original_name2);
	    	del_file2.delete();
	    	byte[] fileData2 = img_stream_2.getBytes();
	    	FileOutputStream output2 = new FileOutputStream(file_path+img_name_2);
	    	FileOutputStream output2_tmp = new FileOutputStream(tmp_file_path+"/shop_item/"+img_name_2);
	    
	    	 output2.write(fileData2);
	         output2.close();
	         
	         output2_tmp.write(fileData2);
	         output2_tmp.close();
	         p2.setPro_img_2(img_name_2);
	         pdao.update_product_img2(p2);
	    }
	    if(p.getImg_stream_3().getOriginalFilename()==""){
	    	
	    }else{
	    	
	    	File del_file3= new File(file_path+original_name3);
	    	del_file3.delete();
	    	
	    	byte[] fileData3 = img_stream_3.getBytes();
	    	FileOutputStream output3 = new FileOutputStream(file_path+img_name_3);
	    	FileOutputStream output3_tmp = new FileOutputStream(tmp_file_path+"/shop_item/"+img_name_3);
	    	
	    	output3.write(fileData3);
	        output3.close();
	        
	        output3_tmp.write(fileData3);
	        output3_tmp.close();
	    	p2.setPro_img_3(img_name_3);
	    	pdao.update_product_img3(p2);
	    }
	    p.setPro_category(pro_category);
		p.setPro_date(time);
		
		String  pro_explain=request.getParameter("pro_explain");
	
		p.setPro_explain(pro_explain);
		p.setDes_num(des_num);
		p.setPro_num(pro_num);
		
		pdao.update_product(p);
		model.addAttribute("product",p);
		
	
			return "redirect:/spring/product_view?pageNum="+pageNum+"&category_num="+category_num+"&pro_num="+pro_num;
	
	}
	@RequestMapping(value = "/customer_purchase_list", method = RequestMethod.GET)
	public String customer_purchsae_list(@RequestParam int pageNum,int category_num,HttpSession session, Model model) {
		
		System.out.println("customer_purchsae_list");
		Member m= new Member();
			   m=(Member)session.getAttribute("member");
	    page_scale=8;//?�쐻?�윪�몭琉꾩삕�얠쥉異�?�돸?�굲?�쐻?�뼩?遊욥�얠쥉異�?鍮�?�굲
	    product product =new product();
	    model.addAttribute("product",product);
	    if(pageNum==0){
	    	pageNum=1;
	    	
	    }
	    if(m.getMem_id()==null){
	    	return"wrong_permission";
	    }else{
	    	start_pageNum=1;
	    	List<Purchase> purchase_list = phsdao.Purchase_list(m.getMem_num());
	    	String mode = "nomal";
	
	    	model.addAttribute("mode",mode);
	    	if(purchase_list.size()==0){
	    		String list_exist= "no";
	    		model.addAttribute("list_exist",list_exist);
	    		model.addAttribute("category_num",category_num);
	    	}else{
	    		total_record=purchase_list.size();
	    		if(total_record%page_scale==0)
	    			page_size=total_record/page_scale;
	    		else
	    			page_size=(total_record/page_scale)+1;
	    		if(pageNum>page_size){
	    			pageNum=page_size;
	    			}
	    			end_pageNum=page_size;
	    			Integer[] page_list =new Integer[page_size];
	    	
	    			for(int i=0; i<page_size; i++){
	    			page_list[i]=i+1;
	    			}
	    			start_row_num=(pageNum-1)*page_scale;
	    		
	 
	    			model.addAttribute("start_row_num",start_row_num);
	    			model.addAttribute("start_pageNum",start_pageNum);
	    			model.addAttribute("end_pageNum",end_pageNum);
	    			model.addAttribute("pageNum",pageNum);
	    			model.addAttribute("page_list",page_list);    
	    			model.addAttribute("purchase_list",purchase_list);
	    			model.addAttribute("category_num",category_num);
	    			String list_exist= "yes";
	    			model.addAttribute("list_exist",list_exist);
	    			}
	    			return "customer_purchase_list";
	    	}
		}
	@RequestMapping(value = "/purchase_view", method = RequestMethod.GET)
	public String purchase_view(HttpSession session, Model model, int p_num,int pageNum, int category_num) {
			
		System.out.println("product_view"+","+p_num);
		product product =new product();
		Purchase purchase = new Purchase(); 
		model.addAttribute("product",product);
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("category_num",category_num);
		
		Member m = new Member();
	     m = (Member)session.getAttribute("member");
		
		     if(m.getMem_id()==null){
		    	 return "wrong_permission";
		     }
		     else
		     {
		    	 List<Purchase> purchase_view = phsdao.Purchase_view(p_num);
		    	 String mem_name =m.getMem_name();
		         String purchase_phone_num=purchase_view.get(0).getP_phone_num();
		    	 String[] phone = purchase_phone_num.split("-");
		    	 String Phone1 =phone[0];
		    	 String Phone2 =phone[1];
		    	 String Phone3 =phone[2];
		    	 String post = purchase_view.get(0).getP_post_num();
		    	 String[] post_num = post.split("-");
		    	 String post_num1	=	post_num[0];
		    	 String post_num2	=	post_num[1];
		    	

		    	
		    	 model.addAttribute("Phone1", Phone1);
		    	 model.addAttribute("Phone2", Phone2);
		    	 model.addAttribute("Phone3", Phone3);
		    	 model.addAttribute("mem_name",mem_name);
		    	 model.addAttribute("purchase_view",purchase_view);
		    	 model.addAttribute("post_num1",post_num1); 
		    	 model.addAttribute("post_num2",post_num2); 
		    	 model.addAttribute("purchase",purchase);
		    	 
		    	 return "purchase_view";
		     }  

	}
	@RequestMapping(value = "/select_purchase_view", method = RequestMethod.GET)
	public String select_purchase_view(HttpSession session, Model model, int p_num,int pageNum, int category_num,String mode,String search_category,String search_content) {
			
		System.out.println("product_purchase"+","+p_num);
		product product =new product();
		Purchase purchase = new Purchase(); 
		model.addAttribute("product",product);
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("category_num",category_num);
		
		Member m = new Member();
	     m = (Member)session.getAttribute("member");
		
		     if(m.getMem_id()==null){
		    	 return "wrong_permission";
		     }
		     else
		     {
		    	 List<Purchase> purchase_view = phsdao.Purchase_view(p_num);
		    	 String mem_name =m.getMem_name();
		         String purchase_phone_num=purchase_view.get(0).getP_phone_num();
		    	 String[] phone = purchase_phone_num.split("-");
		    	 String Phone1 =phone[0];
		    	 String Phone2 =phone[1];
		    	 String Phone3 =phone[2];
		    	 String post = purchase_view.get(0).getP_post_num();
		    	 String[] post_num = post.split("-");
		    	 String post_num1	=	post_num[0];
		    	 String post_num2	=	post_num[1];
		    	

		    	 model.addAttribute("Phone1", Phone1);
		    	 model.addAttribute("Phone2", Phone2);
		    	 model.addAttribute("Phone3", Phone3);
		    	 model.addAttribute("mem_name",mem_name);
		    	 model.addAttribute("purchase_view",purchase_view);
		    	 model.addAttribute("search_category",search_category);
		    	 model.addAttribute("search_content",search_content);
		    	 model.addAttribute("post_num1",post_num1); 
		    	 model.addAttribute("post_num2",post_num2); 
		    	 model.addAttribute("purchase",purchase);
		    	 model.addAttribute("mode",mode);
		    	 
		    	 return "purchase_view";
		     }  

	}

@RequestMapping(value = "/select_purchase", method = RequestMethod.POST)
public String select_purchase(@RequestParam int pageNum,String mode,int category_num,String search_category,String search_content,HttpSession session, Model model,HttpServletRequest request) {
	System.out.println("select_purchase");

	 Purchase p =new Purchase();
	 System.out.println("search_category : "+search_category+", search_content : "+search_content);
	 Member m = new Member();
     m = (Member)session.getAttribute("member");
	 if(pageNum==0){
	    	pageNum=1;
	    }
	    start_pageNum=1;
	    p.setSearch_category(search_category);
	    p.setSearch_content(search_content);
	    p.setMem_num(m.getMem_num());
	    System.out.println(p.getSearch_category()+","+p.getSearch_content());
	    
	    page_scale=8;
	    List<Purchase> search_list =phsdao.Purchase_select(p);
	    System.out.println(search_list);
	    if(search_list.size()==0){
	    	 String list_exist= "no";
	    	 model.addAttribute("list_exist",list_exist);
	    	 model.addAttribute("category_num",category_num);
	    }else{
	    total_record=search_list.size();
	    if(total_record%page_scale==0)
	    	page_size=total_record/page_scale;
	    else
	    	page_size=(total_record/page_scale)+1;
	    if(pageNum>page_size){
	    	pageNum=page_size;
	    }
	    end_pageNum=page_size;
	    	Integer[] page_list =new Integer[page_size];
	    	
	    	for(int i=0; i<page_size; i++){
	    		page_list[i]=i+1;
	    	}
	    start_row_num=(pageNum-1)*page_scale;
	 
	    model.addAttribute("start_row_num",start_row_num);
	    model.addAttribute("start_pageNum",start_pageNum);
	    model.addAttribute("end_pageNum",end_pageNum);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("page_list",page_list);
	    String list_exist= "yes";
   	    model.addAttribute("list_exist",list_exist);
   	    model.addAttribute("category_num",category_num);
   	    model.addAttribute("search_category",search_category);
   	    model.addAttribute("search_content",search_content);
	    if(category_num==6){
	    	model.addAttribute("purchase_list",search_list);
	    	model.addAttribute("mode",mode);
	    	return"customer_purchase_list";
	    	}
	    }
	return "shop";	
	}
@RequestMapping(value = "/select_purchase", method = RequestMethod.GET)
public String select_purchase(@RequestParam int pageNum,String mode,int category_num,String search_category,String search_content,HttpSession session, Model model) {
	System.out.println("select_purchase");

	 Purchase p =new Purchase();
	 System.out.println("search_category : "+search_category+", search_content : "+search_content);
	 Member m = new Member();
     m = (Member)session.getAttribute("member");
	 if(pageNum==0){
	    	pageNum=1;
	    }
	    start_pageNum=1;
	    p.setSearch_category(search_category);
	    p.setSearch_content(search_content);
	    p.setMem_num(m.getMem_num());
	    System.out.println(p.getSearch_category()+","+p.getSearch_content());
	    
	    page_scale=8;
	    List<Purchase> search_list =phsdao.Purchase_select(p);
	    System.out.println(search_list);
	    if(search_list.size()==0){
	    	 String list_exist= "no";
	    	 model.addAttribute("list_exist",list_exist);
	    	 model.addAttribute("category_num",category_num);
	    }else{
	    total_record=search_list.size();
	    if(total_record%page_scale==0)
	    	page_size=total_record/page_scale;
	    else
	    	page_size=(total_record/page_scale)+1;
	    if(pageNum>page_size){
	    	pageNum=page_size;
	    }
	    end_pageNum=page_size;
	    	Integer[] page_list =new Integer[page_size];
	    	
	    	for(int i=0; i<page_size; i++){
	    		page_list[i]=i+1;
	    	}
	    start_row_num=(pageNum-1)*page_scale;
	 
	    model.addAttribute("start_row_num",start_row_num);
	    model.addAttribute("start_pageNum",start_pageNum);
	    model.addAttribute("end_pageNum",end_pageNum);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("page_list",page_list);
	    String list_exist= "yes";
   	    model.addAttribute("list_exist",list_exist);
   	    model.addAttribute("category_num",category_num);
   	    model.addAttribute("search_category",search_category);
   	    model.addAttribute("search_content",search_content);
	    if(category_num==6){
	    	model.addAttribute("purchase_list",search_list);
	    	model.addAttribute("mode",mode);
	    	return"customer_purchase_list";
	    	}
	    }
	return "shop";	
	}
@RequestMapping(value = "/purchase_delete", method = RequestMethod.GET)
	public String purchase_delete(@RequestParam int p_num,HttpSession session, Model model) {
			product p=new product();
			List<Purchase> phs=phsdao.Purchase_view(p_num);
			int amount=phs.get(0).getP_amount();
			int pro_num=phs.get(0).getPro_num();
			
			p.setPlus_amount(amount);
			p.setPro_num(pro_num);
			pdao.Update_amount2(p);
			phsdao.purchase_delete(p_num);
		

		return"redirect:/spring/customer_purchase_list?pageNum=1&category_num=6";
	}

@RequestMapping(value = "/purchase_complete", method = RequestMethod.GET)
public String purchase_complete(@RequestParam int p_num,HttpSession session, Model model) {
		Purchase purchase=new Purchase();
		
		String status="거래완료";
		purchase.setP_status(status);
		purchase.setP_num(p_num);
		phsdao.update_purchase2(purchase);
	

	return"redirect:/spring/customer_purchase_list?pageNum=1&category_num=6";
}

@RequestMapping(value = "/delete_product", method = RequestMethod.GET)
public String delete_product(@RequestParam int pro_num, int category_num,HttpSession session, Model model) {
		pdao.delete_product(pro_num);
		
		if(category_num==1){
			return"redirect:/spring/top_product?pageNum=1&category_num=1";
		}else if(category_num==1){
			return"redirect:/spring/bottoms_product?pageNum=1&category_num=2";
		}else if(category_num==3){
			return"redirect:/spring/accessory_product?pageNum=1&category_num=3";
		}else if(category_num==4){
			return"redirect:/spring/others?pageNum=1&category_num=4";
		}

		return"redirect:/spring/shop_main";
	}
}