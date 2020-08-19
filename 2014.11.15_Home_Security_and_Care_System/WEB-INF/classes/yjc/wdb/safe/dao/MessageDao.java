package yjc.wdb.safe.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;






import yjc.wdb.safe.bean.CafeBean;
import yjc.wdb.safe.bean.CafeBoardBean;
import yjc.wdb.safe.bean.CafeMemberBean;
import yjc.wdb.safe.bean.MessageBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class MessageDao {
	
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient); 
		
	}
	
	
	public void insertMessage(MessageBean bean){
		
		sqlMapClientTemplate.insert("insertMessage", bean);
		
	}
	
	
	
	public List<CafeBoardBean> messageSelect(String id){
		return (List<CafeBoardBean>) sqlMapClientTemplate.queryForList("messageSelect",id); 
	}
	
	public List<CafeBean> messageSelect_e(String id){
		return (List<CafeBean>) sqlMapClientTemplate.queryForList("messageSelect_e",id); 
	}
	//리스트 부분
	public List<MessageBean> writeMessage(String write_id){
		return (List<MessageBean>) sqlMapClientTemplate.queryForList("writeMessage",write_id); 
	}
	
	public List<MessageBean> sendMessage(String send_id){
		return (List<MessageBean>) sqlMapClientTemplate.queryForList("sendMessage",send_id); 
	}
	
	public MessageBean selectMessage(int message_num){
		
		return (MessageBean) sqlMapClientTemplate.queryForObject("MessageView",message_num);
		
	}
	
	public List<CafeMemberBean> cafe_memberSelect(int cafe_select){
		
		return (List<CafeMemberBean>) sqlMapClientTemplate.queryForList("cafe_memberSelect",cafe_select);
		
	}
	
	public void deleteMessage(int write_num){
		sqlMapClientTemplate.delete("MessageDelete",write_num);
	}
	
	public void selectE_id(MessageBean bean){
		
		sqlMapClientTemplate.update("selectchildren",bean);
	}
	
	
	public void   updateFe(MessageBean bean){
	      
	      sqlMapClientTemplate.update("updateFe",bean);
	   }
	
	public void e_selectchildren(MessageBean message){
		
		sqlMapClientTemplate.update("e_selectchildren",message);
	}
	public List<MessageBean> selectMessage(String id){
		return (List<MessageBean>) sqlMapClientTemplate.queryForList("selectMessage",id); 
	}
	public void m_messageInsert(MessageBean message) {
		sqlMapClientTemplate.insert("m_messageInsert", message);
	}
	
	

}
