package emp.cmm.vo;

import java.util.List;

public class MemberVO {
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	private int member_idx;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_bname;
	private String user_crcode;
	private String hp_num;
	private String user_email;
	private String user_auth;
	private String del_yn;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getHp_num() {
		return hp_num;
	}
	public void setHp_num(String hp_num) {
		this.hp_num = hp_num;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_bname() {
		return user_bname;
	}
	public void setUser_bname(String user_bname) {
		this.user_bname = user_bname;
	}
	public String getUser_crcode() {
		return user_crcode;
	}
	public void setUser_crcode(String user_crcode) {
		this.user_crcode = user_crcode;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}

}