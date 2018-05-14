package yjc.wdb.back;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.domain.MemberVO;
import yjc.wdb.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExitController {

	@Inject
	private MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(ExitController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

		@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "main";

	}

	// ȸ������
	@RequestMapping(value = "joinform", method = RequestMethod.POST)
	public String insertMember(MemberVO memberVO, RedirectAttributes rttr) throws Exception {
		try {
			System.out.println(memberVO.getEmail());
			service.insertMember(memberVO);
			rttr.addFlashAttribute("result", "SUCCESS");
			// model.addAttribute("result", "SUCCESS");
		} catch (Exception e) {
			rttr.addFlashAttribute("result", "Error[" + e.getMessage() + "]");
			// model.addAttribute("result", "Error[" +e.getMessage()+ "]");
		}
		return "redirect:success";
	}

	@RequestMapping(value = "success", method = RequestMethod.GET)
	public String success() {
		return "main";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	@ResponseBody
	public int LoginCheck(String userid, String userpw, HttpSession session) throws Exception {
		MemberVO m = service.loginCheck(userid, userpw);
		// 0 = ���������� �α���, 1 = ��� ���� ����
		if (m == null) {
			return 1;
		} else {
			session.setAttribute("member", m);
			return 0;
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/";
	}
}
