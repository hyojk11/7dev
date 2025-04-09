package kr.co.chill.issuing;

public class IssuingDTO {
//	chill.product
	private int product_no;
	private String product_name;
	
//	chill.material
	private int material_no;
	private String material_name;
	private String material_code;
	private int material_quantity;
	private String material_unit;
	private String material_raw_material;
	
//	chill.material_storage
	private int mstorage_no;
	private int mstorage_stock;
	private String mstorage_code;
	
//	other
	private int material_produce;
	
	public IssuingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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

	public int getMaterial_quantity() {
		return material_quantity;
	}

	public void setMaterial_quantity(int material_quantity) {
		this.material_quantity = material_quantity;
	}

	public String getMaterial_unit() {
		return material_unit;
	}

	public void setMaterial_unit(String material_unit) {
		this.material_unit = material_unit;
	}

	public String getMaterial_raw_material() {
		return material_raw_material;
	}

	public void setMaterial_raw_material(String material_raw_material) {
		this.material_raw_material = material_raw_material;
	}

	public int getMstorage_no() {
		return mstorage_no;
	}

	public void setMstorage_no(int mstorage_no) {
		this.mstorage_no = mstorage_no;
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

	public int getMaterial_produce() {
		return material_produce;
	}

	public void setMaterial_produce(int material_produce) {
		this.material_produce = material_produce;
	}
	
	

}
