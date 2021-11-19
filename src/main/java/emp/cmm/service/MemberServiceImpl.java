package emp.cmm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import emp.bam.vo.BusinessAnnouncementVO;
import emp.cmm.dao.MemberDAO;
import emp.cmm.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		
		if(vo.getUser_crcode() == null) {
			vo.setUser_crcode("");
		}
		if(vo.getUser_bname() == null) {
			vo.setUser_bname("");
		}
		dao.register(vo);
		
	}
	 
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return dao.login(vo);
	}
	
	@Override
	public void memberUpdate(MemberVO vo) throws Exception{
		
		
		dao.memberUpdate(vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
		}
	
	//패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	
	//아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	//사업자등록번호 중복 체크
	@Override
	public int crcodeChk(MemberVO vo) throws Exception {
		int result = dao.crcodeChk(vo);
		return result;
	}
	//멤버리스트 조회
	@Override
	public List<Map<String, Object>> memberList() throws Exception {
		// TODO Auto-generated method stub
		return dao.memberList();
	}
	
	//선정된 평가위원 리스트
    @Override
    public List<Map<String, Object>> evalList(int bam_anc_idx) throws Exception {
    	// TODO Auto-generated method stub
    	return dao.evalList(bam_anc_idx);
    }
	
	////****회원 관리
    @Override
    public List<MemberVO> memberMngList() throws Exception {
        return dao.memberMngList();
    }
 
 
   @Override
	public MemberVO memberMngDetail(int member_idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberMngDetail(member_idx);
	}
    @Override
    public void deleteMember(String user_id) throws Exception {
        
    }
 
    @Override
    public void updateMember(MemberVO vo) throws Exception {
        
    }
    

}