package yjc.wdb.safe.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;


import yjc.wdb.safe.bean.memberBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class GcmDao {
private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient); 
		
	}
	
	public memberBean alert_Gcm(String id) {
	      return (memberBean)sqlMapClientTemplate.queryForObject("alert_Gcm",id);
	}
}