package yjc.wdb.safe.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import yjc.wdb.safe.bean.CafeBoardBean;
import yjc.wdb.safe.bean.CafeMemberBean;
import yjc.wdb.safe.bean.ChildrenBean;
import yjc.wdb.safe.bean.PageInfo;

import com.ibatis.sqlmap.client.SqlMapClient;

public class CafeBoardDao {

private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		sqlMapClientTemplate = new SqlMapClientTemplate(sqlMapClient); 
		
	}
	public void insertReview(CafeBoardBean bean) {

		sqlMapClientTemplate.insert("insertREview", bean);

	}

	

	public void Reviewupdate(CafeBoardBean bean) {
		sqlMapClientTemplate.update("updateReview", bean);
	}

	// �ı� �Խ��� ����,����
	public int getReviewCount(PageInfo page) {
		return (Integer) sqlMapClientTemplate.queryForObject("getCountReview",page);
	}

	// �ı� ����Ʈ limit��

	public List<CafeBoardBean> getReviews(PageInfo page) {
		System.out.println(page.getBoard_cate());
		System.out.println(page.getCafe_num());
		return (List<CafeBoardBean>) sqlMapClientTemplate.queryForList(
				"getReviews", page);
	}

	// �ı� �Խ��� ���� ���ϱ�

	public void deleteChildren_cafe(int num) {
		sqlMapClientTemplate.delete("deleteChildren_cafe", num);
	}
	
	public CafeBoardBean selectReview(int num) {
		// �󼼺��� �� update�� readcount�� +����.
		sqlMapClientTemplate.update("readcount", num);
		return (CafeBoardBean) sqlMapClientTemplate.queryForObject(
				"selectReview", num);

	}
	
}
