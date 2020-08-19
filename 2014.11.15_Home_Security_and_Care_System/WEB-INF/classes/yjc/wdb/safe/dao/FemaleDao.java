package yjc.wdb.safe.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.FemaleBean;
import yjc.wdb.safe.bean.MessageBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class FemaleDao {
private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient); 
		
	}
	
	public void deleteFemale(String id){
	      sqlMapClientTemplate.update("deleteFemale",id);
	   }
	
	public void f_insert(FemaleBean bean) {
		sqlMapClientTemplate.insert("f_insertBoard", bean);
	}
	public void t_insert(FemaleBean bean){
		sqlMapClientTemplate.insert("t_insertTaxi", bean);
	}
	
	public List<FemaleBean> t_selectOneWeek(){
		return (List<FemaleBean>)sqlMapClientTemplate.queryForList("t_oneWeek");
	}

	public List<FemaleBean> t_selectOneMonth(){
		return (List<FemaleBean>)sqlMapClientTemplate.queryForList("t_oneMonth");
	}
	public List<FemaleBean> t_selectThreeMonth(){
		return (List<FemaleBean>)sqlMapClientTemplate.queryForList("t_threeMonth");
	}
	public List<FemaleBean> t_selectAll() {
		return (List<FemaleBean>)sqlMapClientTemplate.queryForList("t_findTaxi");
	}
	
	public void m_policeAdd(FemaleBean bean){
		sqlMapClientTemplate.insert("m_policeAdd", bean);
	}
	
	public FemaleBean policeList(String id){
		return (FemaleBean)sqlMapClientTemplate.queryForObject("policeList",id);
	}
	
	
	public void m_nfc(FemaleBean bean) {
	      sqlMapClientTemplate.insert("m_nfc", bean);
	   }
	public FemaleBean t_selectById(String id) {
	      return (FemaleBean)sqlMapClientTemplate.queryForObject("t_selectById",id);
	   }
	public void updateFemale(FemaleBean bean){
	      sqlMapClientTemplate.update("updateFemale",bean);
	   }
	public FemaleBean getPolice(String name){
		return (FemaleBean)sqlMapClientTemplate.queryForObject("getPolice",name);
	}
	public FemaleBean getSelectPolice(String id){
		return (FemaleBean)sqlMapClientTemplate.queryForObject("getSelectPolice",id);
	}
	public List<FemaleBean> getPolice2(String id){
		return (List<FemaleBean>)sqlMapClientTemplate.queryForList("getPolice2",id);
	}
	public List<FemaleBean> sysList(String id){
		return (List<FemaleBean>)sqlMapClientTemplate.queryForList("sysList",id);
	}
	public void policeReview(FemaleBean bean){
		
		sqlMapClientTemplate.insert("policeReview",bean);
		
	}
	public List<FemaleBean> sysListOk(String name){
		return (List<FemaleBean>)sqlMapClientTemplate.queryForList("sysListOk",name);
	}	
	public FemaleBean detalire(int num){
		return (FemaleBean)sqlMapClientTemplate.queryForObject("detalire",num);
	}
	public void detalireupdate(int num){
	      sqlMapClientTemplate.update("detalireupdate",num);
	   }
}
