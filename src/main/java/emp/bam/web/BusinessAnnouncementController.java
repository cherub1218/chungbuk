package emp.bam.web;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import emp.bam.service.BusinessAnnouncementService;
import emp.bam.util.PageMaker;
import emp.bam.util.SearchCriteria;
import emp.bam.vo.BusinessAnnouncementVO;
import emp.bem.service.BusinessEvaluationService;
import emp.bpm.service.BusinessPlanService;
import emp.cmm.service.MemberService;

@Controller
@RequestMapping("/bam")
public class BusinessAnnouncementController {

	private static final Logger logger = LoggerFactory.getLogger(BusinessAnnouncementController.class);

	@Inject
	BusinessAnnouncementService service;
	@Inject
	MemberService memberService;
	@Inject
	BusinessEvaluationService bemService;
	@Inject
	BusinessPlanService bpmService;

	//�궗�뾽 怨듦퀬 議고쉶
	@RequestMapping(value = "/businessAnnouncementList", method = RequestMethod.GET)
	public String businessAnnouncementList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("businessAnnouncementList");

		model.addAttribute("list", service.businessAnnouncementList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "bam/businessAnnouncementList";

	}

	//�궗�뾽怨듦퀬 �긽�꽭蹂닿린
	@RequestMapping(value = "/businessAnnouncementDetail", method = RequestMethod.GET)
	public String businessAnnouncementDetail(BusinessAnnouncementVO businessAnnouncementVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("read", service.businessAnnouncementDetail(businessAnnouncementVO.getBam_anc_idx()));
		model.addAttribute("scri", scri);

		
		 List<Map<String, Object>> fileList =service.selectFileList(businessAnnouncementVO.getBam_anc_idx()); model.addAttribute("file",fileList);
		 
		return "bam/businessAnnouncementDetail";
	}

	//�궗�뾽 怨듦퀬 �벑濡�
	@RequestMapping(value = "/businessAnnouncementInput", method = RequestMethod.GET)
	public void businessAnnouncementInput(Model model) throws Exception{
		logger.info("businessAnnouncementInput");
		
		model.addAttribute("memberList", memberService.memberList()); 
	
	}
	
	@RequestMapping(value = "/businessAnnouncementInputWrite", method = RequestMethod.POST)
	public String write(BusinessAnnouncementVO businessAnnouncementVO,
			@RequestParam(required = false,value = "anc_member_id") List<String> anc_member_id,
			@RequestParam(required = false,value = "anc_member_name") List<String> anc_member_name,
			@RequestParam(required = false,value = "admin_member_id") List<String> admin_member_id,
			@RequestParam(required = false,value = "admin_member_name") List<String> admin_member_name,
			MultipartHttpServletRequest mpRequest,RedirectAttributes redirect) throws Exception{
		logger.info("businessAnnouncementInputWrite");
		if(anc_member_id == null) anc_member_id.add("");
		if(anc_member_name == null) anc_member_name.add("");
		if(admin_member_id == null) admin_member_id.add("");
		if(admin_member_name == null) admin_member_name.add("");
		
		service.write(businessAnnouncementVO, mpRequest);
		int bam_anc_idx = businessAnnouncementVO.getBam_anc_idx();
		service.businessAnnouncementMember(anc_member_id,anc_member_name,bam_anc_idx);
		
		redirect.addAttribute("bam_anc_idx",bam_anc_idx);
		return "redirect:/bam/businessAnnouncementList";
	}

	//�궗�뾽 怨듦퀬 �닔�젙 �럹�씠吏� 議고쉶
	@RequestMapping(value = "/businessAnnouncementUpdate", method = RequestMethod.GET)
	public String businessAnnouncementUpdate(BusinessAnnouncementVO businessAnnouncementVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("updateView");

		model.addAttribute("update", service.businessAnnouncementDetail(businessAnnouncementVO.getBam_anc_idx()));
		model.addAttribute("scri", scri);
		model.addAttribute("memberList", memberService.memberList()); 
		model.addAttribute("evalList", memberService.evalList(businessAnnouncementVO.getBam_anc_idx()));
		List<Map<String, Object>> fileList = service.selectFileList(businessAnnouncementVO.getBam_anc_idx());
		model.addAttribute("file", fileList);
		return "bam/businessAnnouncementUpdate";
	}

	//�궗�뾽 怨듦퀬 �닔�젙
	@RequestMapping(value = "/businessAnnouncementUpdateProc", method = RequestMethod.POST)
	public String update(BusinessAnnouncementVO businessAnnouncementVO,
			@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("update");
		
		service.update(businessAnnouncementVO, files, fileNames, mpRequest);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/bam/businessAnnouncementList";
	}
	
