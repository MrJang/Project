//package yjc.spring.validation;
//
//import org.springframework.stereotype.Component;
//import org.springframework.validation.Errors;
//import org.springframework.validation.ValidationUtils;
//import org.springframework.validation.Validator;
//
//import yjc.spring.bean.Member;
//@Component		//�������� ������ ���
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
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"name", "field.required", "�̸� Ȯ��");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password", "field.required", "��й�ȣ Ȯ��");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"address", "field.required", "�ּ� Ȯ��");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"phone", "field.required", "��ȭ��ȣ Ȯ��");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"email", "field.required", "�̸��� Ȯ��");
//		
//		
//		Member m = (Member)target;
//		if(m.getName() != null &&  m.getName().length() > 0 && m.getName().length() < 2){
//			errors.rejectValue("name", "field.min", new Object[]{2,10}, "�̸��� ���̰� �ʹ� ª���ϴ�.");
//		}
//		// TODO Auto-generated method stub
//
//	}
//
//}
