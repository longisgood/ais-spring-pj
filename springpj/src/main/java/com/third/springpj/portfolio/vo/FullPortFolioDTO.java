package com.third.springpj.portfolio.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FullPortFolioDTO extends PortFolioBaseVO {
	
	private int pNum;
	private String pSkill;
	private String pText;
	private String pFile;
}
