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

	@Pattern(regexp = "^[a-z][a-zA-Z0-9]{5,}", message = "올바르지 않은 아이디 입니다\\n아이디는 숫자,영문으로만 이루어진 6글자 이상여야 합니다.\\n아이디는 영문 소문자로 시작해야 합니다.")
	private String userId;

	@Pattern(regexp = "(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$", message = "올바르지 않은 비밀번호 입니다\\n 숫자,영문,특수문자로만 이루어진 8글자 이상여야 합니다.\\n비밀번호는 영문 소문자가 반드시 포함되어야 합니다.")
	private String userPw;

	@Pattern(regexp = "^[가-힣a-zA-Z]*$", message = "올바르지 않은 이름 입니다\\n이름은 숫자, 특수문자를 포함하지 않습니다.")
	private String userName;

	@Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "올바르지 않은 이메일 형식입니다.")
	private String userEmail;

	@Pattern(regexp = "^\\d{8}$", message = "올바르지 않은 생년월일 형식입니다.\\n생년월일은 숫자 8글자로 표현해주세요.")
	private String userBirth;
}