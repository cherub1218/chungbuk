package emp.bem.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import emp.bpm.util.Criteria;
import emp.bpm.vo.BusinessPlanVO;

public class BusinessEvaluationVO extends Criteria{
	private int bam_anc_idx;
	private int bpm_bplan_idx;
	private int board_idx;
	private int bem_beval_idx;
	private String eval_score1;
	private String eval_score2;
	private String eval_score3;
	private String eval_score4;
	private String eval_score5;
	private String eval_score6;
	private String eval_score7;
	private String eval_score8;
	private String writer_id;
	
	private String eval_totalscore;
	private String eval_opinion;
	private String eval_writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mod_date;
	private BusinessPlanVO businessPlanVO;
	
	
	public int getBam_anc_idx() {
		return bam_anc_idx;
	}
	public void setBam_anc_idx(int bam_anc_idx) {
		this.bam_anc_idx = bam_anc_idx;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public BusinessPlanVO getBusinessPlanVO() {
		return businessPlanVO;
	}
	public void setBusinessPlanVO(BusinessPlanVO businessPlanVO) {
		this.businessPlanVO = businessPlanVO;
	}
	public String getWrite_id() {
		return writer_id;
	}
	public void setWrite_id(String write_id) {
		this.writer_id = write_id;
	}
	public String getEval_score7() {
		return eval_score7;
	}
	public void setEval_score7(String eval_score7) {
		this.eval_score7 = eval_score7;
	}
	public String getEval_score8() {
		return eval_score8;
	}
	public void setEval_score8(String eval_score8) {
		this.eval_score8 = eval_score8;
	}
	public int getBpm_bplan_idx() {
		return bpm_bplan_idx;
	}
	public void setBpm_bplan_idx(int bpm_bplan_idx) {
		this.bpm_bplan_idx = bpm_bplan_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getBem_beval_idx() {
		return bem_beval_idx;
	}
	public void setBem_beval_idx(int bem_beval_idx) {
		this.bem_beval_idx = bem_beval_idx;
	}
	public String getEval_score1() {
		return eval_score1;
	}
	public void setEval_score1(String eval_score1) {
		this.eval_score1 = eval_score1;
	}
	public String getEval_score2() {
		return eval_score2;
	}
	public void setEval_score2(String eval_score2) {
		this.eval_score2 = eval_score2;
	}
	public String getEval_score3() {
		return eval_score3;
	}
	public void setEval_score3(String eval_score3) {
		this.eval_score3 = eval_score3;
	}
	public String getEval_score4() {
		return eval_score4;
	}
	public void setEval_score4(String eval_score4) {
		this.eval_score4 = eval_score4;
	}
	public String getEval_score5() {
		return eval_score5;
	}
	public void setEval_score5(String eval_score5) {
		this.eval_score5 = eval_score5;
	}
	public String getEval_score6() {
		return eval_score6;
	}
	public void setEval_score6(String eval_score6) {
		this.eval_score6 = eval_score6;
	}
	public String getEval_opinion() {
		return eval_opinion;
	}
	public void setEval_opinion(String eval_opinion) {
		this.eval_opinion = eval_opinion;
	}
	public String getEval_writer() {
		return eval_writer;
	}
	public void setEval_writer(String eval_writer) {
		this.eval_writer = eval_writer;
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
	public String getEval_totalscore() {
		return eval_totalscore;
	}
	public void setEval_totalscore(String eval_totalscore) {
		this.eval_totalscore = eval_totalscore;
	}
	
}