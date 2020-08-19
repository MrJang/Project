package yjc.wdb.safe.dao;


import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.wdb.safe.bean.CafeBean;
import yjc.wdb.safe.bean.CafeMemberBean;
import yjc.wdb.safe.bean.memberBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class CafeDao {

		private SqlMapClientTemplate sqlMapClientTemplate;
		
		public void setSqlMapClient(SqlMapClient sqlMapClient) {
			sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient); 
		}
		
		public void createCafe(CafeBean cafe){
			sqlMapClientTemplate.insert("createCafe", cafe);
		}
		
		public void cafeJoin(int c_num){
			sqlMapClientTemplate.update("cafeJoin", c_num);
			
		}
		
		public void JoinMember(CafeMemberBean c_member){
			sqlMapClientTemplate.insert("JoinMember",c_member);
		}
		public CafeMemberBean selectMember(String id){
			return (CafeMemberBean) sqlMapClientTemplate.queryForObject("selectMember",id);
		}
		
		public CafeBean selectCafeMaster(CafeBean bean){
			return (CafeBean) sqlMapClientTemplate.queryForObject("selectCafeMaster",bean);
		}
		
		public List<CafeBean> receiveCafe(){
			return (List<CafeBean>) sqlMapClientTemplate.queryForList("receiveCafe");
			
		}
		public List<CafeMemberBean> cafeselect(String id){
			return (List<CafeMemberBean>) sqlMapClientTemplate.queryForList("cafeselect",id);
		}
		
		public CafeBean cafeList(CafeBean bean){
			return (CafeBean) sqlMapClientTemplate.queryForObject("cafeList",bean);
		}
		
		public CafeBean selectCafe(int c_num){
			return (CafeBean) sqlMapClientTemplate.queryForObject("selectCafe",c_num);
		}
		public List<CafeBean> joincafeList(String id){
			
			return (List<CafeBean>) sqlMapClientTemplate.queryForList("joinCafeList",id);
		}
		
		public List<CafeBean> joinCafeList_all(int c_num){
			
			return (List<CafeBean>) sqlMapClientTemplate.queryForList("joinCafeList_all",c_num);
		}
		
		public List<CafeMemberBean> cafeMemberAll(){
			return (List<CafeMemberBean>) sqlMapClientTemplate.queryForList("cafemembers");
			
		}
		
		public CafeBean cafeList_member(String id){
			return (CafeBean) sqlMapClientTemplate.queryForObject("cafeList_member",id);
		}
		
		public CafeBean Enter_Cafe_create(int num){
			return (CafeBean) sqlMapClientTemplate.queryForObject("Enter_Cafe_create",num);
		}
		
		
	}
