package emp.bem.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import emp.bam.service.BusinessAnnouncementService;
import emp.bem.service.BusinessEvaluationService;
import emp.bem.util.PageMaker;
import emp.bem.util.SearchCriteria;
import emp.bem.vo.BusinessEvaluationVO;
import emp.bpm.service.BusinessPlanService;
import emp.cmm.vo.MemberVO;



@Controller
@RequestMapping("/bem")
public class BusinessEvaluationController {

	private static final Logger logger = LoggerFactory.getLogger(BusinessEvaluationController.class);

	@Inject
	BusinessEvaluationService service;
	
	@Inject
	BusinessPlanService planService;
	
	@Inject
	BusinessAnnouncementService ancService;


	//�궗�뾽怨꾪쉷�꽌 �룊媛�吏��몴 紐⑸줉 議고쉶
	@RequestMapping(value = "/businessEvaluationList", method = RequestMethod.GET)
	public String evaluationList(Model model, @SessionAttribute("member") MemberVO member,@RequestParam("bpm_bplan_idx") int bpm_bplan_idx, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes redirect) throws Exception{
		logger.info("businessEvaluationList");

		String user_id = member.getUser_id();
		String user_auth = member.getUser_auth();
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("rowStart", scri.getRowStart());
		paramMap.put("rowEnd", scri.getRowEnd());
		paramMap.put("bpm_bplan_idx",bpm_bplan_idx);
		if(user_auth != "1") {
			paramMap.put("user_id",user_id);
			model.addAttribute("businessEvaluationList", service.businessEvaluationMyList(paramMap));
		}
		else
			model.addAttribute("businessEvaluationList", service.businessEvaluationAllList(paramMap));
		
		redirect.addAttribute("bpm_bplan_idx",bpm_bplan_idx);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "bem/businessEvaluationList";

	}
	
	@RequestMapping(value = "/businessEvaluationMyList", method = RequestMethod.GET)
	public String businessEvaluationMyList(Model model,@SessionAttribute("member") MemberVO member, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes redirect) throws Exception{
		logger.info("businessEvaluationList");
		
		String user_id = member.getUser_id();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rowStart", scri.getRowStart());
		paramMap.put("rowEnd", scri.getRowEnd());
		paramMap.put("user_id",user_id);
		model.addAttribute("businessEvaluationList", service.businessEvaluationMyList(paramMap));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "bem/businessEvaluationList";

	}

	//�궗�뾽怨꾪쉷�꽌 �룊媛�吏��몴 �벑濡�
	@RequestMapping(value = "/businessEvaluation", method = RequestMethod.GET)
	public String businessEvaluationview(Model model, @RequestParam("bam_anc_idx") int bam_anc_idx,@RequestParam("bpm_bplan_idx") int bpm_bplan_idx ) throws Exception{
		logger.info("businessEvaluation");
		System.out.println("bamidx"+bam_anc_idx);
		System.out.println("bpm_bplan_idx"+bpm_bplan_idx);
		model.addAttribute("ancInfo",service.businessEvaluationFormList(bam_anc_idx));
		model.addAttribute("bamnotice",ancService.businessAnnouncementDetail(bam_anc_idx));
		return "bem/businessEvaluation";
	}
	
	//�궗�뾽怨꾪쉷�꽌 �벑濡� �꽌鍮꾩뒪�떎�뻾
	@RequestMapping(value = "/businessEvaluation", method = RequestMethod.POST)
	public String businessEvaluation(@RequestParam("bam_anc_idx") int bam_anc_idx,@RequestParam("bpm_bplan_idx") int bpm_bplan_idx, BusinessEvaluationVO businessEvaluationVO ,RedirectAttributes redirect) throws Exception {
		logger.info("businessEvaluation");
		
		int total = Integer.parseInt(businessEvaluationVO.getEval_score1()) +
					Integer.parseInt(businessEvaluationVO.getEval_score2()) +
					Integer.parseInt(businessEvaluationVO.getEval_score3()) +
					Integer.parseInt(businessEvaluationVO.getEval_score4()) +
					Integer.parseInt(businessEvaluationVO.getEval_score5()) +
					Integer.parseInt(businessEvaluationVO.getEval_score6()) +
					Integer.parseInt(businessEvaluationVO.getEval_score7()) +
					Integer.parseInt(businessEvaluationVO.getEval_score8());
		
		businessEvaluationVO.setEval_totalscore(Integer.toString(total));
		
		service.businessEvaluation(businessEvaluationVO);
		redirect.addAttribute("bpm_bplan_idx", bpm_bplan_idx);
		redirect.addAttribute("bam_anc_idx", bam_anc_idx);
		return "redirect:/bem/businessEvaluationList";
	}
	
