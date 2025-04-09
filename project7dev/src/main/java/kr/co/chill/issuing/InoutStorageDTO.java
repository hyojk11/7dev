package kr.co.chill.issuing;

public class InoutStorageDTO {
//	chill.material_out
	private int material_out_no; 
	private int mstorage_no; 
	private int material_no; 
	private String material_code;
	private String material_out_date; 
	private int material_out_cnt;
	
//	chill.line_in
	private int line_in_no; 
	private int line_no; 
	private String line_in_date; 
	private int line_in_cnt;
	
	public InoutStorageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getMaterial_out_no() {
		return material_out_no;
	}

	public void setMaterial_out_no(int material_out_no) {
		this.material_out_no = material_out_no;
	}

	public int getMstorage_no() {
		return mstorage_no;
	}

	public void setMstorage_no(int mstorage_no) {
		this.mstorage_no = mstorage_no;
	}

	public int getMaterial_no() {
		return material_no;
	}

	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}

	public String getMaterial_code() {
		return material_code;
	}

	public void setMaterial_code(String material_code) {
		this.material_code = material_code;
	}

	public String getMaterial_out_date() {
		return material_out_date;
	}

	public void setMaterial_out_date(String material_out_date) {
		this.material_out_date = material_out_date;
	}

	public int getMaterial_out_cnt() {
		return material_out_cnt;
	}

	public void setMaterial_out_cnt(int material_out_cnt) {
		this.material_out_cnt = material_out_cnt;
	}

	public int getLine_in_no() {
		return line_in_no;
	}

	public void setLine_in_no(int line_in_no) {
		this.line_in_no = line_in_no;
	}

	public int getLine_no() {
		return line_no;
	}

	public void setLine_no(int line_no) {
		this.line_no = line_no;
	}

	public String getLine_in_date() {
		return line_in_date;
	}

	public void setLine_in_date(String line_in_date) {
		this.line_in_date = line_in_date;
	}

	public int getLine_in_cnt() {
		return line_in_cnt;
	}

	public void setLine_in_cnt(int line_in_cnt) {
		this.line_in_cnt = line_in_cnt;
	}
		
}
