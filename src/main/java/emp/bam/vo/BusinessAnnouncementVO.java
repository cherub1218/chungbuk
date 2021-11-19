package emp.bam.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BusinessAnnouncementVO {
	
	
	private int bam_anc_idx;
	private int board_idx = 1;
	private String anc_title;
	private String anc_remark;
	private String writer;
	private String bplan_form_chk;
	private String eval_form_chk;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date anc_begin_dt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date anc_end_dt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mod_date;
	
	public String getBplan_form_chk() {
		return bplan_form_chk;
	}
	public void setBplan_form_chk(String bplan_form_chk) {
		this.bplan_form_chk = bplan_form_chk;
	}
	public String getEval_form_chk() {
		return eval_form_chk;
	}
	public void setEval_form_chk(String eval_form_chk) {
		this.eval_form_chk = eval_form_chk;
	}
	public int getBam_anc_idx() {
		return bam_anc_idx;
	}
	public void setBam_anc_idx(int bam_anc_idx) {
		this.bam_anc_idx = bam_anc_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getAnc_title() {
		return anc_title;
	}
	public void setAnc_title(String anc_title) {
		this.anc_title = anc_title;
	}
	public String getAnc_remark() {
		return anc_remark;
	}
	public void setAnc_remark(String anc_remark) {
		this.anc_remark = anc_remark;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getAnc_begin_dt() {
		return anc_begin_dt;
	}
	public void setAnc_begin_dt(Date anc_begin_dt) {
		this.anc_begin_dt = anc_begin_dt;
	}
	public Date getAnc_end_dt() {
		return anc_end_dt;
	}
	public void setAnc_end_dt(Date anc_end_dt) {
		this.anc_end_dt = anc_end_dt;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}

	
	

	

	
	
	
	
}