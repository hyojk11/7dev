/*
 * purc_order_no int AI PK 
purc_order_code varchar(45)
purc_order_reg_date datetime 
purc_order_dterms varchar(45) 
purc_order_status int 
purc_order_etc varchar(45) 
contract_cont_no int 
material_resource_plan_mrp_no int 
employee_emp_no int
 */
package kr.co.chill.purchaseorder;

public class PurchaseorderDTO {

	//purchase_order table
	private int purc_order_no;
	private String purc_order_code; //시리얼코드
	private String purc_order_reg_date; //발주일
	private String purc_order_dterms; //인도조건
	private String purc_order_status; //발주진행중1, 마감0
	private String purc_order_etc; //비고
	
	private int total_price; //**총 금액 별칭
	private String end_date; //**납기일 별칭
	
	//supplier table
	private int sup_no;
	private String sup_name;
	private String sup_ceo_name;
	private String sup_reg_no; //사업자번호
	private String sup_addr1;
	private String sup_addr2; //상세주소
	private String sup_cip; //담당자
	private String sup_cip_email; //담당자
	
	private String sup_total_addr; //**전체주소 별칭
	
	//company table
	private int comp_no;
	private String comp_name;
	private String comp_ceo_name;
	private String comp_reg_no; //사업자번호
	private String comp_addr1;
	private String comp_addr2; //상세주소
	
	private String comp_total_addr; //**전체주소 별칭

	//contract table
	private int cont_no;
	private int cont_material_cnt; //자재수량
	private String cont_date; //계약일
	private int cont_leadtime; //납기일수
	private String cont_material_sku; //자재포장단위
	
	//material_unit_price table
	private int mprice_no;
	private int cont_mprice; //계약단가
	private String mprice_currency; //화폐단위

	//employee table
	private int emp_no;
	private String emp_name;
	private String emp_email;
	
	//material_resource_plan table
	private int mrp_no;
	private String mrp_due_date; //자재납기일
	
	//material table
	private int material_no;
	private String material_name;
	private String material_code;
	private String material_description; //규격
	private String material_sku; //포장단위
	
	
	
	public PurchaseorderDTO() {
		super();
	}



	public PurchaseorderDTO(int purc_order_no, String purc_order_code, String purc_order_reg_date,
			String purc_order_dterms, String purc_order_status, String purc_order_etc, int total_price, String end_date,
			int sup_no, String sup_name, String sup_ceo_name, String sup_reg_no, String sup_addr1, String sup_addr2,
			String sup_cip, String sup_cip_email, String sup_total_addr, int comp_no, String comp_name,
			String comp_ceo_name, String comp_reg_no, String comp_addr1, String comp_addr2, String comp_total_addr,
			int cont_no, int cont_material_cnt, String cont_date, int cont_leadtime, String cont_material_sku,
			int mprice_no, int cont_mprice, String mprice_currency, int emp_no, String emp_name, String emp_email,
			int mrp_no, String mrp_due_date, int material_no, String material_name, String material_code,
			String material_description, String material_sku) {
		super();
		this.purc_order_no = purc_order_no;
		this.purc_order_code = purc_order_code;
		this.purc_order_reg_date = purc_order_reg_date;
		this.purc_order_dterms = purc_order_dterms;
		this.purc_order_status = purc_order_status;
		this.purc_order_etc = purc_order_etc;
		this.total_price = total_price;
		this.end_date = end_date;
		this.sup_no = sup_no;
		this.sup_name = sup_name;
		this.sup_ceo_name = sup_ceo_name;
		this.sup_reg_no = sup_reg_no;
		this.sup_addr1 = sup_addr1;
		this.sup_addr2 = sup_addr2;
		this.sup_cip = sup_cip;
		this.sup_cip_email = sup_cip_email;
		this.sup_total_addr = sup_total_addr;
		this.comp_no = comp_no;
		this.comp_name = comp_name;
		this.comp_ceo_name = comp_ceo_name;
		this.comp_reg_no = comp_reg_no;
		this.comp_addr1 = comp_addr1;
		this.comp_addr2 = comp_addr2;
		this.comp_total_addr = comp_total_addr;
		this.cont_no = cont_no;
		this.cont_material_cnt = cont_material_cnt;
		this.cont_date = cont_date;
		this.cont_leadtime = cont_leadtime;
		this.cont_material_sku = cont_material_sku;
		this.mprice_no = mprice_no;
		this.cont_mprice = cont_mprice;
		this.mprice_currency = mprice_currency;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_email = emp_email;
		this.mrp_no = mrp_no;
		this.mrp_due_date = mrp_due_date;
		this.material_no = material_no;
		this.material_name = material_name;
		this.material_code = material_code;
		this.material_description = material_description;
		this.material_sku = material_sku;
	}



