package emp.bam.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import emp.bam.util.SearchCriteria;
import emp.bam.vo.BusinessAnnouncementVO;



@Repository
public class BusinessAnnouncementDAOImpl implements BusinessAnnouncementDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 사업공고리스트 조회
	@Override
	public List<BusinessAnnouncementVO> businessAnnouncementList(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("businessAnnouncementMapper.businessAnnouncementList", scri);

	}
	
	// 사업공고등록
	@Override
	public void write(BusinessAnnouncementVO VO) throws Exception {
		sqlSession.insert("businessAnnouncementMapper.insert", VO);
		
	}
	
	// 사업리스트 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("businessAnnouncementMapper.listCount", scri);
	}

	// 사업공고 상세보기
	@Override
	public BusinessAnnouncementVO businessAnnouncementDetail(int BAM_ANC_IDX) throws Exception {
			
		return sqlSession.selectOne("businessAnnouncementMapper.read", BAM_ANC_IDX);
	}
	
	// 사업공고 수정
	@Override
	public void update(BusinessAnnouncementVO businessAnnouncementVO) throws Exception {
		
		sqlSession.update("businessAnnouncementMapper.update", businessAnnouncementVO);
	}

	// 사업공고 삭제
	@Override
	public void businessAnnouncementdelete(int bam_anc_idx) throws Exception {
		
		sqlSession.delete("businessAnnouncementMapper.delete", bam_anc_idx);
	}
	
	// 첨부파일 등록
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("businessAnnouncementMapper.insertFile", map);
	}
	
   	// 파일선택리스트
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessAnnouncementMapper.selectFileList", bno);
	}
	
	// 선택파일정보
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessAnnouncementMapper.selectFileInfo", map);
	}
	
	// 첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("businessAnnouncementMapper.updateFile", map);
	}
	
	// 사업공고 조회수
	@Override
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessAnnouncementMapper.boardHit", bno);
	}
	
	@Override
	public void businessEvaluationEdit(Map<String,Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("businessAnnouncementMapper.businessEvaluationEdit",paramMap);
	}
	
	@Override
	public void businessPlanApplyEdit(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("businessAnnouncementMapper.businessPlanApplyEdit",paramMap);
	}
	//사업공고 평가위원 등록
	@Override
	public void businessAnnouncementMember(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("businessAnnouncementMapper.businessAnnouncementMember",paramMap);	
	}
	@Override
	public void businessEvaluationEditChk(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessAnnouncementMapper.businessEvaluationEditChk",bam_anc_idx);
	}
	@Override
	public void businessPlanApplyEditChk(int bam_anc_idx) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessAnnouncementMapper.businessPlanApplyEditChk",bam_anc_idx);
	}
	@Override
	public void businessAnnouncementOldUpdate() throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessAnnouncementMapper.businessAnnouncementOldUpdate");
	}
	
	@Override
	public void businessEvaluationEditUpdate(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessAnnouncementMapper.businessEvaluationEditUpdate",paramMap);
	}
	
	@Override
	public void businessPlanApplyEditUpdate(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("businessAnnouncementMapper.businessPlanApplyEditUpdate",paramMap);
	}
}