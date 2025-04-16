package kr.co.chill.incoming;

import java.util.List;

//창고별 자재정보 리스트 and 입고예정 리스트DTO
public class IncomingDTO {
	
	
	private int material_no;//자재번호
	private String material_name; //자재명
	private String material_code;// 자재코드
	private String material_raw_material;//소재
	private String material_description;//규격
	private String material_unit;//단위
	private	int mstorage_stock;//자재수량
	private String mstorage_code;//창고코드
	private int emp_no;//담당자 번호
	private String emp_name;//담당자 이름
	private String sup_name;//공급업체명
	private int product_no;//제품번호
	private int material_in_no; // 자재도착순서
	private String material_in_date;//입고날짜
	private int material_in_cnt;//입고예정수량 
	private String material_etc;//기타정보
	private Integer state;//자재입고여부 상태
	private String start_date;//검색 시작날짜
	private String end_date;// 검색 끝 날짜
	private int mstorage_no; 
	private int sup_no;
	private String mstorage_in_date;
	

	public IncomingDTO(){}


	public IncomingDTO(int material_no, String material_name, String material_code, String material_raw_material,
			String material_description, String material_unit, int mstorage_stock, String mstorage_code, int emp_no,
			String emp_name, String sup_name, int product_no, int material_in_no, String material_in_date,
			int material_in_cnt, String material_etc, Integer state, String start_date, String end_date,
			int mstorage_no, int sup_no, String mstorage_in_date) {
		super();
		this.material_no = material_no;
		this.material_name = material_name;
		this.material_code = material_code;
		this.material_raw_material = material_raw_material;
		this.material_description = material_description;
		this.material_unit = material_unit;
		this.mstorage_stock = mstorage_stock;
		this.mstorage_code = mstorage_code;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.sup_name = sup_name;
		this.product_no = product_no;
		this.material_in_no = material_in_no;
		this.material_in_date = material_in_date;
		this.material_in_cnt = material_in_cnt;
		this.material_etc = material_etc;
		this.state = state;
		this.start_date = start_date;
		this.end_date = end_date;
		this.mstorage_no = mstorage_no;
		this.sup_no = sup_no;
		this.mstorage_in_date = mstorage_in_date;
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


	public int getMaterial_in_no() {
		return material_in_no;
	}


	public void setMaterial_in_no(int material_in_no) {
		this.material_in_no = material_in_no;
	}


	public String getMaterial_in_date() {
		return material_in_date;
	}


	public void setMaterial_in_date(String material_in_date) {
		this.material_in_date = material_in_date;
	}


	public int getMaterial_in_cnt() {
		return material_in_cnt;
	}


	public void setMaterial_in_cnt(int material_in_cnt) {
		this.material_in_cnt = material_in_cnt;
	}


	public String getMaterial_etc() {
		return material_etc;
	}


	public void setMaterial_etc(String material_etc) {
		this.material_etc = material_etc;
	}


	public Integer getState() {
		return state;
	}


	public void setState(Integer state) {
		this.state = state;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public int getMstorage_no() {
		return mstorage_no;
	}


	public void setMstorage_no(int mstorage_no) {
		this.mstorage_no = mstorage_no;
	}


	public int getSup_no() {
		return sup_no;
	}


	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}


	public String getMstorage_in_date() {
		return mstorage_in_date;
	}


	public void setMstorage_in_date(String mstorage_in_date) {
		this.mstorage_in_date = mstorage_in_date;
	}


	@Override
	public String toString() {
		return "IncomingDTO [material_no=" + material_no + ", material_name=" + material_name + ", material_code="
				+ material_code + ", material_raw_material=" + material_raw_material + ", material_description="
				+ material_description + ", material_unit=" + material_unit + ", mstorage_stock=" + mstorage_stock
				+ ", mstorage_code=" + mstorage_code + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", sup_name="
				+ sup_name + ", product_no=" + product_no + ", material_in_no=" + material_in_no + ", material_in_date="
				+ material_in_date + ", material_in_cnt=" + material_in_cnt + ", material_etc=" + material_etc
				+ ", state=" + state + ", start_date=" + start_date + ", end_date=" + end_date + ", mstorage_no="
				+ mstorage_no + ", sup_no=" + sup_no + ", mstorage_in_date=" + mstorage_in_date + "]";
	}


	
}
