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
	
	private int total_price; //총 금액 별칭
	private String end_date; //납기일 별칭
	
	//supplier table
	private int sup_no;
	private String sup_name;
	
	//company table
	private int comp_no;
	private String comp_name;

	//contract table
	private int cont_no;
	private int cont_material_cnt; //자재수량
	private String cont_date; //계약일
	private int cont_leadtime; //납기일수
	
	//material_unit_price table
	private int mprice_no;
	private int cont_mprice; //계약단가
	private String mprice_currency; //화폐단위

	//employee table
	private int emp_no; //사원
	private String emp_name;
	
	
	public PurchaseorderDTO() {
		super();
	}


	public PurchaseorderDTO(int purc_order_no, String purc_order_code, String purc_order_reg_date,
			String purc_order_dterms, String purc_order_status, String purc_order_etc, int total_price, String end_date,
			int sup_no, String sup_name, int comp_no, String comp_name, int cont_no, int cont_material_cnt,
			String cont_date, int cont_leadtime, int mprice_no, int cont_mprice, String mprice_currency, int emp_no,
			String emp_name) {
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
		this.comp_no = comp_no;
		this.comp_name = comp_name;
		this.cont_no = cont_no;
		this.cont_material_cnt = cont_material_cnt;
		this.cont_date = cont_date;
		this.cont_leadtime = cont_leadtime;
		this.mprice_no = mprice_no;
		this.cont_mprice = cont_mprice;
		this.mprice_currency = mprice_currency;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
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


	@Override
	public String toString() {
		return "PurchaseorderDTO [purc_order_no=" + purc_order_no + ", purc_order_code=" + purc_order_code
				+ ", purc_order_reg_date=" + purc_order_reg_date + ", purc_order_dterms=" + purc_order_dterms
				+ ", purc_order_status=" + purc_order_status + ", purc_order_etc=" + purc_order_etc + ", total_price="
				+ total_price + ", end_date=" + end_date + ", sup_no=" + sup_no + ", sup_name=" + sup_name
				+ ", comp_no=" + comp_no + ", comp_name=" + comp_name + ", cont_no=" + cont_no + ", cont_material_cnt="
				+ cont_material_cnt + ", cont_date=" + cont_date + ", cont_leadtime=" + cont_leadtime + ", mprice_no="
				+ mprice_no + ", cont_mprice=" + cont_mprice + ", mprice_currency=" + mprice_currency + ", emp_no="
				+ emp_no + ", emp_name=" + emp_name + "]";
	}

	

	
	
	
}
