package emp.bem.dao;

import java.util.List;
import java.util.Map;

import emp.bem.util.SearchCriteria;
import emp.bem.vo.BusinessEvaluationVO;




public interface BusinessEvaluationDAO {
	

	// 사업공고 리스트조회
	public List<BusinessEvaluationVO> businessEvaluationList(Map<String,Integer> paramMap) throws Exception;
	
	// 사업공고등록
	public void businessEvaluation(BusinessEvaluationVO businessEvaluationVO ) throws Exception;
	
	// 사업공고 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 사업공고 상세보기
	public BusinessEvaluationVO businessEvaluationDetail(int bem_beval_idx) throws Exception;
	
	// 사업공고 수정
	public void businessEvaluationUpdate(BusinessEvaluationVO VO) throws Exception;
	
	// 사업공고 삭제
	public void delete(int bem_beval_idx) throws Exception;
    
	// 사업공고 조회수
	public void boardHit(int bem_beval_idx) throws Exception;
	
	// 사업공고 리스트조회(사용자)
	public List<BusinessEvaluationVO> businessEvaluationMyList(Map<String,Object> paramMap) throws Exception;

	//평가지표 양식 조회
	public List<Map<String, Object>> businessEvaluationFormList(int bam_anc_idx) throws Exception;
			
	//평가지표 중복체크
	public int businessEvaluationOverLapChk(Map<String,Object> evalparam) throws Exception;
	
	// 사업공고 리스트조회
	public List<BusinessEvaluationVO> businessEvaluationAllList(Map<String,Object> paramMap) throws Exception;
	
}