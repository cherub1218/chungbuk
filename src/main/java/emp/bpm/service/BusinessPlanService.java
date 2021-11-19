package emp.bpm.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bpm.util.SearchCriteria;
import emp.bpm.vo.BusinessPlanCostVO;
import emp.bpm.vo.BusinessPlanVO;

public interface BusinessPlanService {

		// 사업계획서 리스트조회
		public List<BusinessPlanVO> businessPlanApplyList(Map<String,Object> paramMap) throws Exception;
		
		// 사업계획서등록
		public void write(BusinessPlanVO VO,MultipartHttpServletRequest mpRequest) throws Exception;
		
		// 사업계획서 갯수
		public int listCount(SearchCriteria scri) throws Exception;

		// 사업계획서 상세보기
		public BusinessPlanVO businessPlanApplyDetail(int bpm_bplan_idx) throws Exception;
		
		// 사업계획서 수정
		public void businessPlanApplyUpdate(BusinessPlanVO VO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;		
		
		// 사업계획서 삭제
		public void delete(int bno) throws Exception;
		
	    // 파일선택
		public List<Map<String, Object>> selectFileList(int bpm_bplan_idx) throws Exception;
		
		// 선택파일정보
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	    //사업계획서 리스트조회(My)
		public List<BusinessPlanVO> businessPlanApplyMyList(Map<String,Object> paramMap) throws Exception;	
		
		// 사업계획서 상세보기
		public Map<String,Object> businessPlanApplyForm(int bam_anc_idx) throws Exception;
		
		//사업계획서 연구개발비 비용 등록
		public void businessPlanInputCost(BusinessPlanCostVO businessPlanCostVO) throws Exception;
		
		//사업계획서 연구개발비 비용 조회
		public BusinessPlanCostVO businessPlanSelectCost(int bpm_bplan_idx) throws Exception;
		
		//사업계획서 연구개발비 비용 수정
		public void businessPlanUpdateCost(BusinessPlanCostVO businessPlanCostVO) throws Exception;
		
		//사업계획서 평가위원 리스트
		public List<Map<String,Object>> businessPlanEvalMember(int bam_anc_idx) throws Exception;
		
		//사업계획서 평가위원 체크
		public String businessPlanEvalcheck(String user_id, List<Map<String,Object>> EvalMember ) throws Exception;

		//사업계획서 status 업데이트
		public int businessPlanStatusUpdate() throws Exception;
		
}    
 