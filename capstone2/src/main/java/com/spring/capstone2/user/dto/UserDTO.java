package com.spring.capstone2.user.dto;

import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class UserDTO {

	@Pattern(regexp = "^[a-z][a-zA-Z0-9]{5,}", message = "�ùٸ��� ���� ���̵� �Դϴ�\\n���̵�� ����,�������θ� �̷���� 6���� �̻󿩾� �մϴ�.\\n���̵�� ���� �ҹ��ڷ� �����ؾ� �մϴ�.")
	private String userId;

	@Pattern(regexp = "(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$", message = "�ùٸ��� ���� ��й�ȣ �Դϴ�\\n ����,����,Ư�����ڷθ� �̷���� 8���� �̻󿩾� �մϴ�.\\n��й�ȣ�� ���� �ҹ��ڰ� �ݵ�� ���ԵǾ�� �մϴ�.")
	private String userPw;

	@Pattern(regexp = "^[��-�Ra-zA-Z]*$", message = "�ùٸ��� ���� �̸� �Դϴ�\\n�̸��� ����, Ư�����ڸ� �������� �ʽ��ϴ�.")
	private String userName;

	@Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "�ùٸ��� ���� �̸��� �����Դϴ�.")
	private String userEmail;

	@Pattern(regexp = "^\\d{8}$", message = "�ùٸ��� ���� ������� �����Դϴ�.\\n��������� ���� 8���ڷ� ǥ�����ּ���.")
	private String userBirth;
}