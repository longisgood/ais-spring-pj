package com.third.springpj;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.third.springpj.member.dao.MemberDAO;
import com.third.springpj.member.vo.MemberVO;

@SpringBootTest
class SpringpjApplicationTests {

	@Autowired
	private MemberDAO md;
	
	@Test
	void contextLoads() {
		MemberVO user = new MemberVO();
		user.setMId("asia");
		user.setMPw("1234");
		MemberVO result = md.findMember(user);
		System.out.println(result.toString());
		
	}

}
