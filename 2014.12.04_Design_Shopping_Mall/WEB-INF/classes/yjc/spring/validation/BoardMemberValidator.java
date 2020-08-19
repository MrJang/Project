//package yjc.spring.validation;
//
//import org.springframework.stereotype.Component;
//import org.springframework.validation.Errors;
//import org.springframework.validation.ValidationUtils;
//import org.springframework.validation.Validator;
//
//import yjc.spring.bean.Member;
//@Component		//스프링의 빈으로 등록
//public class BoardMemberValidator implements Validator {
//
//	@Override
//	public boolean supports(Class<?> target) {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public void validate(Object target, Errors errors) {
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"name", "field.required", "이름 확인");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password", "field.required", "비밀번호 확인");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"address", "field.required", "주소 확인");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"phone", "field.required", "전화번호 확인");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"email", "field.required", "이메일 확인");
//		
//		
//		Member m = (Member)target;
//		if(m.getName() != null &&  m.getName().length() > 0 && m.getName().length() < 2){
//			errors.rejectValue("name", "field.min", new Object[]{2,10}, "이름의 길이가 너무 짧습니다.");
//		}
//		// TODO Auto-generated method stub
//
//	}
//
//}
