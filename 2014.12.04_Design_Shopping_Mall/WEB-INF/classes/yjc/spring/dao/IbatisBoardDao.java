package yjc.spring.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.spring.bean.Board;
import yjc.spring.bean.Member;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IbatisBoardDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient){
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);
	}
	
	public void insertBoard(Board board) {
		sqlMapClientTemplate.insert("insertBoard", board);
	}
	
	public void updateBoardByNum(Board board) {
		sqlMapClientTemplate.update("updateBoardByNum", board);
	}
	
	public void updateReadCount(int bod_num) {
		sqlMapClientTemplate.update("updateReadCount", bod_num);
	}
	
	public void deleteBoardByNum(int bod_num) {
		sqlMapClientTemplate.delete("deleteBoardByNum", bod_num);
	}
	
	public Board selectByNum(int bod_num) {
		return (Board)sqlMapClientTemplate.queryForObject("selectByNum", bod_num); 
	}
	
	public int selectMaxNum() {
		return (int)sqlMapClientTemplate.queryForObject("selectMaxNum");
	}
	
	public int selectCountNum() {
		return (int)sqlMapClientTemplate.queryForObject("selectCountNum");
	}
	
	public List<Board> selectAllBoard() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectAllBoard");
	}
	
	public List<Board> selectBoard1() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectBoard1");
	}
	
	public List<Board> selectBoard2() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectBoard2");
	}
	
	public List<Board> selectBoard3() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectBoard3");
	}
	
	public List<Board> selectAllPopular() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectAllPopular");
	}

	public int my_article1_count(Member member) {
		return (int)sqlMapClientTemplate.queryForObject("my_article1_count", member);
	}

	public int my_article2_count(Member member) {
		return (int)sqlMapClientTemplate.queryForObject("my_article2_count", member);
	}

	public Board selectByIntro(int bod_num) {
		return (Board)sqlMapClientTemplate.queryForObject("selectByIntro", bod_num);
	}

	public List<Board> selectTop1() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectTop1");
	}

	public List<Board> selectBottom1() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectBottom1");
	}

	public List<Board> selectAcce1() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectAcce1");
	}

	public List<Board> selectEtc1() {
		return (List<Board>)sqlMapClientTemplate.queryForList("selectEtc1");
	}

	public String get_bod_img_by_bod_num(int bod_num) {
		return (String)sqlMapClientTemplate.queryForObject("get_bod_img_by_bod_num", bod_num);
	}
	
}
