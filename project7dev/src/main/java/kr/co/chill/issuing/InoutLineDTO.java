package kr.co.chill.issuing;

public class InoutLineDTO {
//	chill.line_out
	private int line_out_no;
	private int line_no;
	private int product_no;
	private String line_out_date;
	private int line_out_cnt;
	
//	chill.product_in
	private int product_in_no;  
	private int pstorage_no;
	private String product_in_date;
	private int product_in_cnt;
	
//	other
	private String product_name;
	private String product_code;
	private String line_code;
	private String pstorage_code;
	
	public InoutLineDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getLine_out_no() {
		return line_out_no;
	}

	public void setLine_out_no(int line_out_no) {
		this.line_out_no = line_out_no;
	}

	public int getLine_no() {
		return line_no;
	}

	public void setLine_no(int line_no) {
		this.line_no = line_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getLine_out_date() {
		return line_out_date;
	}

	public void setLine_out_date(String line_out_date) {
		this.line_out_date = line_out_date;
	}

	public int getLine_out_cnt() {
		return line_out_cnt;
	}

	public void setLine_out_cnt(int line_out_cnt) {
		this.line_out_cnt = line_out_cnt;
	}

	public int getProduct_in_no() {
		return product_in_no;
	}

	public void setProduct_in_no(int product_in_no) {
		this.product_in_no = product_in_no;
	}

	public int getPstorage_no() {
		return pstorage_no;
	}

	public void setPstorage_no(int pstorage_no) {
		this.pstorage_no = pstorage_no;
	}

	public String getProduct_in_date() {
		return product_in_date;
	}

	public void setProduct_in_date(String product_in_date) {
		this.product_in_date = product_in_date;
	}

	public int getProduct_in_cnt() {
		return product_in_cnt;
	}

	public void setProduct_in_cnt(int product_in_cnt) {
		this.product_in_cnt = product_in_cnt;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getLine_code() {
		return line_code;
	}

	public void setLine_code(String line_code) {
		this.line_code = line_code;
	}

	public String getPstorage_code() {
		return pstorage_code;
	}

	public void setPstorage_code(String pstorage_code) {
		this.pstorage_code = pstorage_code;
	}
	
	

}
