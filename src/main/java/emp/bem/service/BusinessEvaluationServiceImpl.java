package emp.bem.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bem.dao.BusinessEvaluationDAO;
import emp.bem.util.FileUtils;
import emp.bem.util.SearchCriteria;
import emp.bem.vo.BusinessEvaluationVO;



@Service
public class BusinessEvaluationServiceImpl implements BusinessEvaluationService {
	
	
	@Resource(name="bemFileUtils")
	private FileUtils fileUtils;

	@Inject
	private BusinessEvaluationDAO dao;
	
	// 寃뚯떆湲� �옉�꽦
	@Override
	public void businessEvaluation(BusinessEvaluationVO businessEvaluationVO) throws Exception {
		// TODO Auto-generated method stub
		dao.businessEvaluation(businessEvaluationVO);
	}
	
	@Override
	public List<BusinessEvaluationVO> businessEvaluationList(Map<String, Integer> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessEvaluationList(paramMap);
	}
	
	// 媛쒖떆臾� 珥� 媛��닔
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}

	
	// 寃뚯떆臾� 議고쉶
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BusinessEvaluationVO businessEvaluationDetail(int bem_beval_idx) throws Exception {
		/* dao.boardHit(bno); */
		return dao.businessEvaluationDetail(bem_beval_idx);
	}
	
	@Override
	public void businessEvaluationUpdate(BusinessEvaluationVO businessEvaluationVO) throws Exception {
		// TODO Auto-generated method stub
		dao.businessEvaluationUpdate(businessEvaluationVO);
	}
	
	@Override
	public void delete(int bem_beval_idx) throws Exception {
		// TODO Auto-generated method stub
		
		dao.delete(bem_beval_idx);
		
	}
	@Override
	public List<BusinessEvaluationVO> businessEvaluationMyList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessEvaluationMyList(paramMap);
	}

	@Override
	public List<Map<String, Object>> businessEvaluationFormList(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessEvaluationFormList(bam_anc_idx);
	}
	
	@Override
	public int businessEvaluationOverLapChk(Map<String, Object> evalparam) throws Exception {
		// TODO Auto-generated method stub
		
		int result = dao.businessEvaluationOverLapChk(evalparam);
		 
		return result;
	}
	@Override
	public List<BusinessEvaluationVO> businessEvaluationAllList(Map<String,Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessEvaluationAllList(paramMap);
	}

}
