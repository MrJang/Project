package yjc.wdb.safe.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.dao.GcmDao;
import yjc.wdb.safe.dao.memberDao;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

@Controller
@SessionAttributes("s")
public class GcmSendController {
   private Sender sender;
   private Sender sender2;
   private Message msg;
   private Message msg2;
   public static String API_KEY="AIzaSyBPLfvAxITbb0Am_nkretUM_B8yTjTcXyQ";
   public static String regId="";
   String collaspe_key = String.valueOf(Math.random() % 100 + 1);
   
   @Autowired memberDao m_dao;
   @Autowired private GcmDao g_dao;
   
   @RequestMapping(value="/alert", method=RequestMethod.GET)
   public String action(HttpServletRequest request, HttpSession session) {
      
      
      //System.out.println(regId);
      //String home_master=request.getParameter("master");
      
      String home_alert=request.getParameter("home");
      String[] alert_value=home_alert.split(",");
      
      memberBean member = m_dao.loginMember(alert_value[1]);
      System.out.print(alert_value[0].toString()+","+alert_value[1].toString());
      sender = new Sender(API_KEY);//Sender Objection
      regId = member.getReg_id();// Reg_id
         //System.out.println(home_alert);
      
      Message.Builder builder = new Message.Builder(); //Message Builder   
      
       if(alert_value[0].equals("r")){
          //Hot Sensor
          final String key="Hot_Sensor";
          final String value="지붕을 통하여 침입자가 발생했습니다.";
          System.out.println(key.toString()+","+value.toString());
          builder.collapseKey(collaspe_key);
          builder.addData(key.toString(),value.toString());
          
       }
       else if(alert_value[0].equals("w"))
       {
          //Touch Sensor
          final String key="Touch_Sensor";
          final String value="창문을 통하여 침입자가 발생했습니다.";
          System.out.println(key.toString()+","+value.toString());
          builder.collapseKey(collaspe_key);
          builder.addData(key.toString(), value.toString());   
       } 
       
      
      msg = builder.build();   // builder is builded                                 
      try {
         sender.send(msg, regId, 30);               
         
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      return "redirect:/safe/scan_success";
      
   }
   
   
   @RequestMapping(value="/alert_child", method=RequestMethod.GET)
   public String action2(HttpServletRequest request, HttpSession session) {
      
      memberBean member = (memberBean) session.getAttribute("s");
      memberBean s = m_dao.loginMember(member.getE_name());
      
      regId = s.getReg_id();
      System.out.println(regId);
      String home_alert2=request.getParameter("home2");
      sender2 = new Sender(API_KEY);
   
      
      
      Message.Builder builder = new Message.Builder();   
        if(home_alert2.equals("g"))
          {
             final String key2="Departure";
             final String value2="자녀가 안전하게 탑승 하였습니다.";
             System.out.println(key2.toString()+","+value2.toString());
             builder.addData(key2.toString(), value2.toString());   
          }
          else if(home_alert2.equals("a"))
          {
             final String key2="Arrive";
             final String value2="자녀가 안전하게 귀가 하였습니다.";
             System.out.println(key2.toString()+","+value2.toString());
             builder.addData(key2.toString(), value2.toString());   
             
          }
         msg2 = builder.build();                                   
         try {
            Result result2 = sender2.send(msg2, regId, 20);
           
            
         }catch (IOException e) {
            e.printStackTrace();
         }catch(Exception e){
            System.out.println("ServletException");
         }
         
         return "redirect:/safe/scan_success";
     }
   
}