package emp.bam.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bam.util.SearchCriteria;
import emp.bam.vo.BusinessAnnouncementVO;

public interface BusinessAnnouncementService {

		// 사업공고 리스트조회
		public List<BusinessAnnouncementVO> businessAnnouncementList(SearchCriteria scri) throws Exception;
		
		// 사업공고등록
		public void write(BusinessAnnouncementVO VO,MultipartHttpServletRequest mpRequest) throws Exception;
		
		// 사업공고 갯수
		public int listCount(SearchCriteria scri) throws Exception;

		// 사업공고 상세보기
		public BusinessAnnouncementVO businessAnnouncementDetail(int BAM_ANC_IDX) throws Exception;
		
		// 사업공고 수정
		public void update(BusinessAnnouncementVO VO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;	
		
		// 사업공고 삭제
		public void businessAnnouncementdelete(int bam_anc_idx) throws Exception;
		
	    // 파일선택
		public List<Map<String, Object>> selectFileList(int bno) throws Exception;
		
		// 선택파일정보
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
		//사업 평가지표 양식 등록 
		public void businessEvaluationEdit(List<String> arrEval_form_title, List<String> arrEval_form_item, List<String> arrEval_form_score,int bam_anc_idx) throws Exception;
		
		//사업 계획서 양식 등록 
		public void businessPlanApplyEdit(Map<String,Object> paramMap) throws Exception;
		
		//사업 공고 평가위원 등록
		public void businessAnnouncementMember(List<String> anc_member_id,List<String> anc_member_name, int bam_anc_idx) throws Exception;
		
		//공고일자 만료된 사업공고 삭제
		public void businessAnnouncementOldUpdate() throws Exception;
		
		//사업 평가지표 양식 수정 
		public void businessEvaluationEditUpdate(List<String> arrBem_beval_form_idx,List<String> arrEval_form_title, List<String> arrEval_form_item, List<String> arrEval_form_score,int bam_anc_idx) throws Exception;
		
		//사업 계획서 양식 수정 
		public void businessPlanApplyEditUpdate(Map<String,Object> paramMap) throws Exception;
		
	}    
 