	public int getPurc_order_no() {
		return purc_order_no;
	}



	public void setPurc_order_no(int purc_order_no) {
		this.purc_order_no = purc_order_no;
	}



	public String getPurc_order_code() {
		return purc_order_code;
	}



	public void setPurc_order_code(String purc_order_code) {
		this.purc_order_code = purc_order_code;
	}



	public String getPurc_order_reg_date() {
		return purc_order_reg_date;
	}



	public void setPurc_order_reg_date(String purc_order_reg_date) {
		this.purc_order_reg_date = purc_order_reg_date;
	}



	public String getPurc_order_dterms() {
		return purc_order_dterms;
	}



	public void setPurc_order_dterms(String purc_order_dterms) {
		this.purc_order_dterms = purc_order_dterms;
	}



	public String getPurc_order_status() {
		return purc_order_status;
	}



	public void setPurc_order_status(String purc_order_status) {
		this.purc_order_status = purc_order_status;
	}



	public String getPurc_order_etc() {
		return purc_order_etc;
	}



	public void setPurc_order_etc(String purc_order_etc) {
		this.purc_order_etc = purc_order_etc;
	}



	public int getTotal_price() {
		return total_price;
	}



	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}



	public String getEnd_date() {
		return end_date;
	}



	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}



	public int getSup_no() {
		return sup_no;
	}



	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}



	public String getSup_name() {
		return sup_name;
	}



	public void setSup_name(String sup_name) {
		this.sup_name = sup_name;
	}



	public String getSup_ceo_name() {
		return sup_ceo_name;
	}



	public void setSup_ceo_name(String sup_ceo_name) {
		this.sup_ceo_name = sup_ceo_name;
	}



	public String getSup_reg_no() {
		return sup_reg_no;
	}



	public void setSup_reg_no(String sup_reg_no) {
		this.sup_reg_no = sup_reg_no;
	}



	public String getSup_addr1() {
		return sup_addr1;
	}



	public void setSup_addr1(String sup_addr1) {
		this.sup_addr1 = sup_addr1;
	}



	public String getSup_addr2() {
		return sup_addr2;
	}



	public void setSup_addr2(String sup_addr2) {
		this.sup_addr2 = sup_addr2;
	}



	public String getSup_cip() {
		return sup_cip;
	}



	public void setSup_cip(String sup_cip) {
		this.sup_cip = sup_cip;
	}



	public String getSup_cip_email() {
		return sup_cip_email;
	}



	public void setSup_cip_email(String sup_cip_email) {
		this.sup_cip_email = sup_cip_email;
	}



	public String getSup_total_addr() {
		return sup_total_addr;
	}



	public void setSup_total_addr(String sup_total_addr) {
		this.sup_total_addr = sup_total_addr;
	}



	public int getComp_no() {
		return comp_no;
	}



	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}



	public String getComp_name() {
		return comp_name;
	}



	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}



	public String getComp_ceo_name() {
		return comp_ceo_name;
	}



	public void setComp_ceo_name(String comp_ceo_name) {
		this.comp_ceo_name = comp_ceo_name;
	}



	public String getComp_reg_no() {
		return comp_reg_no;
	}



	public void setComp_reg_no(String comp_reg_no) {
		this.comp_reg_no = comp_reg_no;
	}



	public String getComp_addr1() {
		return comp_addr1;
	}



	public void setComp_addr1(String comp_addr1) {
		this.comp_addr1 = comp_addr1;
	}



	public String getComp_addr2() {
		return comp_addr2;
	}



	public void setComp_addr2(String comp_addr2) {
		this.comp_addr2 = comp_addr2;
	}



	public String getComp_total_addr() {
		return comp_total_addr;
	}



	public void setComp_total_addr(String comp_total_addr) {
		this.comp_total_addr = comp_total_addr;
	}



	public int getCont_no() {
		return cont_no;
	}



	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}



	public int getCont_material_cnt() {
		return cont_material_cnt;
	}



	public void setCont_material_cnt(int cont_material_cnt) {
		this.cont_material_cnt = cont_material_cnt;
	}



	public String getCont_date() {
		return cont_date;
	}



	public void setCont_date(String cont_date) {
		this.cont_date = cont_date;
	}



	public int getCont_leadtime() {
		return cont_leadtime;
	}



	public void setCont_leadtime(int cont_leadtime) {
		this.cont_leadtime = cont_leadtime;
	}



	public String getCont_material_sku() {
		return cont_material_sku;
	}



	public void setCont_material_sku(String cont_material_sku) {
		this.cont_material_sku = cont_material_sku;
	}



	public int getMprice_no() {
		return mprice_no;
	}



	public void setMprice_no(int mprice_no) {
		this.mprice_no = mprice_no;
	}



	public int getCont_mprice() {
		return cont_mprice;
	}



	public void setCont_mprice(int cont_mprice) {
		this.cont_mprice = cont_mprice;
	}



	public String getMprice_currency() {
		return mprice_currency;
	}



	public void setMprice_currency(String mprice_currency) {
		this.mprice_currency = mprice_currency;
	}



	public int getEmp_no() {
		return emp_no;
	}



	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}



	public String getEmp_name() {
		return emp_name;
	}



	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}



	public String getEmp_email() {
		return emp_email;
	}



	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}



	public int getMrp_no() {
		return mrp_no;
	}



	public void setMrp_no(int mrp_no) {
		this.mrp_no = mrp_no;
	}



	public String getMrp_due_date() {
		return mrp_due_date;
	}



	public void setMrp_due_date(String mrp_due_date) {
		this.mrp_due_date = mrp_due_date;
	}



	public int getMaterial_no() {
		return material_no;
	}



	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}



	public String getMaterial_name() {
		return material_name;
	}



	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}



	public String getMaterial_code() {
		return material_code;
	}



	public void setMaterial_code(String material_code) {
		this.material_code = material_code;
	}



	public String getMaterial_description() {
		return material_description;
	}



	public void setMaterial_description(String material_description) {
		this.material_description = material_description;
	}



	public String getMaterial_sku() {
		return material_sku;
	}



	public void setMaterial_sku(String material_sku) {
		this.material_sku = material_sku;
	}



	@Override
	public String toString() {
		return "PurchaseorderDTO [purc_order_no=" + purc_order_no + ", purc_order_code=" + purc_order_code
				+ ", purc_order_reg_date=" + purc_order_reg_date + ", purc_order_dterms=" + purc_order_dterms
				+ ", purc_order_status=" + purc_order_status + ", purc_order_etc=" + purc_order_etc + ", total_price="
				+ total_price + ", end_date=" + end_date + ", sup_no=" + sup_no + ", sup_name=" + sup_name
				+ ", sup_ceo_name=" + sup_ceo_name + ", sup_reg_no=" + sup_reg_no + ", sup_addr1=" + sup_addr1
				+ ", sup_addr2=" + sup_addr2 + ", sup_cip=" + sup_cip + ", sup_cip_email=" + sup_cip_email
				+ ", sup_total_addr=" + sup_total_addr + ", comp_no=" + comp_no + ", comp_name=" + comp_name
				+ ", comp_ceo_name=" + comp_ceo_name + ", comp_reg_no=" + comp_reg_no + ", comp_addr1=" + comp_addr1
				+ ", comp_addr2=" + comp_addr2 + ", comp_total_addr=" + comp_total_addr + ", cont_no=" + cont_no
				+ ", cont_material_cnt=" + cont_material_cnt + ", cont_date=" + cont_date + ", cont_leadtime="
				+ cont_leadtime + ", cont_material_sku=" + cont_material_sku + ", mprice_no=" + mprice_no
				+ ", cont_mprice=" + cont_mprice + ", mprice_currency=" + mprice_currency + ", emp_no=" + emp_no
				+ ", emp_name=" + emp_name + ", emp_email=" + emp_email + ", mrp_no=" + mrp_no + ", mrp_due_date="
				+ mrp_due_date + ", material_no=" + material_no + ", material_name=" + material_name
				+ ", material_code=" + material_code + ", material_description=" + material_description
				+ ", material_sku=" + material_sku + "]";
	}


	
	
}
