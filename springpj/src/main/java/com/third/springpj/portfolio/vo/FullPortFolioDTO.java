package com.third.springpj.portfolio.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class FullPortFolioDTO extends PortFolioBaseVO {
	
	private int pNum;
	private String pSkill;
	private String pText;
	private String pFile;
	
	public FullPortFolioDTO(){};
	
	
	public FullPortFolioDTO(PortFolioBaseVO base, PortFolioDetailVO detail) {
		 this.pNum = base.getPNum();
		 this.setPTitle(base.getPTitle());
		 this.setMId(base.getMId());
		 this.setPJob(base.getPJob());
		 this.setPComp(base.getPComp());
		 this.setPEdu(base.getPEdu());
		 this.setPCareer(base.getPCareer());
		 this.setPLisence(base.getPLisence());
		 this.setViewCheck(base.getViewCheck());
	     this.pSkill = detail.getPSkill();
	     this.pText = detail.getPText();
	     this.pFile = detail.getPFile();
	}
	
	
	
	
	
}
