package yjc.wdb.safe.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.wdb.safe.bean.HomSecurityBean;
import yjc.wdb.safe.bean.memberBean;
import yjc.wdb.safe.bean.zipcodeBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class memberDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);

	}

	public memberBean loginMember(String id) {
		return (memberBean) sqlMapClientTemplate.queryForObject("loginmember",
				id);

	}

	public void insertMember(memberBean bean) {

		sqlMapClientTemplate.insert("insertmember", bean);

	}

	public void insertMember_e(memberBean bean) {

		sqlMapClientTemplate.insert("insertmember_e", bean);

	}
	
	
	
	public void children_insert(memberBean bean) {

		sqlMapClientTemplate.insert("children_insert", bean);

	}

	public memberBean selectmember(String id) {
		return (memberBean) sqlMapClientTemplate.queryForObject(
				"findmemberById", id);

	}

	public void updatemember(memberBean bean) {
		sqlMapClientTemplate.update("updatemember", bean);
	}
	
	
	
	

	public void deletemember(String id) {
		sqlMapClientTemplate.delete("deletemember", id);
	}

	public List<memberBean> selectAll() {
		return (List<memberBean>) sqlMapClientTemplate
				.queryForList("findmembers");

	}

	public List<zipcodeBean> zipselect(String dong) {
		return (List<zipcodeBean>) sqlMapClientTemplate.queryForList("zipcode",
				dong);

	}

	public void RightOn(HomSecurityBean bean){
	      
	      sqlMapClientTemplate.insert("RightOn", bean);
	      
	      }
	   public HomSecurityBean homeRecent(HomSecurityBean be){
	      return (HomSecurityBean) sqlMapClientTemplate.queryForObject("homeRecent",be);
	      
	   }
	   public void homeRecentNum(HomSecurityBean bean){
	      sqlMapClientTemplate.update("homeRecentNum",bean);
	   }
	   public List<HomSecurityBean> selectHome(String id){
	      return (List<HomSecurityBean>) sqlMapClientTemplate.queryForList("selectHome",id);
	      
	   }
	   public List<HomSecurityBean> selectHome2(String id){
	      return (List<HomSecurityBean>) sqlMapClientTemplate.queryForList("selectHome2",id);
	      
	   }
	   public List<HomSecurityBean> selectHome3(String id){
	      return (List<HomSecurityBean>) sqlMapClientTemplate.queryForList("selectHome3",id);
	      
	   }
	   public List<HomSecurityBean> selectbolt(String id){
		      return (List<HomSecurityBean>) sqlMapClientTemplate.queryForList("selectbolt",id);
		      
		   }
	   public void insert_reg(memberBean bean) {
		      sqlMapClientTemplate.update("insert_reg", bean);
		   }

	
	   
	    public void homeSe(String id) {
		      sqlMapClientTemplate.update("homeSe", id);
		   }
	   
}
