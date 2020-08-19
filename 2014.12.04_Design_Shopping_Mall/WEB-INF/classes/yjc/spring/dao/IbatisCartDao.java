package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Cart;
import yjc.spring.bean.d_shop;
import yjc.spring.bean.product;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisCartDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	public void Insert_Cart(Cart c) {
		sqlMapClientTemplate.insert("Insert_Cart", c);
		
	}
	//Cart list의 항목 리스트 검색 해서 해당 상품쿼리
	public List<product> cart_list(int mem_num) {
		return (List<product>)sqlMapClientTemplate.queryForList("cart_list", mem_num);	
	}
	public void cart_delete(int cart_num) {
		sqlMapClientTemplate.delete("cart_delete", cart_num);	
	}
	
}
