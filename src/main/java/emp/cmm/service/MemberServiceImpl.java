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
	
	//�뙣�뒪�썙�뱶 泥댄겕
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	
	//�븘�씠�뵒 以묐났 泥댄겕
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	//�궗�뾽�옄�벑濡앸쾲�샇 以묐났 泥댄겕
	@Override
	public int crcodeChk(MemberVO vo) throws Exception {
		int result = dao.crcodeChk(vo);
		return result;
	}
	//硫ㅻ쾭由ъ뒪�듃 議고쉶
	@Override
	public List<Map<String, Object>> memberList() throws Exception {
		// TODO Auto-generated method stub
		return dao.memberList();
	}
	
	//�꽑�젙�맂 �룊媛��쐞�썝 由ъ뒪�듃
    @Override
    public List<Map<String, Object>> evalList(int bam_anc_idx) throws Exception {
    	// TODO Auto-generated method stub
    	return dao.evalList(bam_anc_idx);
    }
	
	////****�쉶�썝 愿�由�
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
    
    @Override
	public void memberDelYN(MemberVO vo) throws Exception{
		dao.memberDelYN(vo);
	}
    

}