//package yjc.spring.inpl;
//
//import java.util.Calendar;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//
//import yjc.spring.bean.Member;
//import yjc.spring.dao.IbatisBoardDao;
//import yjc.spring.dao.IbatisMemberDao;
//import yjc.spring.service.MemberService;
//
//public class MemberSeviceImpl implements MemberService {
//	@Autowired
//	private IbatisBoardDao bdao;
//	@Autowired
//	private IbatisMemberDao dao;
//	
//	public boolean addMember(HttpSession session,Model model) {
//		
//		Member m = (Member)session.getAttribute("m");
//		
//		if(m!=null){
//			return false;
//		} else {
//		
//			int year = Calendar.getInstance().get(Calendar.YEAR);
//			int[] years = new int[200];
//			for (int i = year; i > year - 200; i--) {
//				years[year - i] = i;
//			}
//			
//			m = new Member();
//			
//			m.setGender("M");
//			m.setAuthority("2");
//			model.addAttribute("member", m);
//			model.addAttribute("years", years);
//			return true;
//			
//		}
//		
//	}
//	
//}
