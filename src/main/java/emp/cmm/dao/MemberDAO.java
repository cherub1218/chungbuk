 package emp.cmm.dao;

import java.util.List;
import java.util.Map;

import emp.bam.vo.BusinessAnnouncementVO;
import emp.cmm.vo.MemberVO;

public interface MemberDAO {
	
	// �쉶�썝媛��엯
	public void register(MemberVO vo) throws Exception;

	//濡쒓렇�씤
	public MemberVO login(MemberVO vo) throws Exception;

	//�쉶�썝�젙蹂� �닔�젙
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//�쉶�썝 �깉�눜
	public void memberDelete(MemberVO vo) throws Exception;
	
	//�뙣�뒪�썙�뱶 泥댄겕
	public int passChk(MemberVO vo) throws Exception;
	
	// �븘�씠�뵒 以묐났泥댄겕
	public int idChk(MemberVO vo) throws Exception;
	
	// �궗�뾽�옄�벑濡앸쾲�샇 以묐났泥댄겕
	public int crcodeChk(MemberVO vo) throws Exception;
	
	//硫ㅻ쾭由ъ뒪�듃 議고쉶 
	public List<Map<String,Object>> memberList() throws Exception;
	
	//�꽑�젙�맂 �룊媛��쐞�썝 由ъ뒪�듃 議고쉶
	public List<Map<String,Object>> evalList(int bam_anc_idx) throws Exception;
///////�쉶�썝 愿�由�//////////
    // �쉶�썝 紐⑸줉 
    public List<MemberVO> memberMngList() throws Exception;
    // �쉶�썝 �젙蹂� �긽�꽭蹂닿린
    public MemberVO memberMngDetail(int member_idx) throws Exception;
    // �쉶�썝�궘�젣
    public void deleteMember(String userId) throws Exception;
    // �쉶�썝�젙蹂� �닔�젙
    public void updateMember(MemberVO vo ) throws Exception;

	public void memberDelYN(MemberVO vo) throws Exception;
}