	//�뙆�씪泥⑤�
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("FILE_SNAME");
		String originalFileName = (String) resultMap.get("FILE_FNAME");

		byte fileByte[] = org.apache.commons.io.FileUtils
				.readFileToByteArray(new File("/home/ubuntu/mp/file/" + storedFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}
	//�궗�뾽�룊媛�吏��몴 �뼇�떇�벑濡�
	 @RequestMapping(value="/businessEvaluationEdit",method = RequestMethod.POST)
	public @ResponseBody void businessEvaluationEdit (
			@RequestParam(value = "arrEval_form_title[]") List<String> arrEval_form_title,
			@RequestParam(value = "arrEval_form_item[]") List<String> arrEval_form_item,
			@RequestParam(value = "arrEval_form_score[]") List<String> arrEval_form_score,	
			@RequestParam(value = "Sbam_anc_idx") String Sbam_anc_idx,
			Model model,HttpServletResponse response) throws Exception{
		try {
			int bam_anc_idx=Integer.parseInt(Sbam_anc_idx);
			service.businessEvaluationEdit(arrEval_form_title,arrEval_form_item,arrEval_form_score,bam_anc_idx);
			
		}catch (Exception e) {
			
		}

	}
	//�궗�뾽�룊媛�吏��몴 �뼇�떇�벑濡� 酉�
	@RequestMapping(value="/businessEvaluationEdit",method = RequestMethod.GET)
	public void businessEvaluationEditView(@RequestParam(value = "bam_anc_idx") int bam_anc_idx,RedirectAttributes redirect) throws Exception{;
			logger.info("businessEvaluationEdit");
			redirect.addAttribute(bam_anc_idx);	
	}
	
	//�궗�뾽�룊媛�吏��몴 �뼇�떇 �닔�젙
	@RequestMapping(value="/businessEvaluationEditUpdate",method = RequestMethod.POST)
	public @ResponseBody void businessEvaluationEditUpdate (
				@RequestParam(value = "arrBem_beval_form_idx[]") List<String> arrBem_beval_form_idx,
				@RequestParam(value = "arrEval_form_title[]") List<String> arrEval_form_title,
				@RequestParam(value = "arrEval_form_item[]") List<String> arrEval_form_item,
				@RequestParam(value = "arrEval_form_score[]") List<String> arrEval_form_score,	
				@RequestParam(value = "Sbam_anc_idx") String Sbam_anc_idx,
				Model model,HttpServletResponse response) throws Exception{
			try {
				int bam_anc_idx=Integer.parseInt(Sbam_anc_idx);
				service.businessEvaluationEditUpdate(arrBem_beval_form_idx,arrEval_form_title,arrEval_form_item,arrEval_form_score,bam_anc_idx);
				
			}catch (Exception e) {
				
			}

		}
	//�궗�뾽�룊媛�吏��몴 �뼇�떇 �닔�젙 酉�
	@RequestMapping(value="/businessEvaluationEditUpdate",method = RequestMethod.GET)
	public void businessEvaluationEditUpdateView(@RequestParam(value = "bam_anc_idx") int bam_anc_idx,RedirectAttributes redirect,Model model) throws Exception{
				logger.info("businessEvaluationEdit");
				model.addAttribute("ancInfo",bemService.businessEvaluationFormList(bam_anc_idx));
				redirect.addAttribute(bam_anc_idx);	
		}
	
	//�궗�뾽怨꾪쉷�꽌 �뼇�떇�벑濡�
		@RequestMapping(value="/businessPlanApplyEdit",method = RequestMethod.POST)
		public String businessPlanApplyEdit (
				@RequestParam(value = "Sbam_anc_idx") String Sbam_anc_idx,
				@RequestParam(value = "bplan_form_title1") String bplan_form_title1,
				@RequestParam(value = "bplan_form_title2") String bplan_form_title2,
				@RequestParam(value = "bplan_form_title3") String bplan_form_title3,
				@RequestParam(value = "bplan_form_title4") String bplan_form_title4,
				Model model,HttpServletResponse response) throws Exception{
			
			
				int bam_anc_idx=Integer.parseInt(Sbam_anc_idx);
				Map<String,Object> paramMap = new HashMap();
				paramMap.put("bplan_form_title1",bplan_form_title1);
				paramMap.put("bplan_form_title2",bplan_form_title2);
				paramMap.put("bplan_form_title3",bplan_form_title3);
				paramMap.put("bplan_form_title4",bplan_form_title4);
				paramMap.put("bam_anc_idx",bam_anc_idx);
				service.businessPlanApplyEdit(paramMap);
				
				return "redirect:/bam/businessFormEditList";
			
		
		}
		//�궗�뾽怨꾪쉷�꽌 �뼇�떇�벑濡� 酉�
		@RequestMapping(value="/businessPlanApplyEdit",method = RequestMethod.GET)
		public void businessPlanApplyEditView(@RequestParam(value = "bam_anc_idx") int bam_anc_idx,RedirectAttributes redirect) throws Exception{;
				logger.info("businessPlanApplyEdit");
				redirect.addAttribute(bam_anc_idx);	
		}
		
		//�궗�뾽怨꾪쉷�꽌 �뼇�떇�닔�젙
		@RequestMapping(value="/businessPlanApplyEditUpdate",method = RequestMethod.POST)
		public String businessPlanApplyEditUpdate (
						@RequestParam(value = "bpm_bplan_form_idx") String bpm_bplan_form_idx,
						@RequestParam(value = "Sbam_anc_idx") String Sbam_anc_idx,
						@RequestParam(value = "bplan_form_title1") String bplan_form_title1,
						@RequestParam(value = "bplan_form_title2") String bplan_form_title2,
						@RequestParam(value = "bplan_form_title3") String bplan_form_title3,
						@RequestParam(value = "bplan_form_title4") String bplan_form_title4,
						Model model,HttpServletResponse response) throws Exception{
					
					
						int bam_anc_idx=Integer.parseInt(Sbam_anc_idx);
						Map<String,Object> paramMap = new HashMap();
						paramMap.put("bpm_bplan_form_idx",bpm_bplan_form_idx);
						paramMap.put("bplan_form_title1",bplan_form_title1);
						paramMap.put("bplan_form_title2",bplan_form_title2);
						paramMap.put("bplan_form_title3",bplan_form_title3);
						paramMap.put("bplan_form_title4",bplan_form_title4);
						paramMap.put("bam_anc_idx",bam_anc_idx);
						service.businessPlanApplyEditUpdate(paramMap);
						
						return "redirect:/bam/businessFormEditList";
					
				
				}
		//�궗�뾽怨꾪쉷�꽌 �뼇�떇�닔�젙 酉�
		@RequestMapping(value="/businessPlanApplyEditUpdate",method = RequestMethod.GET)
		public void businessPlanApplyEditUpdateView(@RequestParam(value = "bam_anc_idx") int bam_anc_idx,RedirectAttributes redirect,Model model) throws Exception{;
						logger.info("businessEvaluationEdit");
						
						Map<String,Object> resultMap = bpmService.businessPlanApplyForm(bam_anc_idx);
						model.addAttribute("form",resultMap);
						redirect.addAttribute(bam_anc_idx);	
				}
		
		//�궗�뾽怨듦퀬�뼇�떇 由ъ뒪�듃
		@RequestMapping(value="/businessFormEditList",method = RequestMethod.GET)
		public String businessFormEditList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
				logger.info("businessFormEditList");
				
				model.addAttribute("list", service.businessAnnouncementList(scri));
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(scri);
				pageMaker.setTotalCount(service.listCount(scri));
				model.addAttribute("pageMaker", pageMaker);
				return "bam/businessFormEditList";
				
		}
		
		//愿�由ъ옄 �럹�씠吏�
		@RequestMapping(value = "/businessAnnouncementDetail2", method = RequestMethod.GET)
		public String businessAnnouncementDetail2(BusinessAnnouncementVO businessAnnouncementVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
			logger.info("read");

			model.addAttribute("read", service.businessAnnouncementDetail(businessAnnouncementVO.getBam_anc_idx()));
			model.addAttribute("scri", scri);

			
			 List<Map<String, Object>> fileList =service.selectFileList(businessAnnouncementVO.getBam_anc_idx()); model.addAttribute("file",fileList);
			 
			return "bam/businessAnnouncementDetail2";
		}
		
		//�궗�뾽怨꾪쉷�꽌 �뼇�떇�궘�젣
		@RequestMapping(value="/businessAnnouncementDelete",method = RequestMethod.POST)
		public @ResponseBody String businessPlanApplyEditUpdate (@RequestParam(value = "Sbam_anc_idx") String Sbam_anc_idx) throws Exception{
														
			int bam_anc_idx = Integer.parseInt(Sbam_anc_idx);
			service.businessAnnouncementdelete(bam_anc_idx);
			
			String result = "success";
			return result;
		}
}

	
