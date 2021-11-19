package emp.bam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bam.dao.BusinessAnnouncementDAO;
import emp.bam.util.FileUtils;
import emp.bam.util.SearchCriteria;
import emp.bam.vo.BusinessAnnouncementVO;



@Service
public class BusinessAnnouncementServiceImpl implements BusinessAnnouncementService {
	
	
	@Resource(name="bamfileUtils")
	private FileUtils FileUtils;

	@Inject
	private BusinessAnnouncementDAO dao;
	
	// 寃뚯떆湲� �옉�꽦
	@Override
	public void write(BusinessAnnouncementVO businessAnnouncementVO,MultipartHttpServletRequest mpRequest) throws Exception {
		// TODO Auto-generated method stub
		dao.write(businessAnnouncementVO);
		
		List<Map<String,Object>> list = FileUtils.parseInsertFileInfo(businessAnnouncementVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
					}
	}
	
	// 寃뚯떆臾� 紐⑸줉 議고쉶
	@Override
	public List<BusinessAnnouncementVO> businessAnnouncementList(SearchCriteria scri) throws Exception {

		return dao.businessAnnouncementList(scri);
	}
	
	
	// 媛쒖떆臾� 珥� 媛��닔
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}

	
	// 寃뚯떆臾� 議고쉶
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BusinessAnnouncementVO businessAnnouncementDetail(int BAM_ANC_IDX) throws Exception {
		/* dao.boardHit(bno); */
		return dao.businessAnnouncementDetail(BAM_ANC_IDX);
	}
	
	
	@Override
	public void businessAnnouncementdelete(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		
		dao.businessAnnouncementdelete(bam_anc_idx);
		
	}

	// 泥⑤��뙆�씪 議고쉶
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}

	// 泥⑤��뙆�씪 �떎�슫濡쒕뱶
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}
	
	
	
	@Override
	public void update(BusinessAnnouncementVO businessAnnouncementVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.update(businessAnnouncementVO);
		
		List<Map<String, Object>> list = FileUtils.parseUpdateFileInfo(businessAnnouncementVO, files, fileNames, mpRequest);
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
	
	@Override
	public void businessPlanApplyEdit(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		dao.businessPlanApplyEdit(paramMap);
		int bam_anc_idx = Integer.parseInt(paramMap.get("bam_anc_idx").toString());
		dao.businessPlanApplyEditChk(bam_anc_idx);
		
	}
	@Override
	public void businessEvaluationEdit(List<String> arrEval_form_title, List<String> arrEval_form_item,
			List<String> arrEval_form_score,int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
			for(int i=0; i < arrEval_form_title.size();i++) {
				String eval_form_title = arrEval_form_title.get(i);
				String eval_form_item = arrEval_form_item.get(i);
				String eval_form_score = arrEval_form_score.get(i);
				
				Map<String,Object> paramMap = new HashMap();
				paramMap.put("eval_form_title",eval_form_title);
				paramMap.put("eval_form_item",eval_form_item);
				paramMap.put("eval_form_score",eval_form_score);
				paramMap.put("bam_anc_idx",bam_anc_idx);
				dao.businessEvaluationEdit(paramMap);
				if(i == arrEval_form_title.size()-1) {
					dao.businessEvaluationEditChk(bam_anc_idx);
				
				}
			}
		
	}

	@Override
	public void businessAnnouncementMember(List<String> anc_member_id, List<String> anc_member_name, int bam_anc_idx)
			throws Exception {
		// TODO Auto-generated method stub
		for(int i=0; i <anc_member_id.size();i++) {
			String Sanc_member_id = anc_member_id.get(i);
			String Sanc_member_name = anc_member_name.get(i);
			Map<String,Object> paramMap = new HashMap();
			paramMap.put("anc_member_id",Sanc_member_id);
			paramMap.put("anc_member_name",Sanc_member_name);
			paramMap.put("bam_anc_idx",bam_anc_idx);
			dao.businessAnnouncementMember(paramMap);
			System.out.println((i+1)+"번쨰 데이터");
		}
	}
		@Override
		public void businessAnnouncementOldUpdate() throws Exception {
			// TODO Auto-generated method stub
			dao.businessAnnouncementOldUpdate();
		}
		
		@Override
		public void businessEvaluationEditUpdate(List<String> arrBem_beval_form_idx,List<String> arrEval_form_title, List<String> arrEval_form_item,
				List<String> arrEval_form_score, int bam_anc_idx) throws Exception {
			// TODO Auto-generated method stub
			String bem_beval_form_idx="";
			String eval_form_title ="";
			String eval_form_item ="";
			String eval_form_score="";
			for(int i=0; i < arrEval_form_title.size();i++) {
				bem_beval_form_idx = arrBem_beval_form_idx.get(i);
				eval_form_title = arrEval_form_title.get(i);
				eval_form_item = arrEval_form_item.get(i);
				eval_form_score = arrEval_form_score.get(i);
				
				Map<String,Object> paramMap = new HashMap();
				paramMap.put("bem_beval_form_idx",bem_beval_form_idx);
				paramMap.put("eval_form_title",eval_form_title);
				paramMap.put("eval_form_item",eval_form_item);
				paramMap.put("eval_form_score",eval_form_score);
				paramMap.put("bam_anc_idx",bam_anc_idx);
				dao.businessEvaluationEditUpdate(paramMap);
				
			}
		}
		@Override
		public void businessPlanApplyEditUpdate(Map<String, Object> paramMap) throws Exception {
			// TODO Auto-generated method stub
			dao.businessPlanApplyEditUpdate(paramMap);
		}
}
