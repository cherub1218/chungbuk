package emp.cmm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import emp.bam.vo.BusinessAnnouncementVO;
import emp.cmm.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	// �쉶�썝媛��엯

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return sql.selectOne("memberMapper.login", vo);
	}
	
	//�꽌鍮꾩뒪�뿉�꽌 蹂대궦 �뙆�씪誘명꽣�뱾�쓣 memberUpdate(MemberVO vo)�뿉 �떞�뒿�땲�떎.
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// vo�뿉 �떞湲� �뙆�씪誘명꽣�뱾�� memberMapper.xml�뿉 memberMapper�씪�뒗 namespace�뿉 
		// �븘�씠�뵒媛� memberUpdate�씤 荑쇰━�뿉 �뙆�씪誘명꽣�뱾�쓣 �꽔�뼱以띾땲�떎.
		sql.update("memberMapper.memberUpdate", vo); 
	}
	
	// �뾽�뜲�씠�듃�� 留덉갔媛�吏�濡� �쓲由꾩� 媛숈뒿�땲�떎.
@Override
public void memberDelete(MemberVO vo) throws Exception {
	// MemberVO�뿉 �떞湲� 媛믩뱾�쓣 蹂대궡以띾땲�떎.
	// 洹몃읆 xml�뿉�꽌 memberMapper.memberDelete�뿉 蹂댁떆硫�
	//  #{userId}, #{userPass}�뿉 �뙆�씪誘명꽣媛믪씠 留ㅼ묶�씠 �릺寃좎��슂.
	sql.delete("memberMapper.memberDelete", vo);
	
	}


//�뙣�뒪�썙�뱶 泥댄겕
@Override
public int passChk(MemberVO vo) throws Exception {
	int result = sql.selectOne("memberMapper.passChk", vo);
	return result;
}

//�븘�씠�뵒 以묐났 泥댄겕
@Override
public int idChk(MemberVO vo) throws Exception {
	int result = sql.selectOne("memberMapper.idChk", vo);
	return result;
}

//�궗�뾽�옄�벑濡앸쾲�샇 以묐났 泥댄겕
@Override
public int crcodeChk(MemberVO vo) throws Exception {
	int result = sql.selectOne("memberMapper.crcodeChk", vo);
	return result;
}

//�쉶�썝�젙蹂� 議고쉶
@Override
public List<Map<String, Object>> memberList() throws Exception {
	// TODO Auto-generated method stub
	return sql.selectList("memberMapper.memberList");
}
//�꽑�젙�맂 �룊媛��쐞�썝 由ъ뒪�듃
@Override
public List<Map<String, Object>> evalList(int bam_anc_idx) throws Exception {
	// TODO Auto-generated method stub
	return sql.selectList("memberMapper.evalList",bam_anc_idx);
}

//�쉶�썝 愿�由�
// �쉶�썝紐⑸줉
@Override
public List<MemberVO> memberMngList() throws Exception {
    return sql.selectList("memberMapper.memberMngList");
}


@Override
public MemberVO memberMngDetail(int member_idx) throws Exception {
	// TODO Auto-generated method stub
	return sql.selectOne("memberMapper.memberMngDetail",member_idx);
}

@Override
public void deleteMember(String user_id) throws Exception {
    // TODO Auto-generated method stub

}

@Override
public void updateMember(MemberVO vo) throws Exception {
    // TODO Auto-generated method stub

}

@Override
public void memberDelYN(MemberVO vo) throws Exception {
	// vo�뿉 �떞湲� �뙆�씪誘명꽣�뱾�� memberMapper.xml�뿉 memberMapper�씪�뒗 namespace�뿉 
	// �븘�씠�뵒媛� memberUpdate�씤 荑쇰━�뿉 �뙆�씪誘명꽣�뱾�쓣 �꽔�뼱以띾땲�떎.
	sql.update("memberMapper.memberDelYN", vo); 
}



}