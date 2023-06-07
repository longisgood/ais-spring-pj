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
	
	
	
	public PortFolioBaseVO seperBase(FullPortFolioDTO p) {
		PortFolioBaseVO base = new PortFolioBaseVO();
		base.setPNum(p.getPNum());
		base.setPTitle(p.getPTitle());
		base.setMId(p.getMId());
		base.setPCareer(p.getPCareer());
		base.setPComp(p.getPComp());
		base.setPEdu(p.getPEdu());
		base.setPJob(p.getPJob());
		base.setPLisence(p.getPLisence());
		base.setViewCheck(p.getViewCheck());
		
		return base;
	}
	
	public PortFolioDetailVO seperDetail(FullPortFolioDTO p) {
		PortFolioDetailVO detail = new PortFolioDetailVO();
		detail.setPNum(pNum);
		detail.setPSkill(pSkill);
		detail.setPText(pText);
		return detail;
	}
}
