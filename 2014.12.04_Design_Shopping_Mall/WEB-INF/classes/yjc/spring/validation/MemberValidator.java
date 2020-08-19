package yjc.spring.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import yjc.spring.bean.Member;
@Component
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> target) {
		// TODO Auto-generated method stub
		return Member.class.isAssignableFrom(target);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Member m = (Member)target;
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required.field", null, "값을 입력하세요");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.field", null, "값을 입력하세요");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "point", "required.field", null, "값을 입력하세요");
//		
//		if(m.getPoint() < 0 ){
//			errors.rejectValue("point", "field.min", null, "포인트의 값은 0보다 커야 합니다.");
//		}

	}

}
