package emp.cmm.vo;

import java.util.List;

public class EvalMemberVO {
	
	public int getBam_anc_idx() {
		return bam_anc_idx;
	}
	public void setBam_anc_idx(int bam_anc_idx) {
		this.bam_anc_idx = bam_anc_idx;
	}
	public int getBam_anc_member_idx() {
		return bam_anc_member_idx;
	}
	public void setBam_anc_member_idx(int bam_anc_member_idx) {
		this.bam_anc_member_idx = bam_anc_member_idx;
	}
	public String getAnc_member_id() {
		return anc_member_id;
	}
	public void setAnc_member_id(String anc_member_id) {
		this.anc_member_id = anc_member_id;
	}
	public String getAnc_member_name() {
		return anc_member_name;
	}
	public void setAnc_member_name(String anc_member_name) {
		this.anc_member_name = anc_member_name;
	}
	public String getDel_Yyn() {
		return del_Yyn;
	}
	public void setDel_Yyn(String del_Yyn) {
		this.del_Yyn = del_Yyn;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	private int bam_anc_idx;
	private int bam_anc_member_idx;
	private String anc_member_id;
	private String anc_member_name;
	private String del_Yyn;
	private String auth;
	
	

}