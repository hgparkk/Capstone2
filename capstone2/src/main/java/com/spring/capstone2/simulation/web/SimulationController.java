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

	// �ùķ��̼� �ȳ� �������� �̵�
	@RequestMapping(value = "/simulationIntro", method = RequestMethod.GET)
	public String simulationIntro() {
		return "simulation/simulationIntro";
	}

	// �ùķ��̼� �ʱ� ����
	@RequestMapping(value = "/simulationSet", method = RequestMethod.GET)
	public String simulationSet(HttpSession session, RedirectAttributes redirectAttributes) {

		// �α׸� �ӽ� ������ ����Ʈ�� ���ǿ� �����Ѵ�.
		List<SimulationLogDTO> simulogList = new ArrayList<SimulationLogDTO>();

		// ����Ʈ�� ���ǿ� ����
		session.setAttribute("simulogList", simulogList);

		// ���� �ùķ��̼� ��ȣ�� ��´�.
		int simuNo = simulationService.getCount() + 1;

		// ������ ����� ����� ����.
		int quotaNo = (int) (Math.random() * 2045) + 1;

		QuotaDTO quota = quotaService.selectQuota(quotaNo);

		// �⵵�� Ư���ؼ� ���� �ü��� �ҷ��´�
		String kauKind = "";
		switch (quota.getQuotaYear()) {
		case "2021��":
			kauKind = "KAU21";
			break;
		case "2022��":
			kauKind = "KAU22";
			break;
		case "2023��":
			kauKind = "KAU23";
			break;
		}

		// ���� �ü��� ������ ����.
		int count = kauService.getCount(kauKind);

		// ������ ���� ù ���� �ü��� �ҷ����� ���� ��ü
		KAUselectDTO kauSelect = new KAUselectDTO(kauKind, 1);

		// ������ �ü��� �ҷ��´�.
		KAUDTO kau = kauService.selectKAU(kauSelect);

		// ������ �ѱ��.
		redirectAttributes.addFlashAttribute("simuNo", simuNo);
		redirectAttributes.addFlashAttribute("quota", quota);
		redirectAttributes.addFlashAttribute("kauCount", count);
		redirectAttributes.addFlashAttribute("kauSelect", kauSelect);
		redirectAttributes.addFlashAttribute("kau", kau);
		return "redirect:/simulationView";
	}

	// �ùķ��̼� ȭ��
	@RequestMapping(value = "/simulationView", method = RequestMethod.GET)
	public String simulationView(HttpServletRequest request, HttpSession session, Model model) {

		// �÷��� �Ӽ� ���� ���� Ȯ��
		if (session.getAttribute("login") == null || !model.containsAttribute("simuNo")
				|| !model.containsAttribute("quota") || !model.containsAttribute("kauCount")
				|| !model.containsAttribute("kauSelect") || !model.containsAttribute("kau")) {
			request.setAttribute("msg", "�߸��� �����Դϴ�.");
			request.setAttribute("url", "/simulationIntro");
			return "alert";
		}

		return "simulation/simulationView";
	}

	// ���� ���� �Ѿ�� �� �ൿ
	@ResponseBody
	@RequestMapping(value = "/simulationNextDayDo", method = RequestMethod.POST)
	public KAUDTO simulationNextDayDo(int simuNo, int kauNo, int simulogValue, String kauKind, int kauSeq,
			HttpSession session) {

		// ���ǿ� �α� �߰�
		@SuppressWarnings("unchecked")
		ArrayList<SimulationLogDTO> simulogList = (ArrayList<SimulationLogDTO>) session.getAttribute("simulogList");

		// �� �α� ����
		SimulationLogDTO simulationLog = new SimulationLogDTO();
		simulationLog.setSimuNo(simuNo);
		simulationLog.setKauNo(kauNo);
		simulationLog.setSimulogValue(simulogValue);

		// �� �α� �߰�
		simulogList.add(simulationLog);

		// �� �α� ���ǿ� ���
		session.setAttribute("simulogList", simulogList);

		KAUselectDTO kauSelect = new KAUselectDTO(kauKind, kauSeq + 1);

		// ���� �ü� ��������
		KAUDTO kau = kauService.selectKAU(kauSelect);

		return kau;
	}

	// �ùķ��̼� ����
	@RequestMapping(value = "/simulationEnd", method = RequestMethod.POST)
	public String simulationEnd(int simuNo, QuotaDTO quota, int simuRevenue, int simuFianlvalue, RedirectAttributes redirectAttributes) {
		
		// �ùķ��̼� ����� �ѱ��.
		redirectAttributes.addFlashAttribute("simuNo", simuNo);
		redirectAttributes.addFlashAttribute("quota", quota);
		redirectAttributes.addFlashAttribute("revenue", simuRevenue);
		redirectAttributes.addFlashAttribute("totalValue", simuFianlvalue);
		return "redirect:/simulationResult";
	}

	// �ùķ��̼� ��� ������
	@RequestMapping(value = "/simulationResult", method = RequestMethod.GET)
	public String simulationResult(HttpServletRequest request, Model model) {

		// �÷��� �Ӽ� ���� ���� Ȯ��
		if (!model.containsAttribute("simuNo") || !model.containsAttribute("quotaNo")
				|| !model.containsAttribute("revenue") || !model.containsAttribute("totalValue")) {
			request.setAttribute("msg", "�߸��� �����Դϴ�.");
			request.setAttribute("url", "/simulationIntro");
			return "alert";
		}

		return "simulation/simulationFinish";
	}
}