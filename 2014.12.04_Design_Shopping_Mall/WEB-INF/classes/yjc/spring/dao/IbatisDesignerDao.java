package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Designer;


import yjc.spring.bean.Member;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisDesignerDao {

	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public Integer select_des_num(Integer mem_num) {
		return (Integer)sqlMapClientTemplate.queryForObject("select_des_num", mem_num); 
	}
	
	public Designer selectAll_des_num(int  mem_num) {
		return (Designer)sqlMapClientTemplate.queryForObject("selectAll_des_num", mem_num); 
	}

	public void update_account(Member member) {
		sqlMapClientTemplate.update("update_account", member);
		
	}

	public void setDes_introduce(Member member) {
		sqlMapClientTemplate.update("setDes_introduce", member);
		
	}

	public String getDes_introduce(int des_num) {
		return (String)sqlMapClientTemplate.queryForObject("getDes_introduce", des_num);
	}
}
