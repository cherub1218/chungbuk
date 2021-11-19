package emp.bpm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import emp.bpm.dao.BusinessPlanDAO;
import emp.bpm.util.FileUtils;
import emp.bpm.util.SearchCriteria;
import emp.bpm.vo.BusinessPlanCostVO;
import emp.bpm.vo.BusinessPlanVO;
import oracle.net.aso.o;





@Service
public class BusinessPlanServiceImpl implements BusinessPlanService {
	
	
	@Resource(name="bpmFileUtils")
	private FileUtils fileUtils;

	@Inject
	private BusinessPlanDAO dao;
	
	// 寃뚯떆湲� �옉�꽦
	@Override
	public void write(BusinessPlanVO businessPlanVO,MultipartHttpServletRequest mpRequest) throws Exception {
		// TODO Auto-generated method stub
		dao.write(businessPlanVO);
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(businessPlanVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
					}
	}
	
	// 寃뚯떆臾� 紐⑸줉 議고쉶
	@Override
	public List<BusinessPlanVO> businessPlanApplyList(Map<String,Object> paramMap) throws Exception {

		return dao.businessPlanApplyList(paramMap);
	}
	
	
	// 媛쒖떆臾� 珥� 媛��닔
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}

	
	// 寃뚯떆臾� 議고쉶
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BusinessPlanVO businessPlanApplyDetail(int bpm_bplan_idx) throws Exception {
		/* dao.boardHit(bno); */
		return dao.businessPlanApplyDetail(bpm_bplan_idx);
	}
	
	
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		
		dao.delete(bno);
		
	}
	
	@Override
	public void businessPlanApplyUpdate(BusinessPlanVO businessPlanVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.businessPlanApplyUpdate(businessPlanVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(businessPlanVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}

	// 泥⑤��뙆�씪 議고쉶
	@Override
	public List<Map<String, Object>> selectFileList(int bpm_bplan_idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bpm_bplan_idx);
	}

	// 泥⑤��뙆�씪 �떎�슫濡쒕뱶
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}
	
	@Override
	public List<BusinessPlanVO> businessPlanApplyMyList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessPlanApplyMyList(paramMap);
	}
	
	@Override
	public void businessPlanInputCost(BusinessPlanCostVO businessPlanCostVO) throws Exception {
		// TODO Auto-generated method stub
		dao.businessPlanInputCost(businessPlanCostVO);
		
	}
	
	@Override
	public BusinessPlanCostVO businessPlanSelectCost(int bpm_bplan_idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessPlanSelectCost(bpm_bplan_idx);
	}
	
	
	@Override
	public Map<String,Object> businessPlanApplyForm(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessPlanApplyForm(bam_anc_idx);
	}

	
	@Override
	public List<Map<String, Object>> businessPlanEvalMember(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.businessPlanEvalMember(bam_anc_idx);
	}
	
	@Override
	public String businessPlanEvalcheck(String user_id, List<Map<String, Object>> EvalMember) throws Exception {
		// TODO Auto-generated method stub
		List<String> resultList = new ArrayList();
		String Status = "";
		for(int i=0;i<EvalMember.size();i++) {
			resultList.add(EvalMember.get(i).get("ANC_MEMBER_ID").toString().trim());
		}
		for(String temp : resultList) {
			if(temp.equals(user_id)) {
				Status = "Success";
			}
		}
		if(!Status.equals("Success"))
			Status = "Fail";
		
		return Status;
	}
	@Override
	public void businessPlanUpdateCost(BusinessPlanCostVO businessPlanCostVO) throws Exception {
		// TODO Auto-generated method stub
		dao.businessPlanUpdateCost(businessPlanCostVO);
	}
	
	@Override
	public int businessPlanStatusUpdate() throws Exception {
		// TODO Auto-generated method stub
		return dao.businessPlanStatusUpdate();
	}
}
