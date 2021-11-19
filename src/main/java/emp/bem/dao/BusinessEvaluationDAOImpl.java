package emp.bem.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import emp.bem.util.SearchCriteria;
import emp.bem.vo.BusinessEvaluationVO;





@Repository
public class BusinessEvaluationDAOImpl implements BusinessEvaluationDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 사업공고리스트 조회
	@Override
	public List<BusinessEvaluationVO> businessEvaluationList (Map<String,Integer> paramMap) throws Exception {
	
		return sqlSession.selectList("businessEvaluationMapper.businessEvaluationList", paramMap);

	}
	
	// 사업공고등록
	@Override
	public void businessEvaluation(BusinessEvaluationVO businessEvaluationVO) throws Exception {
		sqlSession.insert("businessEvaluationMapper.insert", businessEvaluationVO);
		
	}
	
	// 사업리스트 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("businessEvaluationMapper.listCount", scri);
	}

	// 사업공고 상세보기
	@Override
	public BusinessEvaluationVO businessEvaluationDetail(int bem_beval_idx) throws Exception {
			
		return sqlSession.selectOne("businessEvaluationMapper.businessEvaluationDetail", bem_beval_idx);
	}
	
	// 사업공고 수정
	@Override
	public void businessEvaluationUpdate(BusinessEvaluationVO businessEvaluationVO) throws Exception {
		
		sqlSession.update("businessEvaluationMapper.businessEvaluationUpdate", businessEvaluationVO);
	}

	// 사업공고 삭제
	@Override
	public void delete(int bem_beval_idx) throws Exception {
		
		sqlSession.delete("businessEvaluationMapper.delete", bem_beval_idx);
	}
	
	// 사업공고 조회수
	@Override
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessEvaluationMapper.boardHit", bno);
	}
	
	@Override
	public List<BusinessEvaluationVO> businessEvaluationMyList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessEvaluationMapper.businessEvaluationMyList",paramMap);
	}
	
	@Override
	public List<Map<String, Object>> businessEvaluationFormList(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessEvaluationMapper.businessEvaluationFormList",bam_anc_idx);
	}
	
	@Override
	public int businessEvaluationOverLapChk(Map<String, Object> evalparam) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("businessEvaluationMapper.businessEvaluationOverLapChk",evalparam);
		return result;
	}
	
	@Override
	public List<BusinessEvaluationVO> businessEvaluationAllList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessEvaluationMapper.businessEvaluationAllList", paramMap);

	}
	
}