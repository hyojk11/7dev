package kr.co.chill.incoming;

import java.util.List;

//창고별 자재정보 리스트 and 입고예정 리스트DTO
public class IncomingDTO {
	
	
	private int material_material_no;
	private String material_name; //자재명
	private String material_code;// 자재코드
	private String material_raw_material;//소재
	private String material_description;//규격
	private String material_unit;//단위
	private	int mstorage_stock;//자재수량
	private String mstorage_code;//창고코드
	private String emp_name;//담당자 이름
	private String sup_name;//공급업체명
	private int product_product_no;//제품번호
	private String material_in_date;//입고날짜
	private String material_etc;//기타정보
	private int state;//자재입고여부 상태
	
	public IncomingDTO(){}

	public IncomingDTO(int material_material_no, String material_name, String material_code,
			String material_raw_material, String material_description, String material_unit, int mstorage_stock,
			String mstorage_code, String emp_name, String sup_name, int product_product_no, String material_in_date,
			String material_etc, int state) {
		super();
		this.material_material_no = material_material_no;
		this.material_name = material_name;
		this.material_code = material_code;
		this.material_raw_material = material_raw_material;
		this.material_description = material_description;
		this.material_unit = material_unit;
		this.mstorage_stock = mstorage_stock;
		this.mstorage_code = mstorage_code;
		this.emp_name = emp_name;
		this.sup_name = sup_name;
		this.product_product_no = product_product_no;
		this.material_in_date = material_in_date;
		this.material_etc = material_etc;
		this.state = state;
	}

	public int getMaterial_material_no() {
		return material_material_no;
	}

	public void setMaterial_material_no(int material_material_no) {
		this.material_material_no = material_material_no;
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

	public int getProduct_product_no() {
		return product_product_no;
	}

	public void setProduct_product_no(int product_product_no) {
		this.product_product_no = product_product_no;
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

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "IncomingDTO [material_material_no=" + material_material_no + ", material_name=" + material_name
				+ ", material_code=" + material_code + ", material_raw_material=" + material_raw_material
				+ ", material_description=" + material_description + ", material_unit=" + material_unit
				+ ", mstorage_stock=" + mstorage_stock + ", mstorage_code=" + mstorage_code + ", emp_name=" + emp_name
				+ ", sup_name=" + sup_name + ", product_product_no=" + product_product_no + ", material_in_date="
				+ material_in_date + ", material_etc=" + material_etc + ", state=" + state + "]";
	}

	
}
