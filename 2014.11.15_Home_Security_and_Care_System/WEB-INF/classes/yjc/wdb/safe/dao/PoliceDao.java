package yjc.wdb.safe.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;






import yjc.wdb.safe.bean.FemaleBean;
import yjc.wdb.safe.bean.MessageBean;
import yjc.wdb.safe.bean.policeBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class PoliceDao {
private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient); 
		
	}
	public policeBean policeL(String name){
		return (policeBean)sqlMapClientTemplate.queryForObject("policeL",name);
	}
	public List<policeBean> police_mpolice(int police){
		return (List<policeBean>)sqlMapClientTemplate.queryForList("police_mpolice",police);
	}
	public void PoMemberUpdate(String name){
		
		sqlMapClientTemplate.update("PoMemberUpdate",name);
	}
	public policeBean policeSel(String name){
		return (policeBean)sqlMapClientTemplate.queryForObject("policeSel",name);
	}
public void MemberUpdatego(String name){
		
		sqlMapClientTemplate.update("MemberUpdatego",name);
	}
public void deletepolice(String name){
    sqlMapClientTemplate.update("deletepolice",name);
 }
public List<policeBean> Syslist(int police){
	return (List<policeBean>)sqlMapClientTemplate.queryForList("Syslist",police);
}
	
}
