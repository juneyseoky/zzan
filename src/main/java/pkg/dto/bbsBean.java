package pkg.dto;

import java.sql.Timestamp;

public class bbsBean {
	private int bNum;
	private String bTitle;
	private String bContent;
	private String bMemId;
	private Timestamp bRegTM;
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbMemId() {
		return bMemId;
	}
	public void setbMemId(String bMemId) {
		this.bMemId = bMemId;
	}
	public Timestamp getbRegTM() {
		return bRegTM;
	}
	public void setbRegTM(Timestamp bRegTM) {
		this.bRegTM = bRegTM;
	}
	
	
}
