package emp.cmm.web;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import emp.cmm.service.MemberService;
import emp.cmm.vo.MemberVO;

@Controller
@RequestMapping("/cmm/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// �쉶�썝媛��엯 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// �쉶�썝媛��엯 post
	@RequestMapping(value = "/postregister", method = RequestMethod.POST)
	public String postRegister(MemberVO vo )throws Exception {
		logger.info("post register");
		int result = service.idChk(vo);
		try {
			if(result == 1) {
				return "/cmm/register";
			}else if(result == 0) {
				String inputPass = vo.getUser_pwd();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUser_pwd(pwd);
				service.register(vo);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
				return "redirect:/";
	}
	
	// 濡쒓렇�씤 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
	
		boolean pwdMatch = false;
		session.getAttribute("member");
		MemberVO login = service.login(vo);
		
		if(login != null)
			pwdMatch = pwdEncoder.matches(vo.getUser_pwd() ,login.getUser_pwd());
			
		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);
			return "redirect:/bam/businessAnnouncementList";
		}else {
			session.setAttribute("member", null); 
			rttr.addFlashAttribute("msg", false);
			return "redirect:/";
		}
	}
	
	
	// 濡쒓렇�븘�썐 post
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView(@RequestParam(value = "member_idx") int member_idx,Model model) throws Exception{
		
		model.addAttribute("memberDetail",service.memberMngDetail(member_idx)); 
		return "cmm/memberUpdateView";
	}
	
	@RequestMapping(value="/memberDetailView", method = RequestMethod.GET)
	public String memberDetailView(@RequestParam(value = "member_idx") int member_idx,Model model) throws Exception{
		
		model.addAttribute("memberDetail",service.memberMngDetail(member_idx));
		return "cmm/memberDetailView";
	}
	
	// �쉶�썝�젙蹂� �닔�젙  post
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		
		MemberVO SessionVO = (MemberVO)session.getAttribute("member");
	
		
		if(!vo.getUser_pwd().equals("")){
			

			String inputPass = vo.getUser_pwd();
			String pwd = pwdEncoder.encode(inputPass);
			vo.setUser_pwd(pwd);
			
			}
		else if(vo.getUser_pwd().equals("")) {
			
			service.memberUpdate(vo);
		}
		service.memberUpdate(vo);
		if(SessionVO.getUser_auth() == "2")
			return "redirect:/cmm/admin";
		else {
			session.invalidate();
			return "redirect:/";
		}
	}
	
	
	//회원삭제
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, @RequestParam(value = "member_idx") int member_idx ) throws Exception{
		vo.setMember_idx(member_idx);
		service.memberDelete(vo);
		
		return "redirect:/cmm/admin";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception {

		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUser_pwd(), login.getUser_pwd());
		return pwdChk;
	}
	

	
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/crcodeChk", method = RequestMethod.POST)
	public int crcodeChk(MemberVO vo) throws Exception {
		int result = service.crcodeChk(vo);
		return result;
	}
	
	@RequestMapping(value="/agreement", method = RequestMethod.GET)
	public String agreement(MemberVO vo, HttpSession session) throws Exception{
		
		return "cmm/agreement";
	}
	
    // 회원 관리 회원 목록
    // url pattern mapping
    @RequestMapping("/admin")
    public String memberMngList(MemberVO vo, Model model) throws Exception{
    // controller => service => dao 요청
        model.addAttribute("memberList",service.memberMngList());
        
        return "cmm/admin";
    }
}

