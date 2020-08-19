package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Member;
import yjc.spring.bean.d_shop;
import yjc.spring.bean.product;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisD_shop {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
//	게시판 
	public void insertD_shop(d_shop d_shop) {
		sqlMapClientTemplate.insert("insertd_shop", d_shop);
	}
	public void upDateD_shop(d_shop d_shop) {
		sqlMapClientTemplate.update("updateDsh_boardByNum", d_shop);
	}
//	게시판 목록 불러오기
	public List<d_shop> selectGBoard(int des_num) {
		return (List<d_shop>)sqlMapClientTemplate.queryForList("findGBoards",des_num);
	}
	
	public List<d_shop> selectQBoard(int des_num) {
		return (List<d_shop>)sqlMapClientTemplate.queryForList("findQBoards",des_num);
		
	}
	public List<d_shop> selectOBoard(int re_des_num) {
		return (List<d_shop>)sqlMapClientTemplate.queryForList("findOBoards",re_des_num);
		
	}
	public d_shop selectBoardByNum(int num) {
		return (d_shop)sqlMapClientTemplate.queryForObject("findInfoBoards",num); 
	}

	public void deleteBoardByNum(int dsh_boardnum) {
		sqlMapClientTemplate.delete("deleteDsh_boardByNum", dsh_boardnum);
	}
//	쇼핑몰
	public List<product> selectshoping(int re_des_num) {
		return (List<product>)sqlMapClientTemplate.queryForList("selectshopping",re_des_num);
		
	}	
	public List<product> selectcateshoping(product product1) {
		
		return (List<product>)sqlMapClientTemplate.queryForList("selectcateshopping",product1);
	}


//	디자이너 번호 받아오기
	public int findDes_num(int mem_num) {
		
		return (int)sqlMapClientTemplate.queryForObject("findDes_num",mem_num);
	}
//	일일 매출 받아오기
	public List<d_shop> findDes_sales(int re_des_num) {
		return (List<d_shop>)sqlMapClientTemplate.queryForList("findDes_sales",re_des_num);
	}
	
		
	public void moneyEnter(int p_num) {
		sqlMapClientTemplate.update("moneyEnter", p_num);
	}

	public String findStatus(int p_num) {
		return (String)sqlMapClientTemplate.queryForObject("findStatus",p_num);
		
	}

	public void moneyWait(int p_num) {
		sqlMapClientTemplate.update("moneyWait", p_num);
		
	}
	public void deliver(int p_num) {
		sqlMapClientTemplate.update("deliver", p_num);
		
	}

	public String findmemid(int des_num) {
		return (String)sqlMapClientTemplate.queryForObject("findmemid",des_num);
	}
//	로고 찾기
	public String findlogo(int re_des_num) {
		return (String)sqlMapClientTemplate.queryForObject("findLogo",re_des_num);
			
	}
	
//	로고 넣기
	public void insertLogo(Member member) {
		sqlMapClientTemplate.insert("insert_dsh_logo", member);
			
	}
	public void updateLogo(d_shop d_shop) {
		sqlMapClientTemplate.update("update_dsh_logo", d_shop);
		
	}
//	배경찾기
	public String findback(int re_des_num) {
		return (String)sqlMapClientTemplate.queryForObject("findBack",re_des_num);
	}
// 배경 넣기
	public void insertBack(d_shop d_shop) {
		sqlMapClientTemplate.insert("insert_dsh_back", d_shop);
			
	}
	public void updateBack(d_shop d_shop) {
		sqlMapClientTemplate.update("update_dsh_back", d_shop);
		
	}
	
	


}
