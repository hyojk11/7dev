package kr.co.chill.incoming;

public class Trans_paperDTO {
	
	// 거래명세서 정보
	private int trans_paper_no;
	private int trans_paper_material_cnt; // 입고수량(입력용)
	private String trans_paper_reg_date; 
	
	// 담당자
	private int emp_no;
	private String emp_name;
	
	// 거래처 정보
	private int sup_no; 
	private String sup_reg_no; // 사업자 등록번호 
	private String sup_name; // 상호명
	private String sup_ceo_name; // 성명
	private String sup_addr1; 
	private String sup_addr2;
	
	//회사 정보
	private int comp_no;
	private String comp_reg_no; // 사업자 등록번호
	private String comp_name; // 상호명
	private String comp_ceo_name; // 성명
	private String comp_addr1;
	private String comp_addr2;
	
	
	// 구매발주서 정보
	private int purc_order_no;
	private String purc_order_reg_date;
	private int purc_order_status;
	
	// 계약서 정보
	private int cont_no;
	private String cont_code; //계약서 코드
	private int cont_material_cnt; // 수량
	private int cont_mprice; // 계약단가
	private String mprice_currency; //화폐단위

	// 부품 정보
	private int material_no;
	private String material_name; // 부품명
	private String material_code; // 부품코드
	private String material_sku; // 부품포장단위
	private String material_unit; // 단위

	public Trans_paperDTO(){}
	
	// 생성자
	public Trans_paperDTO(int trans_paper_no, int trans_paper_material_cnt, String trans_paper_reg_date, int emp_no,
			String emp_name, int sup_no, String sup_reg_no, String sup_name, String sup_ceo_name, String sup_addr1,
			String sup_addr2, int comp_no, String comp_reg_no, String comp_name, String comp_ceo_name,
			String comp_addr1, String comp_addr2, int purc_order_no, String purc_order_reg_date, int purc_order_status,
			int cont_no, String cont_code, int cont_material_cnt, int cont_mprice, String mprice_currency,
			int material_no, String material_name, String material_code, String material_sku, String material_unit) {
		super();
		this.trans_paper_no = trans_paper_no;
		this.trans_paper_material_cnt = trans_paper_material_cnt;
		this.trans_paper_reg_date = trans_paper_reg_date;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.sup_no = sup_no;
		this.sup_reg_no = sup_reg_no;
		this.sup_name = sup_name;
		this.sup_ceo_name = sup_ceo_name;
		this.sup_addr1 = sup_addr1;
		this.sup_addr2 = sup_addr2;
		this.comp_no = comp_no;
		this.comp_reg_no = comp_reg_no;
		this.comp_name = comp_name;
		this.comp_ceo_name = comp_ceo_name;
		this.comp_addr1 = comp_addr1;
		this.comp_addr2 = comp_addr2;
		this.purc_order_no = purc_order_no;
		this.purc_order_reg_date = purc_order_reg_date;
		this.purc_order_status = purc_order_status;
		this.cont_no = cont_no;
		this.cont_code = cont_code;
		this.cont_material_cnt = cont_material_cnt;
		this.cont_mprice = cont_mprice;
		this.mprice_currency = mprice_currency;
		this.material_no = material_no;
		this.material_name = material_name;
		this.material_code = material_code;
		this.material_sku = material_sku;
		this.material_unit = material_unit;
	}



	public int getTrans_paper_no() {
		return trans_paper_no;
	}



	public void setTrans_paper_no(int trans_paper_no) {
		this.trans_paper_no = trans_paper_no;
	}



	public int getTrans_paper_material_cnt() {
		return trans_paper_material_cnt;
	}



	public void setTrans_paper_material_cnt(int trans_paper_material_cnt) {
		this.trans_paper_material_cnt = trans_paper_material_cnt;
	}



	public String getTrans_paper_reg_date() {
		return trans_paper_reg_date;
	}



	public void setTrans_paper_reg_date(String trans_paper_reg_date) {
		this.trans_paper_reg_date = trans_paper_reg_date;
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



	public int getSup_no() {
		return sup_no;
	}



	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}



	public String getSup_reg_no() {
		return sup_reg_no;
	}



	public void setSup_reg_no(String sup_reg_no) {
		this.sup_reg_no = sup_reg_no;
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



	public int getComp_no() {
		return comp_no;
	}



	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}



	public String getComp_reg_no() {
		return comp_reg_no;
	}



	public void setComp_reg_no(String comp_reg_no) {
		this.comp_reg_no = comp_reg_no;
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



	public int getPurc_order_no() {
		return purc_order_no;
	}



	public void setPurc_order_no(int purc_order_no) {
		this.purc_order_no = purc_order_no;
	}



	public String getPurc_order_reg_date() {
		return purc_order_reg_date;
	}



	public void setPurc_order_reg_date(String purc_order_reg_date) {
		this.purc_order_reg_date = purc_order_reg_date;
	}



	public int getPurc_order_status() {
		return purc_order_status;
	}



	public void setPurc_order_status(int purc_order_status) {
		this.purc_order_status = purc_order_status;
	}



	public int getCont_no() {
		return cont_no;
	}



	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}



	public String getCont_code() {
		return cont_code;
	}



	public void setCont_code(String cont_code) {
		this.cont_code = cont_code;
	}



	public int getCont_material_cnt() {
		return cont_material_cnt;
	}



	public void setCont_material_cnt(int cont_material_cnt) {
		this.cont_material_cnt = cont_material_cnt;
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



	public String getMaterial_sku() {
		return material_sku;
	}



	public void setMaterial_sku(String material_sku) {
		this.material_sku = material_sku;
	}



	public String getMaterial_unit() {
		return material_unit;
	}



	public void setMaterial_unit(String material_unit) {
		this.material_unit = material_unit;
	}

	@Override
	public String toString() {
		return "Trans_paperDTO2 [trans_paper_no=" + trans_paper_no + ", trans_paper_material_cnt="
				+ trans_paper_material_cnt + ", trans_paper_reg_date=" + trans_paper_reg_date + ", emp_no=" + emp_no
				+ ", emp_name=" + emp_name + ", sup_no=" + sup_no + ", sup_reg_no=" + sup_reg_no + ", sup_name="
				+ sup_name + ", sup_ceo_name=" + sup_ceo_name + ", sup_addr1=" + sup_addr1 + ", sup_addr2=" + sup_addr2
				+ ", comp_no=" + comp_no + ", comp_reg_no=" + comp_reg_no + ", comp_name=" + comp_name
				+ ", comp_ceo_name=" + comp_ceo_name + ", comp_addr1=" + comp_addr1 + ", comp_addr2=" + comp_addr2
				+ ", purc_order_no=" + purc_order_no + ", purc_order_reg_date=" + purc_order_reg_date
				+ ", purc_order_status=" + purc_order_status + ", cont_no=" + cont_no + ", cont_code=" + cont_code
				+ ", cont_material_cnt=" + cont_material_cnt + ", cont_mprice=" + cont_mprice + ", mprice_currency="
				+ mprice_currency + ", material_no=" + material_no + ", material_name=" + material_name
				+ ", material_code=" + material_code + ", material_sku=" + material_sku + ", material_unit="
				+ material_unit + "]";
	}
	
	
}
