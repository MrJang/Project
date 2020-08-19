package yjc.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Purchase;
import yjc.spring.bean.product;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisProductDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public List<product> selectAllTop_product(int category_num) {
		return (List<product>)sqlMapClientTemplate.queryForList("selectAllTop_product", category_num);	
	}
	public List<product> select_view_product(int product_num) {
		return (List<product>)sqlMapClientTemplate.queryForList("select_view_product",product_num);	
	}
	public List<product> new_product_select(int category_num) {
		return (List<product>)sqlMapClientTemplate.queryForList("new_product_select", category_num);	
	}
	public void Insert_Product(product p) {
		sqlMapClientTemplate.insert("Insert_Product", p);
		
	}
	public Integer des_select(String pro_num) {
		return (Integer)sqlMapClientTemplate.queryForObject("des_select", pro_num);	
	}
	public void Update_amount(product p){
		sqlMapClientTemplate.update("Update_amount", p);
	}
	public void Update_amount2(product p){
		sqlMapClientTemplate.update("Update_amount2", p);
	}
	
	public void update_product(product p){
		sqlMapClientTemplate.update("update_product", p);
	}
	public void update_product_img(product p){
		sqlMapClientTemplate.update("update_product_img", p);
	}
	public void update_product_img2(product p){
		sqlMapClientTemplate.update("update_product_img2", p);
	}
	public void update_product_img3(product p){
		sqlMapClientTemplate.update("update_product_img3", p);
	}
	
	public List<product> Best_Product_select() {
		return (List<product>)sqlMapClientTemplate.queryForList("Best_Product_select");	
	}
	public List<product> search_product(product p) {
		return (List<product>)sqlMapClientTemplate.queryForList("search_product",p);	
	}
	public void delete_product(int pro_num) {
		sqlMapClientTemplate.delete("delete_product", pro_num);	
	}

	public int my_product_count(int des_num) {
		return (int)sqlMapClientTemplate.queryForObject("my_product_count", des_num);
	}
	
}
