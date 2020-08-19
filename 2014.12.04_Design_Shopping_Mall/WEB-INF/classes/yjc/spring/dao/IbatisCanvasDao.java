package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Board;
import yjc.spring.bean.Canvas;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisCanvasDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public void insertCanvas(Canvas canvas) {
		sqlMapClientTemplate.insert("insertCanvas", canvas);
	}
	
	public List<Canvas> selectAllCanvas() {
		return (List<Canvas>)sqlMapClientTemplate.queryForList("selectAllCanvas");
	}
	
	public List<Canvas> selectAllMyCanvas(int mem_num) {
		return (List<Canvas>)sqlMapClientTemplate.queryForList("selectAllMyCanvas", mem_num);
	}
	public List<Canvas> selectMyCanvas(int mem_num) {
		return (List<Canvas>)sqlMapClientTemplate.queryForList("selectMyCanvas", mem_num);
	}
	
	public List<Canvas> selectMyCapture(int mem_num) {
		return (List<Canvas>)sqlMapClientTemplate.queryForList("selectMyCapture", mem_num);
	}
	
	public Canvas selectBycan_num(int can_num) {
		return (Canvas)sqlMapClientTemplate.queryForObject("findCanvasBycan_num", can_num); 
	}
	
	public int selectMaxCan_Num() {
		return (int)sqlMapClientTemplate.queryForObject("findMaxCan_Num");
	}
	
	public int selectCountCan_Num() {
		return (int)sqlMapClientTemplate.queryForObject("findCountCan_Num");
	}
	
	public void updateCanvasBycan_num(Canvas canvas) {
		sqlMapClientTemplate.update("updateCanvasBycan_num", canvas);
	}

	public void deleteCanvasBycan_num(int can_num) {
		sqlMapClientTemplate.delete("deleteCanvasBycan_num", can_num);
		
	}

	public List<Canvas> c_list() {
		return (List<Canvas>)sqlMapClientTemplate.queryForList("c_list");
	}

	
	
	
	
	
	
	
	
	
}
