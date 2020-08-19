package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Member;
import yjc.spring.bean.Purchase;
import yjc.spring.bean.d_shop;

import com.ibatis.sqlmap.client.SqlMapClient;


public class IbatisMemberDao {
private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public void insertMember(Member member) {
		sqlMapClientTemplate.insert("insertMember", member);
	}
	
	public void updateMemberById(Member member) {
		sqlMapClientTemplate.update("updateMemberById", member);
	}
	
	public void deleteAllMember() {
		sqlMapClientTemplate.delete("deleteAllMember");
	}
	
	public void deleteMemberById(String mem_id) {
		sqlMapClientTemplate.delete("deleteMemberById", mem_id);
	}
	
	public Member selectById(String mem_id) {
		return (Member)sqlMapClientTemplate.queryForObject("selectById", mem_id); 
	}
	
	public boolean isRegistered(String mem_id) {
		 Member selectid = (Member)sqlMapClientTemplate.queryForObject("findMemberById", mem_id);
		 	 if(selectid != null){	 
			System.out.println(mem_id);
			System.out.println(selectid);
			return true;
		 }
		 	return false;
	}
	
	public List<Member> selectAllMember() {
		return (List<Member>)sqlMapClientTemplate.queryForList("selectAllMember");
	}

	public List<Member> selectAllDesigner() {
		return (List<Member>)sqlMapClientTemplate.queryForList("findDesigners");
	}

	public int selectCountMem_Num() {
		return (int)sqlMapClientTemplate.queryForObject("selectCountMem_Num");
		
	}

	public int selectMaxMem_Num() {
		return (int)sqlMapClientTemplate.queryForObject("selectMaxMem_Num");
		
	}

	public void promotion(Member member) {
		sqlMapClientTemplate.insert("promotion", member);
		
	}

	public void demotion(Member member) {
		sqlMapClientTemplate.insert("demotion", member);
		
	}

	public int ifDesigner(Member member) {
		return (int)sqlMapClientTemplate.queryForObject("ifDesigner", member); 
	}

	public void logincheck(Member member) {
		sqlMapClientTemplate.update("logincheck", member);
	}

	public void logincheck_but(Member member) {
		sqlMapClientTemplate.update("logincheck_but", member);
		
	}

	public int getlogincheck(int mem_num) {
		return (int)sqlMapClientTemplate.queryForObject("getlogincheck", mem_num);
	}
	public List<Member> ps_list() {
		return (List<Member>)sqlMapClientTemplate.queryForList("ps_list");
	}
	
	

	
	
//	public List<Member> selectAlllBoard() {
//		return (List<Member>)sqlMapClientTemplate.queryForList("findBoard");
//	}

//	public int selectMaxId() {
//		return (int)sqlMapClientTemplate.queryForObject("findMaxId");
//	}
	
	
}
