package yjc.wdb.safe.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.FemaleBean;
import yjc.wdb.safe.bean.SchedulerBean;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.dao.ChildrenDao;
import yjc.wdb.safe.dao.FemaleDao;
import yjc.wdb.safe.dao.GcmDao;
import yjc.wdb.safe.dao.SchedulerDao;
import yjc.wdb.safe.dao.memberDao;

@Controller
@SessionAttributes("sche")
public class SchedulerController {
   @Autowired SchedulerDao dao;
   @Autowired memberDao m_dao;
   @Autowired FemaleDao f_dao;
   @Autowired ChildrenDao c_dao;
   
   
         
   
      
public String getDecodingUTF(String word){
        
        String decodedWord = null;
        
        if (word == null)
            return null;
        else {
            byte[] b;
            try {
                b = word.getBytes("8859_1");
                CharsetDecoder decoder = Charset.forName("UTF-8").newDecoder();
                try {
                    CharBuffer r = decoder.decode(ByteBuffer.wrap(b));
                    decodedWord = r.toString();
                } catch (CharacterCodingException e) {
                    decodedWord = new String(b, "EUC-KR");
                }
            } catch (UnsupportedEncodingException e1) {
                e1.printStackTrace();
            }
        }
        return decodedWord;
    } 
   
   @RequestMapping(value="/start_nfc")
   public String start_scheduler(Model model,HttpServletRequest req){
      String content = req.getParameter("content");
      SchedulerBean sche = new SchedulerBean();
      FemaleBean m = new FemaleBean();
      String rew = content.split("/")[0];
        
        
        if(rew.equals("1")) {
        
           String e_name = content.split("/")[1];
           System.out.println(e_name);
           sche.setE_name(e_name);
           model.addAttribute("sche",sche);
           
            
        }
        
        else  if(rew.equals("2")) {
           
//          m.setPhone("010-2310-1252");
//           m.setCar_num("15猷�3643��");
//           m.setCategory(4);
//           m.setCrime_time("2014����3��5:20,2014��7��3��15:40");
//           m.setDrive("2Km,12遺�7600��");
//           m.setNotice("O");
//           
//           model.addAttribute("m",m);
//           f_dao.m_nfc(m);
//           return "redirect:/safe/m_safe_Main";s
           }
        
        return "m_schedulerScan.scheduler";
      
   }
   
   @RequestMapping(value="/getin_scheduler")
      public String server1(Model model, String s_id, String e_name, String lat, String lon){
           
          SchedulerBean sche = dao.latelyScheduler(s_id);
         
          
            
            if(sche == null){ 
              
               String start = lat + "/" + lon;
               memberBean s = m_dao.loginMember(s_id);
               sche = new SchedulerBean();
               sche.setS_id(s_id);
               sche.setE_name(e_name);
               sche.setCh_name(s.getE_name());
               sche.setStartpoint(start);
               dao.insertScheduler(sche);
              
               model.addAttribute("sche",sche);
               return "redirect:/safe/alert_child?home2=g";
            }
            
            
            if(sche.getStart_time() != null && sche.getAttendance() == null){
               String end = lat + "/" + lon;
               sche.setEndpoint(end);
                dao.updateGetout_time(sche);
               
                return "redirect:/safe/alert_child?home2=a";
               
            }else if(sche != null){
               
               String start = lat + "/" + lon;
                  sche = new SchedulerBean();
                  memberBean s = m_dao.loginMember(s_id);
                  sche.setS_id(s_id);
                  sche.setE_name(e_name);
                  sche.setCh_name(s.getE_name());
                  sche.setStartpoint(start);
                 
                  dao.insertScheduler(sche);
                  model.addAttribute("sche", sche);
               return "redirect:/safe/alert_child?home2=g";
            }
            
            
         return "redirect:/safe/scan_success";
         
        
      }
   
    @RequestMapping(value="/scan_success")
      public String schedulerList() {
         
         return "m_scheSuccess.scheduler";
      }
   
   @RequestMapping(value="/m_schedulerList",method=RequestMethod.GET)
   public String m_safe_scheduler(@RequestParam String s_id, Model model){
      
      List<SchedulerBean> list = dao.SchedulerList(s_id);
      model.addAttribute("list",list);
      return "m_schedulerList.scheduler";
   }
   
   @RequestMapping(value="/schedulerList",method=RequestMethod.GET)
   public String safe_scheduler(@RequestParam String s_id, Model model, HttpSession session){
      
	   List<ChildrenBean> list = dao.selectBoard(s_id);
      
      if(list.size()==0)
         return "c_children_book";
      
      for(int i=0; i<list.size();i++){
         SimpleDateFormat formatter  = new SimpleDateFormat("yyyy-MM-dd");
           Date sys_date = new Date();
           String dateString = formatter.format(sys_date); 
           
           
           if(list.get(i).getEnd_date().equals(dateString)){
              list.get(i).setFinish("fi");
           }
      
      }
      model.addAttribute("list",list);
      return "s_schedulerList";
      
   }
	
	@RequestMapping(value="/selectDate",method=RequestMethod.GET)
	public String selectDate(@RequestParam String sche_date, HttpSession session,Model model){
		
		SchedulerBean sche = new SchedulerBean();
		memberBean s = (memberBean) session.getAttribute("s");
		sche.setNo_date(sche_date);
		sche.setS_id(s.getId());
		System.out.println(sche.getS_id());
		System.out.println(sche.getNo_date());
		List<SchedulerBean> list = dao.selectdate(sche);
		int count = 0;
		for(int i=0; i<=list.size(); i++){
			count += 1;
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		
		return "/WEB-INF/scheduler/SelectDate.jsp";
	}
	
	
}
