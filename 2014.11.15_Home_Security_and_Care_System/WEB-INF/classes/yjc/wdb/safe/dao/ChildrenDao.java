package yjc.wdb.safe.dao;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.PageInfo;
import yjc.wdb.safe.bean.zipcodeBean;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ChildrenDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient);

	}

	public void insertChildren(ChildrenBean bean) {

		sqlMapClientTemplate.insert("insertChildren", bean);

	}

	public void insertChildren_e(ChildrenBean bean) {

		sqlMapClientTemplate.insert("insertChildren_e", bean);

	}

	// 신청게시판,업체게시판,후시게시판 정보 select 통일
	public ChildrenBean selectChildren(int num) {
		// 상세보기 시 update로 readcount를 +해줌.
		sqlMapClientTemplate.update("readcount", num);
		return (ChildrenBean) sqlMapClientTemplate.queryForObject(
				"findChildrenById", num);

	}
	
	public void updateChildren(ChildrenBean bean) {
		sqlMapClientTemplate.update("updateChildren", bean);
	}
	
	

	public void deleteChildren(int num) {
		sqlMapClientTemplate.delete("deleteChildren", num);
	}

	
	
	
	
	public List<zipcodeBean> zipselect(String dong) {
		return (List<zipcodeBean>) sqlMapClientTemplate.queryForList(
				"c_zipcode", dong);

	}

	public List<ChildrenBean> e_search(PageInfo page) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"e_search", page);
	}

	public List<ChildrenBean> c_search(PageInfo page) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"c_search", page);
	}

	// 신청확인 내역
	public List<ChildrenBean> requestSelect(String id) {
		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"requestSelect", id);

	}

	public ChildrenBean p_requestSelect(String id) {
		return (ChildrenBean) sqlMapClientTemplate.queryForObject(
				"p_requestSelect", id);

	}

	public void requestDelete(String id) {
		sqlMapClientTemplate.update("requestDelete", id);

	}

	// 자녀,업체 리스트 이전, 다음

	public int getChildrenCount() {
		return (Integer) sqlMapClientTemplate
				.queryForObject("getCountChildren");
	}

	// 자녀,업체 리스트 limit절

	public List<ChildrenBean> getChildrens(PageInfo page) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"getChildrens", page);
	}

	// 후기게시판 설정
	

	// 추가 부분

	public List<ChildrenBean> SelectEnter(ChildrenBean bean) {
		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"selectEnter", bean);

	}

	public List<ChildrenBean> select_date(String id) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"select_date", id);
	}

	public List<ChildrenBean> selectEnter_start(String start) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"selectEnter_start", start);
	}

	public List<ChildrenBean> selectEnter_end(ChildrenBean bean) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"selectEnter_end", bean);
	}

	public void Entersuccess(int num) {
		sqlMapClientTemplate.update("Entersuccess", num);
	}

	public void Enterdelete(int num) {
		sqlMapClientTemplate.update("Enterdelete", num);
	}

	public int current_count(ChildrenBean bean) {

		return (int) sqlMapClientTemplate.queryForObject("current_count", bean);
	}

	public List<ChildrenBean> EnterView(ChildrenBean bean) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"EnterView", bean);
	}
	
	//그룹 가입 시킬 멤버 불러오기
	public List<ChildrenBean> CafeSelect(ChildrenBean bean) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList(
				"CafeSelect", bean);
	}
	
	public void updateCafe_select(ChildrenBean bean) {
		sqlMapClientTemplate.update("updateCafe_select", bean);
	}
	
	public String star_sum(ChildrenBean bean) {

		return (String) sqlMapClientTemplate.queryForObject("star_sum", bean);

	}

	public int star_count(String id) {
		return (int) sqlMapClientTemplate.queryForObject("star_count", id);

	}
	
	public List<ChildrenBean> Enter_cafe(String id) {

		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList("Enter_cafe", id);
	}
	
	
	
	public ChildrenBean reg_date_create(int num) {
		return (ChildrenBean) sqlMapClientTemplate.queryForObject(
				"reg_date_create", num);

	}
	
	public List<ChildrenBean> children_all(ChildrenBean bean) {
		return (List<ChildrenBean>) sqlMapClientTemplate.queryForList("children_all", bean);

	}

}
