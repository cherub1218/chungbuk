package emp.bem.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bem.util.SearchCriteria;
import emp.bem.vo.BusinessEvaluationVO;


public interface BusinessEvaluationService {
	
		// 평가지표 리스트조회
		public List<BusinessEvaluationVO> businessEvaluationList(Map<String,Integer> paramMap) throws Exception;
		
		// 평가지표등록
		public void businessEvaluation(BusinessEvaluationVO businessEvaluationVO) throws Exception;
		
		// 평가지표 갯수
		public int listCount(SearchCriteria scri) throws Exception;

		// 평가지표 상세보기
		public BusinessEvaluationVO businessEvaluationDetail(int bem_beval_idx) throws Exception;
		
		// 평가지표 수정
		public void businessEvaluationUpdate(BusinessEvaluationVO businessEvaluationVO) throws Exception;		
		
		// 평가지표 삭제
		public void delete(int bem_beval_idx) throws Exception;
		
		// 평가지표 리스트조회 (사용자)
		public List<BusinessEvaluationVO> businessEvaluationMyList(Map<String,Object> paramMap) throws Exception;
		
		//평가지표 양식 조회
		public List<Map<String, Object>> businessEvaluationFormList(int bam_anc_idx) throws Exception;
		
		//평가지표 중복체크
		public int businessEvaluationOverLapChk(Map<String,Object> evalparam) throws Exception;

		// 평가지표 리스트조회
		public List<BusinessEvaluationVO> businessEvaluationAllList(Map<String,Object> paramMap) throws Exception;
		
	}    
 