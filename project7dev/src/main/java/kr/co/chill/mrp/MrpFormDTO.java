package kr.co.chill.mrp;

import java.util.List;

public class MrpFormDTO {
	private int prplNo;
	private int productNo;
	private int empNo;
	private String mrpDueDate;
	private List<MrpDTO> materials;		//자재 여러개 한번에 담아오기
	
	public MrpFormDTO() {
		super();
	}

	public MrpFormDTO(int prplNo, int productNo, int empNo, String mrpDueDate, List<MrpDTO> materials) {
		super();
		this.prplNo = prplNo;
		this.productNo = productNo;
		this.empNo = empNo;
		this.mrpDueDate = mrpDueDate;
		this.materials = materials;
	}

	public int getPrplNo() {
		return prplNo;
	}

	public void setPrplNo(int prplNo) {
		this.prplNo = prplNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getMrpDueDate() {
		return mrpDueDate;
	}

	public void setMrpDueDate(String mrpDueDate) {
		this.mrpDueDate = mrpDueDate;
	}

	public List<MrpDTO> getMaterials() {
		return materials;
	}

	public void setMaterials(List<MrpDTO> materials) {
		this.materials = materials;
	}

	@Override
	public String toString() {
		return "MrpFormDTO [prplNo=" + prplNo + ", productNo=" + productNo + ", empNo=" + empNo + ", mrpDueDate="
				+ mrpDueDate + ", materials=" + materials + "]";
	}

}
