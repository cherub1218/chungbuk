package emp.bpm.web;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import emp.bem.service.BusinessEvaluationService;
import emp.bpm.service.BusinessPlanService;
import emp.bpm.util.PageMaker;
import emp.bpm.util.SearchCriteria;
import emp.bpm.vo.BusinessPlanCostVO;
import emp.bpm.vo.BusinessPlanVO;
import emp.cmm.vo.MemberVO;

@Controller
@RequestMapping("/bpm")
public class BusinessPlanController {

	private static final Logger logger = LoggerFactory.getLogger(BusinessPlanController.class);
	
	@Inject
	BusinessPlanService service;
	
	@Inject
	BusinessEvaluationService evalservice;



	@RequestMapping(value = "/businessPlanApply", method = RequestMethod.GET)
	public void businessPlanApply(@RequestParam("bam_anc_idx") int bam_anc_idx, Model model) throws Exception {
		logger.info("businessPlanApply");
		
		Map<String,Object> resultMap = service.businessPlanApplyForm(bam_anc_idx);
		
		model.addAttribute("form",resultMap);
		

	}

	// 
	@RequestMapping(value = "/businessPlanApply", method = RequestMethod.POST)
	public String write(
			BusinessPlanVO businessPlanVO,
						BusinessPlanCostVO businessPlanCostVO,
			MultipartHttpServletRequest mpRequest,RedirectAttributes redirect) throws Exception {
		logger.info("businessPlanApply");
		
		service.write(businessPlanVO, mpRequest);
		businessPlanCostVO.setBpm_bplan_idx(businessPlanVO.getBpm_bplan_idx());
		service.businessPlanInputCost(businessPlanCostVO);
		redirect.addAttribute("bam_anc_idx",businessPlanVO.getBam_anc_idx());
		return "redirect:/bpm/businessPlanApplyList";
	}

	// 
	@RequestMapping(value = "/businessPlanApplyList", method = RequestMethod.GET)
	public String businessPlanApplyList(Model model,@RequestParam("bam_anc_idx") int bam_anc_idx, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("businessPlanApplyList");

	
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rowStart", scri.getRowStart());
		paramMap.put("rowEnd", scri.getRowEnd());
		paramMap.put("bam_anc_idx",bam_anc_idx);
		model.addAttribute("list", service.businessPlanApplyList(paramMap));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "bpm/businessPlanApplyList";

	}
	
	@RequestMapping(value = "/businessPlanApplyMyList", method = RequestMethod.GET)
	public String businessPlanApplyMyList(Model model,@SessionAttribute("member") MemberVO member, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("businessPlanApplyList");

		String user_id = member.getUser_id();
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("rowStart", scri.getRowStart());
		paramMap.put("rowEnd", scri.getRowEnd());
		paramMap.put("user_id",user_id); 
		model.addAttribute("list", service.businessPlanApplyMyList(paramMap));
		 
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "bpm/businessPlanApplyList";

	}

	//
	@RequestMapping(value = "/businessPlanApplyDetail", method = RequestMethod.GET)
	public String businessPlanApplyDetail(BusinessPlanVO businessPlanVO, @ModelAttribute("scri") SearchCriteria scri, Model model,RedirectAttributes redirect) throws Exception {
		logger.info("businessPlanApplyDetail");
		
		
		
		Map<String,Object> resultMap = service.businessPlanApplyForm(businessPlanVO.getBam_anc_idx());
		
		model.addAttribute("form",resultMap);
		model.addAttribute("read", service.businessPlanApplyDetail(businessPlanVO.getBpm_bplan_idx()));
		model.addAttribute("scri", scri);
		model.addAttribute("cost",service.businessPlanSelectCost(businessPlanVO.getBpm_bplan_idx()));
		 
		redirect.addAttribute("bam_anc_idx",businessPlanVO.getBpm_bplan_idx());
		List<Map<String, Object>> fileList = service.selectFileList(businessPlanVO.getBpm_bplan_idx());
		 model.addAttribute("file", fileList);
		 
		return "bpm/businessPlanApplyDetail";
	}
	//사업계획서 수정
	@RequestMapping(value = "/businessPlanApplyUpdate", method = RequestMethod.GET)
	public void businessPlanApplyUpdateView(BusinessPlanVO businessPlanVO, @RequestParam("bam_anc_idx") int bam_anc_idx, Model model) throws Exception {
		logger.info("businessPlanApply");
			
		Map<String,Object> resultMap = service.businessPlanApplyForm(bam_anc_idx);
		List<Map<String, Object>> fileList = service.selectFileList(businessPlanVO.getBpm_bplan_idx());
		model.addAttribute("form",resultMap);
		model.addAttribute("read",service.businessPlanApplyDetail(businessPlanVO.getBpm_bplan_idx()));
		model.addAttribute("cost",service.businessPlanSelectCost(businessPlanVO.getBpm_bplan_idx()));
		model.addAttribute("file", fileList);
	}
	
	@RequestMapping(value = "/businessPlanApplyUpdate", method = RequestMethod.POST)
	public  String businessPlanApplyUpdate(BusinessPlanVO businessPlanVO,
			BusinessPlanCostVO businessPlanCostVO,
			@RequestParam("bam_anc_idx") int bam_anc_idx,
			@RequestParam("bpm_bplan_idx") int bpm_bplan_idx,
			@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest,RedirectAttributes redirect) throws Exception {
			logger.info("businessPlanApplyUpdate");
			
			service.businessPlanApplyUpdate(businessPlanVO,files,fileNames,mpRequest);
			businessPlanCostVO.setBpm_bplan_idx(bpm_bplan_idx);
			service.businessPlanUpdateCost(businessPlanCostVO);
			redirect.addAttribute("bam_anc_idx",bam_anc_idx);
			
			return "redirect:/bpm/businessPlanApplyList";
	}

	@RequestMapping(value = "/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("FILE_SNAME");
		String originalFileName = (String) resultMap.get("FILE_FNAME");
		
		System.out.println("sname"+storedFileName);
		System.out.println("fname"+originalFileName);

		// byte[]
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
	@RequestMapping(value = "/evalCheck", method = RequestMethod.POST)
	@ResponseBody
	public String evalCheck(@SessionAttribute("member") MemberVO member, @RequestParam(value="bam_anc_idx") int bam_anc_idx, @RequestParam(value="bpm_bplan_idx") int bpm_bplan_idx) throws Exception {
		String user_id = member.getUser_id();
		
		  Map<String,Object> evalparam = new HashMap(); 
		  evalparam.put("bpm_bplan_idx",bpm_bplan_idx); 
		  evalparam.put("writer_id",user_id);  
		  int result = evalservice.businessEvaluationOverLapChk(evalparam);
		 
		//등록된 멤버 리스트 조회
		List<Map<String,Object>> resultList = service.businessPlanEvalMember(bam_anc_idx);

		String resultType = service.businessPlanEvalcheck(user_id, resultList);
		
		if(result == 1)
			resultType ="overLab";
		
		return resultType;
	}
	
	

}
