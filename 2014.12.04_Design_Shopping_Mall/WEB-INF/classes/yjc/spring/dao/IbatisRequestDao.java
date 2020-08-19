package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Canvas;
import yjc.spring.bean.Request;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisRequestDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public void insertRequest(Request request) {
		sqlMapClientTemplate.insert("insertRequest", request);
	}

	public List<Request> selectAllRequest_receiver(String req_receiver) {
		return (List<Request>)sqlMapClientTemplate.queryForList("selectAllRequest_receiver", req_receiver);	
	}
	
	public List<Request> selectAllRequest_sender(String req_sender) {
		return (List<Request>)sqlMapClientTemplate.queryForList("selectAllRequest_sender", req_sender);	
	}
	
	public int selectMaxReq_Num() {
		return (int)sqlMapClientTemplate.queryForObject("selectMaxReq_Num");
	}
	
	public int selectCountReq_Num() {
		return (int)sqlMapClientTemplate.queryForObject("selectCountReq_Num");
	}

	public void del_req(String req_num) {
		sqlMapClientTemplate.delete("del_req", req_num);
	}

	public int check_req(String mem_id) {
		return (int)sqlMapClientTemplate.queryForObject("check_req", mem_id);
	}
	
	public int check_req1(String mem_id) {
		return (int)sqlMapClientTemplate.queryForObject("check_req1", mem_id);
	}

	public void req_process_update(Request request) {
		sqlMapClientTemplate.update("req_process_update", request);
	}

	public Request getreq(int req_num) {
		return (Request)sqlMapClientTemplate.queryForObject("getreq", req_num);
	}

	public void feedbackupdate(Request request) {
		sqlMapClientTemplate.update("feedbackupdate", request);
		
	}

	public void req_content_update(Request request) {
		sqlMapClientTemplate.update("req_content_update", request);
		
	}
	
	public List<Request> r_list() {
		return (List<Request>)sqlMapClientTemplate.queryForList("r_list");
	}
	
	public int if_my_request_count(String mem_id) {
		return (int)sqlMapClientTemplate.queryForObject("if_my_request_count", mem_id);
	}

	public int my_request_count(String mem_id) {
		return (int)sqlMapClientTemplate.queryForObject("my_request_count", mem_id);
	}
	public List<Request> selectMyCommission(String mem_id) {
		return (List<Request>)sqlMapClientTemplate.queryForList("selectMyCommission", mem_id);
	}
	
	public List<Request> selectMyCommission2(String mem_id) {
		return (List<Request>)sqlMapClientTemplate.queryForList("selectMyCommission2", mem_id);
	}

	public int new_req_count(String mem_id) {
		return (int)sqlMapClientTemplate.queryForObject("new_req_count", mem_id);
	}
	
	public int modified_req_count1(String mem_id) {
		return (int)sqlMapClientTemplate.queryForObject("modified_req_count1", mem_id);
	}
	
	public int modified_req_count2(String mem_id) {
		return (int)sqlMapClientTemplate.queryForObject("modified_req_count2", mem_id);
	}

	public void set_sender_mod_1(int req_num) {
		sqlMapClientTemplate.update("set_sender_mod_1", req_num);
	}
	
	public void set_sender_mod_0(int req_num) {
		sqlMapClientTemplate.update("set_sender_mod_0", req_num);
	}
	
	public void set_receiver_mod_1(int req_num) {
		sqlMapClientTemplate.update("set_receiver_mod_1", req_num);
	}
	
	public void set_receiver_mod_0(int req_num) {
		sqlMapClientTemplate.update("set_receiver_mod_0", req_num);
	}
	
	
	

	
	
	
	
}
