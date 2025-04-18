package kr.co.chill.incoming;

// 현황관리
public class StatusDTO {
	
	
	private int material_no;
	private String material_name; //자재명
	private String material_code;// 자재코드
	private String material_raw_material;//소재
	private String material_description;//규격
	private String material_unit;//단위
	private	int mstorage_stock;//자재수량
	private String mstorage_code;//창고코드
	private String emp_name;//담당자 이름
	private String sup_name;//공급업체명
	private int product_no;//제품번호
	private String material_in_date;//입고날짜
	private String material_etc;//기타정보
	private int material_in_no;
	private int material_in_cnt;//입고예정수량 
	private Integer material_in_state;//자재입고여부 상태
	
	// 구매발주서 
	private int purc_order_no;
	private String purc_order_code;
	private String purc_order_reg_date;
	private String mrp_due_date;
	
	
	private int cont_no;
	private int cont_material_cnt;
	

	public StatusDTO() {}


	public StatusDTO(int material_no, String material_name, String material_code, String material_raw_material,
			String material_description, String material_unit, int mstorage_stock, String mstorage_code,
			String emp_name, String sup_name, int product_no, String material_in_date, String material_etc,
			int material_in_no, int material_in_cnt, Integer material_in_state, int purc_order_no,
			String purc_order_code, String purc_order_reg_date, String mrp_due_date, int cont_no,
			int cont_material_cnt) {
		super();
		this.material_no = material_no;
		this.material_name = material_name;
		this.material_code = material_code;
		this.material_raw_material = material_raw_material;
		this.material_description = material_description;
		this.material_unit = material_unit;
		this.mstorage_stock = mstorage_stock;
		this.mstorage_code = mstorage_code;
		this.emp_name = emp_name;
		this.sup_name = sup_name;
		this.product_no = product_no;
		this.material_in_date = material_in_date;
		this.material_etc = material_etc;
		this.material_in_no = material_in_no;
		this.material_in_cnt = material_in_cnt;
		this.material_in_state = material_in_state;
		this.purc_order_no = purc_order_no;
		this.purc_order_code = purc_order_code;
		this.purc_order_reg_date = purc_order_reg_date;
		this.mrp_due_date = mrp_due_date;
		this.cont_no = cont_no;
		this.cont_material_cnt = cont_material_cnt;
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


	public String getMaterial_raw_material() {
		return material_raw_material;
	}


	public void setMaterial_raw_material(String material_raw_material) {
		this.material_raw_material = material_raw_material;
	}


	public String getMaterial_description() {
		return material_description;
	}


	public void setMaterial_description(String material_description) {
		this.material_description = material_description;
	}


	public String getMaterial_unit() {
		return material_unit;
	}


	public void setMaterial_unit(String material_unit) {
		this.material_unit = material_unit;
	}


	public int getMstorage_stock() {
		return mstorage_stock;
	}


	public void setMstorage_stock(int mstorage_stock) {
		this.mstorage_stock = mstorage_stock;
	}


	public String getMstorage_code() {
		return mstorage_code;
	}


	public void setMstorage_code(String mstorage_code) {
		this.mstorage_code = mstorage_code;
	}


	public String getEmp_name() {
		return emp_name;
	}


	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}


	public String getSup_name() {
		return sup_name;
	}


	public void setSup_name(String sup_name) {
		this.sup_name = sup_name;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public String getMaterial_in_date() {
		return material_in_date;
	}


	public void setMaterial_in_date(String material_in_date) {
		this.material_in_date = material_in_date;
	}


	public String getMaterial_etc() {
		return material_etc;
	}


	public void setMaterial_etc(String material_etc) {
		this.material_etc = material_etc;
	}


	public int getMaterial_in_no() {
		return material_in_no;
	}


	public void setMaterial_in_no(int material_in_no) {
		this.material_in_no = material_in_no;
	}


	public int getMaterial_in_cnt() {
		return material_in_cnt;
	}


	public void setMaterial_in_cnt(int material_in_cnt) {
		this.material_in_cnt = material_in_cnt;
	}


	public Integer getMaterial_in_state() {
		return material_in_state;
	}


	public void setMaterial_in_state(Integer material_in_state) {
		this.material_in_state = material_in_state;
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


	public String getMrp_due_date() {
		return mrp_due_date;
	}


	public void setMrp_due_date(String mrp_due_date) {
		this.mrp_due_date = mrp_due_date;
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


	@Override
	public String toString() {
		return "StatusDTO [material_no=" + material_no + ", material_name=" + material_name + ", material_code="
				+ material_code + ", material_raw_material=" + material_raw_material + ", material_description="
				+ material_description + ", material_unit=" + material_unit + ", mstorage_stock=" + mstorage_stock
				+ ", mstorage_code=" + mstorage_code + ", emp_name=" + emp_name + ", sup_name=" + sup_name
				+ ", product_no=" + product_no + ", material_in_date=" + material_in_date + ", material_etc="
				+ material_etc + ", material_in_no=" + material_in_no + ", material_in_cnt=" + material_in_cnt
				+ ", material_in_state=" + material_in_state + ", purc_order_no=" + purc_order_no + ", purc_order_code="
				+ purc_order_code + ", purc_order_reg_date=" + purc_order_reg_date + ", mrp_due_date=" + mrp_due_date
				+ ", cont_no=" + cont_no + ", cont_material_cnt=" + cont_material_cnt + "]";
	}

}
