package kr.co.chill.incoming;
//자재창고에 있는 자재정보를 읽어오는 DTO
public class Material_storageDTO {
	private String material_name;
	private String material_code;
	private String material_raw_material;
	private String material_sku;
	private String material_unit;
	private String mstorage_stock;
	private String mstorage_code;
	private String emp_name;
	private String sup_name;
	private int product_product_no;
	private String material_in_date;
	private String material_etc;
	
	Material_storageDTO(){}

	public Material_storageDTO(String material_name, String material_code, String material_raw_material,
			String material_sku, String material_unit, String mstorage_stock, String mstorage_code, String emp_name,
			String sup_name, int product_product_no, String material_in_date, String material_etc) {
		super();
		this.material_name = material_name;
		this.material_code = material_code;
		this.material_raw_material = material_raw_material;
		this.material_sku = material_sku;
		this.material_unit = material_unit;
		this.mstorage_stock = mstorage_stock;
		this.mstorage_code = mstorage_code;
		this.emp_name = emp_name;
		this.sup_name = sup_name;
		this.product_product_no = product_product_no;
		this.material_in_date = material_in_date;
		this.material_etc = material_etc;
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

	public String getMstorage_stock() {
		return mstorage_stock;
	}

	public void setMstorage_stock(String mstorage_stock) {
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
	
	
}
