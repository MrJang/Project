package yjc.wdb.safe.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.SchedulerBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class SchedulerDao {
	
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient); 
		
	}

	public void insertScheduler(SchedulerBean bean){
		
		sqlMapClientTemplate.insert("insertScheduler",bean);
		
	}
	
	public SchedulerBean latelyScheduler(String s_id){
		return (SchedulerBean) sqlMapClientTemplate.queryForObject("latelyScheduler",s_id);
	}
	
	
	public List<ChildrenBean> selectBoard(String s_id){
		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList("selectBoard",s_id);
	}
	
	public List<SchedulerBean> SchedulerList(String s_id){
		return (List<SchedulerBean>) sqlMapClientTemplate.queryForList("SchedulerList",s_id);
	}
	
	public void updateGetout_time(SchedulerBean bean){
		sqlMapClientTemplate.update("updateGetout_time",bean);
	}
	
	public List<SchedulerBean> selectdate(SchedulerBean bean){
		return (List<SchedulerBean>) sqlMapClientTemplate.queryForList("selectdate",bean);
	}

}
