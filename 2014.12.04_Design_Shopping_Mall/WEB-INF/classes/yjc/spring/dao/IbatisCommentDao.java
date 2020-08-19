package yjc.spring.dao;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Board;
import yjc.spring.bean.Comment;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisCommentDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public void insertComment(Comment comment) {
		sqlMapClientTemplate.insert("insertComment", comment);
	}
	
	public void updateComment(int nextId) {
		sqlMapClientTemplate.update("updateComment", nextId);
	}
	
	public int selectValue() {
		return	(int)sqlMapClientTemplate.queryForObject("updateComment");
		
	}
}
