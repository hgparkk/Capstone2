package com.spring.capstone2.simulation.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.capstone2.kau.dto.KAUDTO;
import com.spring.capstone2.kau.dto.KAUselectDTO;
import com.spring.capstone2.kau.service.KAUService;
import com.spring.capstone2.quota.dto.QuotaDTO;
import com.spring.capstone2.quota.service.QuotaService;
import com.spring.capstone2.simulation.dto.SimulationDTO;
import com.spring.capstone2.simulation.service.SimulationService;
import com.spring.capstone2.simulationLog.dto.SimulationLogDTO;

@Controller
public class SimulationController {

	@Autowired
	QuotaService quotaService;

	@Autowired
	KAUService kauService;

	@Autowired
	SimulationService simulationService;

	// 시뮬레이션 안내 페이지로 이동
	@RequestMapping(value = "/simulationIntro", method = RequestMethod.GET)
	public String simulationIntro() {
		return "simulation/simulationIntro";
	}

	// 시뮬레이션 초기 세팅
	@RequestMapping(value = "/simulationSet", method = RequestMethod.GET)
	public String simulationSet(HttpSession session, RedirectAttributes redirectAttributes) {

		// 로그를 임시 저장할 리스트를 세션에 선언한다.
		List<SimulationLogDTO> simulogList = new ArrayList<SimulationLogDTO>();

		// 리스트를 세션에 저장
		session.setAttribute("simulogList", simulogList);

		// 현재 시뮬레이션 번호를 얻는다.
		int simuNo = simulationService.getCount() + 1;

		// 랜덤한 종목과 기업을 고른다.
		int quotaNo = (int) (Math.random() * 2045) + 1;

		QuotaDTO quota = quotaService.selectQuota(quotaNo);

		// 년도를 특정해서 종목별 시세를 불러온다
		String kauKind = "";
		switch (quota.getQuotaYear()) {
		case "2021년":
			kauKind = "KAU21";
			break;
		case "2022년":
			kauKind = "KAU22";
			break;
		case "2023년":
			kauKind = "KAU23";
			break;
		}

		// 종목별 시세의 개수를 센다.
		int count = kauService.getCount(kauKind);

		// 종목의 가장 첫 날의 시세를 불러오기 위한 객체
		KAUselectDTO kauSelect = new KAUselectDTO(kauKind, 1);

		// 종목의 시세를 불러온다.
		KAUDTO kau = kauService.selectKAU(kauSelect);

		// 세팅을 넘긴다.
		redirectAttributes.addFlashAttribute("simuNo", simuNo);
		redirectAttributes.addFlashAttribute("quota", quota);
		redirectAttributes.addFlashAttribute("kauCount", count);
		redirectAttributes.addFlashAttribute("kauSelect", kauSelect);
		redirectAttributes.addFlashAttribute("kau", kau);
		return "redirect:/simulationView";
	}

	// 시뮬레이션 화면
	@RequestMapping(value = "/simulationView", method = RequestMethod.GET)
	public String simulationView(HttpServletRequest request, HttpSession session, Model model) {

		// 플래시 속성 존재 여부 확인
		if (session.getAttribute("login") == null || !model.containsAttribute("simuNo")
				|| !model.containsAttribute("quota") || !model.containsAttribute("kauCount")
				|| !model.containsAttribute("kauSelect") || !model.containsAttribute("kau")) {
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("url", "/simulationIntro");
			return "alert";
		}

		return "simulation/simulationView";
	}

	// 다음 날로 넘어갔을 때 행동
	@ResponseBody
	@RequestMapping(value = "/simulationNextDayDo", method = RequestMethod.POST)
	public KAUDTO simulationNextDayDo(int simuNo, int kauNo, int simulogValue, String kauKind, int kauSeq,
			HttpSession session) {

		// 세션에 로그 추가
		@SuppressWarnings("unchecked")
		ArrayList<SimulationLogDTO> simulogList = (ArrayList<SimulationLogDTO>) session.getAttribute("simulogList");

		// 새 로그 생성
		SimulationLogDTO simulationLog = new SimulationLogDTO();
		simulationLog.setSimuNo(simuNo);
		simulationLog.setKauNo(kauNo);
		simulationLog.setSimulogValue(simulogValue);

		// 새 로그 추가
		simulogList.add(simulationLog);

		// 새 로그 세션에 등록
		session.setAttribute("simulogList", simulogList);

		KAUselectDTO kauSelect = new KAUselectDTO(kauKind, kauSeq + 1);

		// 오늘 시세 가져오기
		KAUDTO kau = kauService.selectKAU(kauSelect);

		return kau;
	}

	// 시뮬레이션 종료
	@RequestMapping(value = "/simulationEnd", method = RequestMethod.POST)
	public String simulationEnd(int simuNo, QuotaDTO quota, int simuRevenue, int simuFianlvalue, RedirectAttributes redirectAttributes) {
		
		// 시뮬레이션 결과를 넘긴다.
		redirectAttributes.addFlashAttribute("simuNo", simuNo);
		redirectAttributes.addFlashAttribute("quota", quota);
		redirectAttributes.addFlashAttribute("revenue", simuRevenue);
		redirectAttributes.addFlashAttribute("totalValue", simuFianlvalue);
		return "redirect:/simulationResult";
	}

	// 시뮬레이션 결과 페이지
	@RequestMapping(value = "/simulationResult", method = RequestMethod.GET)
	public String simulationResult(HttpServletRequest request, Model model) {

		// 플래시 속성 존재 여부 확인
		if (!model.containsAttribute("simuNo") || !model.containsAttribute("quotaNo")
				|| !model.containsAttribute("revenue") || !model.containsAttribute("totalValue")) {
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("url", "/simulationIntro");
			return "alert";
		}

		return "simulation/simulationFinish";
	}
}