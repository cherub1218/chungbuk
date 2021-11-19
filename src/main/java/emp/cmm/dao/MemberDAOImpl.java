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
	// 회원가입

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception{
		return sql.selectOne("memberMapper.login", vo);
	}
	
	//서비스에서 보낸 파라미터들을 memberUpdate(MemberVO vo)에 담습니다.
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// vo에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace에 
		// 아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.
		sql.update("memberMapper.memberUpdate", vo); 
	}
	
	// 업데이트와 마찬가지로 흐름은 같습니다.
@Override
public void memberDelete(MemberVO vo) throws Exception {
	// MemberVO에 담긴 값들을 보내줍니다.
	// 그럼 xml에서 memberMapper.memberDelete에 보시면
	//  #{userId}, #{userPass}에 파라미터값이 매칭이 되겠지요.
	sql.delete("memberMapper.memberDelete", vo);
	
	}


//패스워드 체크
@Override
public int passChk(MemberVO vo) throws Exception {
	int result = sql.selectOne("memberMapper.passChk", vo);
	return result;
}

//아이디 중복 체크
@Override
public int idChk(MemberVO vo) throws Exception {
	int result = sql.selectOne("memberMapper.idChk", vo);
	return result;
}

//사업자등록번호 중복 체크
@Override
public int crcodeChk(MemberVO vo) throws Exception {
	int result = sql.selectOne("memberMapper.crcodeChk", vo);
	return result;
}

//회원정보 조회
@Override
public List<Map<String, Object>> memberList() throws Exception {
	// TODO Auto-generated method stub
	return sql.selectList("memberMapper.memberList");
}
//선정된 평가위원 리스트
@Override
public List<Map<String, Object>> evalList(int bam_anc_idx) throws Exception {
	// TODO Auto-generated method stub
	return sql.selectList("memberMapper.evalList",bam_anc_idx);
}

//회원 관리
// 회원목록
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



}