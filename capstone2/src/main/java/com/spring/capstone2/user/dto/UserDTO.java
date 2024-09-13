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

	@Pattern(regexp = "^[a-z][a-zA-Z0-9]{5,}", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ¾ÆÀÌµğ ÀÔ´Ï´Ù\\n¾ÆÀÌµğ´Â ¼ıÀÚ,¿µ¹®À¸·Î¸¸ ÀÌ·ç¾îÁø 6±ÛÀÚ ÀÌ»ó¿©¾ß ÇÕ´Ï´Ù.\\n¾ÆÀÌµğ´Â ¿µ¹® ¼Ò¹®ÀÚ·Î ½ÃÀÛÇØ¾ß ÇÕ´Ï´Ù.")
	private String userId;

	@Pattern(regexp = "(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ºñ¹Ğ¹øÈ£ ÀÔ´Ï´Ù\\n ¼ıÀÚ,¿µ¹®,Æ¯¼ö¹®ÀÚ·Î¸¸ ÀÌ·ç¾îÁø 8±ÛÀÚ ÀÌ»ó¿©¾ß ÇÕ´Ï´Ù.\\nºñ¹Ğ¹øÈ£´Â ¿µ¹® ¼Ò¹®ÀÚ°¡ ¹İµå½Ã Æ÷ÇÔµÇ¾î¾ß ÇÕ´Ï´Ù.")
	private String userPw;

	@Pattern(regexp = "^[°¡-ÆRa-zA-Z]*$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ÀÌ¸§ ÀÔ´Ï´Ù\\nÀÌ¸§Àº ¼ıÀÚ, Æ¯¼ö¹®ÀÚ¸¦ Æ÷ÇÔÇÏÁö ¾Ê½À´Ï´Ù.")
	private String userName;

	@Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ÀÌ¸ŞÀÏ Çü½ÄÀÔ´Ï´Ù.")
	private String userEmail;

	@Pattern(regexp = "^\\d{8}$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº »ı³â¿ùÀÏ Çü½ÄÀÔ´Ï´Ù.\\n»ı³â¿ùÀÏÀº ¼ıÀÚ 8±ÛÀÚ·Î Ç¥ÇöÇØÁÖ¼¼¿ä.")
	private String userBirth;
}