		//�궗�뾽怨꾪쉷�꽌 �룊媛�吏��몴 �긽�꽭 議고쉶
		@RequestMapping(value = "/businessEvaluationDetail", method = RequestMethod.GET)
		public void businessEvaluationDetail(BusinessEvaluationVO businessEvaluationVO, @RequestParam("bem_beval_idx") int bem_beval_idx, @RequestParam("bam_anc_idx") int bam_anc_idx, Model model,@RequestParam("bpm_bplan_idx") int bpm_bplan_idx) throws Exception{
			model.addAttribute("ancInfo",service.businessEvaluationFormList(bam_anc_idx));
			model.addAttribute("read", service.businessEvaluationDetail(bem_beval_idx));
			model.addAttribute("Bplan", planService.businessPlanApplyDetail(bpm_bplan_idx));
			model.addAttribute("bamnotice",ancService.businessAnnouncementDetail(bam_anc_idx));
			 
		}
		//�궗�뾽怨꾪쉷�꽌 �룊媛�吏��몴 �닔�젙 酉�
		@RequestMapping(value = "/businessEvaluationUpdate", method = RequestMethod.GET)
		public void businessEvaluationUpdateView(BusinessEvaluationVO businessEvaluationVO,@RequestParam("bem_beval_idx") int bem_beval_idx, @RequestParam("bam_anc_idx") int bam_anc_idx, Model model,@RequestParam("bpm_bplan_idx") int bpm_bplan_idx, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
			
			model.addAttribute("ancInfo",service.businessEvaluationFormList(bam_anc_idx));
			model.addAttribute("read", service.businessEvaluationDetail(bem_beval_idx));
			model.addAttribute("Bplan", planService.businessPlanApplyDetail(bpm_bplan_idx));
			model.addAttribute("bamnotice",ancService.businessAnnouncementDetail(bam_anc_idx));
		}
		//�궗�뾽怨꾪쉷�꽌 �룊媛�吏��몴 �닔�젙
		@RequestMapping(value = "/businessEvaluationUpdate", method = RequestMethod.POST)
		public String businessEvaluationUpdate(@RequestParam("bam_anc_idx") int bam_anc_idx,@RequestParam("bpm_bplan_idx") int bpm_bplan_idx,@RequestParam("bem_beval_idx") int bem_beval_idx,BusinessEvaluationVO businessEvaluationVO,Model model) throws Exception{
			
			service.businessEvaluationUpdate(businessEvaluationVO);
			return "redirect:/bem/businessEvaluationList?bpm_bplan_idx="+bpm_bplan_idx+"&bam_anc_idx="+bam_anc_idx;
			
		}

		
	//�궗�뾽怨꾪쉷�꽌 醫낇빀�쓽寃� 議고쉶
	@RequestMapping(value = "/businessEvaluationOpinion", method = RequestMethod.GET)
	public String opinion(Model model, @ModelAttribute("scri") SearchCriteria scri,@RequestParam("bam_anc_idx") int bam_anc_idx,@RequestParam("bpm_bplan_idx") int bpm_bplan_idx) throws Exception{
		logger.info("businessEvaluationOpinion");
		
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("bpm_bplan_idx",bpm_bplan_idx);
		model.addAttribute("businessEvaluationList", service.businessEvaluationList(paramMap));
		model.addAttribute("ancInfo",service.businessEvaluationFormList(bam_anc_idx));
		
		return "bem/businessEvaluationOpinion";
	}


}