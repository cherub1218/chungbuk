package emp.bpm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bpm.util.SearchCriteria;
import emp.bpm.vo.BusinessPlanCostVO;
import emp.bpm.vo.BusinessPlanVO;




@Repository
public class BusinessPlanDAOImpl implements BusinessPlanDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 사업공고리스트 조회
	@Override
	public List<BusinessPlanVO> businessPlanApplyList(Map<String,Object> paramMap) throws Exception {
	
		return sqlSession.selectList("businessPlanMapper.businessPlanApplyList", paramMap);

	}
	
	// 사업공고등록
	@Override
	public void write(BusinessPlanVO businessPlanVO) throws Exception {
		sqlSession.insert("businessPlanMapper.insert", businessPlanVO);
		
	}
	
	// 사업리스트 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("businessPlanMapper.listCount", scri);
	}

	// 사업공고 상세보기
	@Override
	public BusinessPlanVO businessPlanApplyDetail(int bpm_bplan_idx) throws Exception {
			
		return sqlSession.selectOne("businessPlanMapper.businessPlanApplyDetail", bpm_bplan_idx);
	}
	
	// 사업공고 수정
	@Override
	public void businessPlanApplyUpdate(BusinessPlanVO businessPlanVO) throws Exception {
		
		sqlSession.update("businessPlanMapper.businessPlanApplyUpdate", businessPlanVO);
	}

	// 사업공고 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("businessPlanMapper.delete", bno);
	}
	
	// 첨부파일 등록
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("businessPlanMapper.insertFile", map);
	}
	
   	// 파일선택리스트
	@Override
	public List<Map<String, Object>> selectFileList(int bpm_bplan_idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessPlanMapper.selectFileList", bpm_bplan_idx);
	}
	
	// 선택파일정보
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessPlanMapper.selectFileInfo", map);
	}
	
	// 첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("businessPlanMapper.updateFile", map);
	}
	
	// 사업공고 조회수
	@Override
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessPlanMapper.boardHit", bno);
	}
	
	@Override
	public List<BusinessPlanVO> businessPlanApplyMyList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessPlanMapper.businessPlanApplyMyList", paramMap);
	}
	
	@Override
	public Map<String,Object> businessPlanApplyForm(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessPlanMapper.businessPlanApplyForm", bam_anc_idx);
	}
	@Override
	public void businessPlanInputCost(BusinessPlanCostVO businessPlanCostVO) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.insert("businessPlanMapper.businessPlanInputCost",businessPlanCostVO);
		
	}
	
	@Override
	public BusinessPlanCostVO businessPlanSelectCost(int bpm_bplan_idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessPlanMapper.businessPlanSelectCost",bpm_bplan_idx);
	}
	
	@Override
	public List<Map<String, Object>> businessPlanEvalMember(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessPlanMapper.businessPlanEvalMember",bam_anc_idx);
	}
	
	@Override
	public void businessPlanUpdateCost(BusinessPlanCostVO businessPlanCostVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessPlanMapper.businessPlanApplyCostUpdate", businessPlanCostVO);
	}
	
	@Override
	public int businessPlanStatusUpdate() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("businessPlanMapper.businessPlanStatusUpdate");
	}
	
}