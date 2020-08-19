package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Canvas;
import yjc.spring.bean.Member;
import yjc.spring.bean.Purchase;
import yjc.spring.bean.product;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisPurchaseDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public void Insert_Purchase(Purchase purchase) {
		sqlMapClientTemplate.insert("Insert_Purchase", purchase);	
	}
	public List<Purchase> Purchase_list(int mem_num) {
		return (List<Purchase>)sqlMapClientTemplate.queryForList("Purchase_list",mem_num);	
	}
	public List<Purchase> Purchase_view(int p_num) {
		return (List<Purchase>)sqlMapClientTemplate.queryForList("Purchase_view",p_num);	
	}
	public List<Purchase> Purchase_select(Purchase phs) {
		return (List<Purchase>)sqlMapClientTemplate.queryForList("Purchase_select",phs);	
	}
	public String select_designer_name(int des_num) {
		return (String)sqlMapClientTemplate.queryForObject("select_designer_name",des_num);	
	}
	public void update_purchase(Purchase phs){
		sqlMapClientTemplate.update("update_purchase", phs);
	}
	public void update_purchase2(Purchase phs){
		sqlMapClientTemplate.update("update_purchase2", phs);
	}
	public void purchase_delete(int p_num) {
		sqlMapClientTemplate.delete("purchase_delete", p_num);	
	}
	public int my_sell_count(int des_num) {
		return (int)sqlMapClientTemplate.queryForObject("my_sell_count",des_num);
	}
	public int if_my_sell_count(int des_num) {
		return (int)sqlMapClientTemplate.queryForObject("if_my_sell_count",des_num);
	}
	public int my_buy_count(int mem_num) {
		return (int)sqlMapClientTemplate.queryForObject("my_buy_count",mem_num);
	}
	public int if_my_buy_count(int mem_num) {
		return (int)sqlMapClientTemplate.queryForObject("if_my_buy_count",mem_num);
	}
	

}
