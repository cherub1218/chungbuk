 package emp.cmm.dao;

import java.util.List;
import java.util.Map;

import emp.bam.vo.BusinessAnnouncementVO;
import emp.cmm.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;

	//로그인
	public MemberVO login(MemberVO vo) throws Exception;

	//회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	//패스워드 체크
	public int passChk(MemberVO vo) throws Exception;
	
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	// 사업자등록번호 중복체크
	public int crcodeChk(MemberVO vo) throws Exception;
	
	//멤버리스트 조회 
	public List<Map<String,Object>> memberList() throws Exception;
	
	//선정된 평가위원 리스트 조회
	public List<Map<String,Object>> evalList(int bam_anc_idx) throws Exception;
///////회원 관리//////////
    // 회원 목록 
    public List<MemberVO> memberMngList() throws Exception;
    // 회원 정보 상세보기
    public MemberVO memberMngDetail(int member_idx) throws Exception;
    // 회원삭제
    public void deleteMember(String userId) throws Exception;
    // 회원정보 수정
    public void updateMember(MemberVO vo ) throws Exception;
}
