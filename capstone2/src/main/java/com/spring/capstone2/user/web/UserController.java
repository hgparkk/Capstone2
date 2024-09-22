package com.spring.capstone2.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.capstone2.user.dto.UserDTO;
import com.spring.capstone2.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// ȸ������ â
	@RequestMapping(value = "/registView", method = RequestMethod.GET)
	public String registView() {
		return "user/registView";
	}

	// ���̵� �ߺ� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/idDupCheck", method = RequestMethod.POST)
	public boolean idDupCheck(String inputId) {
		UserDTO idCheck = new UserDTO();
		idCheck.setUserId(inputId);

		UserDTO checked = userService.idDupCheck(idCheck);
		return (checked != null && checked.getUserId().equals(checked.getUserId())) ? true : false;
	}

	// ȸ������
	@RequestMapping(value = "/registDo", method = RequestMethod.POST)
	public String registDo(@Valid UserDTO user, BindingResult result, HttpServletRequest request) {
		UserDTO emailCheck = new UserDTO();
		emailCheck.setUserEmail(user.getUserEmail());
		if (result.hasErrors()) {
			String errMsg = "";
			for (ObjectError error : result.getAllErrors()) {
				errMsg += error.getDefaultMessage();
				errMsg += "\\n\\n";
			}
			request.setAttribute("msg", errMsg);
			request.setAttribute("url", "/registView");
			return "alert";
		} else if (userService.emailDupCheck(emailCheck) != null) {
			request.setAttribute("msg", "�̹� ��ϵ� �̸��� �Դϴ�. �ٸ� �̸����� �Է��Ͽ� �ּ���");
			request.setAttribute("url", "/registView");
			return "alert";
		} else {
			String encodePw = passwordEncoder.encode(user.getUserPw());
			user.setUserPw(encodePw);

			userService.insertUser(user);
			request.setAttribute("msg", "ȸ�������� �Ϸ�Ǿ����ϴ�\\n�α��� â���� �̵��մϴ�.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}

	// ID/PW ã�� â
	@RequestMapping(value = "/idpwFindView", method = RequestMethod.GET)
	public String idpwFindView() {
		return "user/idpwFindView";
	}

	// ID ã��
	@ResponseBody
	@RequestMapping(value = "/idFindDo", method = RequestMethod.POST)
	public String idFindDo(UserDTO user) {
		UserDTO result = userService.idFind(user);
		if (result != null) {
			return result.getUserId();
		} else {
			return "";
		}
	}

	// PW ã��
	@ResponseBody
	@RequestMapping(value = "/pwFindDo", method = RequestMethod.POST)
	public String pwFindDo(UserDTO user) {
		UserDTO result = userService.pwFind(user);
		if (result != null) {
			return result.getUserId();
		} else {
			return "";
		}
	}

	// PWreset ȭ������ �̵�
	@RequestMapping(value = "/pwResetView", method = RequestMethod.POST)
	public String pwResetView(String resetId, Model model) {
		model.addAttribute("resetId", resetId);
		return "user/pwResetView";
	}

	// PW �ʱ�ȭ
	@RequestMapping(value = "/pwResetDo", method = RequestMethod.POST)
	public String pwResetDo(@Valid UserDTO user, BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			String errMsg = "";
			for (ObjectError error : result.getAllErrors()) {
				errMsg += error.getDefaultMessage();
				errMsg += "\\n\\n";
			}
			errMsg += "�ش� �۾��� �ٽ� �õ��Ͽ� �ּ���.";
			request.setAttribute("msg", errMsg);
			request.setAttribute("url", "/idpwFindView");
			return "alert";
		} else {
			String encodePw = passwordEncoder.encode(user.getUserPw());
			user.setUserPw(encodePw);
			userService.pwReset(user);
			request.setAttribute("msg", "�����Ͻ� ��й�ȣ�� ��й�ȣ�� �ʱ�ȭ �Ǿ����ϴ�.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}

	// �α��� â
	@RequestMapping(value = "/loginView", method = RequestMethod.GET)
	public String loginView(HttpServletRequest request, Model model,
			@RequestParam(value = "fromUrl", required = false) String fromUrl) {
		if (fromUrl == null || fromUrl.isEmpty()) {
			fromUrl = request.getHeader("Referer");
		}
		model.addAttribute("fromUrl", fromUrl);
		return "user/loginView";
	}

	// �α���
	@RequestMapping(value = "/loginDo", method = RequestMethod.POST)
	public String loginDo(String fromUrl, UserDTO loginInfo, HttpSession session, RedirectAttributes attr) {
		UserDTO login = userService.login(loginInfo);

		if (passwordEncoder.matches(loginInfo.getUserPw(), login.getUserPw())) {
			session.setAttribute("login", login);
			if (fromUrl.contains("/carbonMarketIntro") || fromUrl.contains("/simulationIntro")) {
				return "redirect:" + fromUrl;
			} else {
				return "redirect:/";
			}
		} else {
			attr.addFlashAttribute("failMsg", "���̵� Ȥ�� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
			attr.addAttribute("fromUrl", fromUrl);
			return "redirect:/loginView";
		}
	}

	// �α׾ƿ�
	@RequestMapping(value = "/logoutDo", method = RequestMethod.GET)
	public String logoutDo(HttpServletRequest request, HttpSession session) {
		String fromUrl = request.getHeader("Referer");
		session.invalidate();
		if (fromUrl.contains("/carbonMarketIntro") || fromUrl.contains("/simulationIntro")) {
			return "redirect:" + fromUrl;
		} else {
			return "redirect:/";
		}
	}

	// ȸ���������� â
	@RequestMapping(value = "/updateUserView", method = RequestMethod.GET)
	public String updateUserView() {
		return "user/updateUserView";
	}

	// ȸ����������
	@RequestMapping(value = "/updateUserDo", method = RequestMethod.POST)
	public String updateUserDo(@Valid UserDTO user, BindingResult result, String containPw, HttpSession session,
			HttpServletRequest request) {
		if (result.hasErrors()) {
			String errMsg = "";
			for (ObjectError error : result.getAllErrors()) {
				errMsg += error.getDefaultMessage();
				errMsg += "\\n\\n";
			}
			request.setAttribute("msg", errMsg);
			request.setAttribute("url", "/updateUserView");
			return "alert";
		} else {
			if (!containPw.equals("true")) {
				user.setUserPw("");
			} else {
				String encodePw = passwordEncoder.encode(user.getUserPw());
				user.setUserPw(encodePw);
			}
			userService.updateUser(user);

			session.setAttribute("login", userService.login(user));
			request.setAttribute("msg", "ȸ�������� �����Ǿ����ϴ�.");
			request.setAttribute("url", "/updateUserView");
			return "alert";
		}
	}

	// ȸ�� Ż��
	@RequestMapping(value = "/deleteUserDo", method = RequestMethod.POST)
	public String userDeleteDo(String userId, HttpSession session, HttpServletRequest request) {
		userService.deleteUser(userId);
		session.invalidate();
		request.setAttribute("msg", "���������� Ż��Ǿ����ϴ�.");
		request.setAttribute("url", "/");
		return "alert";
	}
}