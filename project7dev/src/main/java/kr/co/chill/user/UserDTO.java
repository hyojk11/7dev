package kr.co.chill.user;

public class UserDTO {

	private String user_id;
	private String user_password;
	
	// employee table
	private int emp_no;
	private String emp_name;
	private String emp_job;
	private String emp_id;
	private String emp_password;
	private String emp_phone;
	private String emp_email;
	
	// supplier table
	private int sup_no;
	private String sup_name;
	private String sup_email;
	private String sup_phone;
	private String sup_addr1;
	private String sup_addr2;
	private String sup_category;
	private String sup_ceo_name;
	private String sup_reg_no;
	private String sup_cip;
	private String sup_cip_phone;
	private String sup_cip_email;
	private String sup_id;
	private String sup_password;
	private String sup_etc;
	
	private String sup_total_addr; //** 거래처 전체주소 별칭
	
	
	
	public UserDTO() {
		super();
	}


	public UserDTO(String user_id, String user_password, int emp_no, int sup_no) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.emp_no = emp_no;
		this.sup_no = sup_no;
	}


	public UserDTO(String user_id, String user_password, int emp_no, String emp_name, String emp_job, String emp_id,
			String emp_password, String emp_phone, String emp_email, int sup_no, String sup_name, String sup_email,
			String sup_phone, String sup_addr1, String sup_addr2, String sup_category, String sup_ceo_name,
			String sup_reg_no, String sup_cip, String sup_cip_phone, String sup_cip_email, String sup_id,
			String sup_password, String sup_etc, String sup_total_addr) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_job = emp_job;
		this.emp_id = emp_id;
		this.emp_password = emp_password;
		this.emp_phone = emp_phone;
		this.emp_email = emp_email;
		this.sup_no = sup_no;
		this.sup_name = sup_name;
		this.sup_email = sup_email;
		this.sup_phone = sup_phone;
		this.sup_addr1 = sup_addr1;
		this.sup_addr2 = sup_addr2;
		this.sup_category = sup_category;
		this.sup_ceo_name = sup_ceo_name;
		this.sup_reg_no = sup_reg_no;
		this.sup_cip = sup_cip;
		this.sup_cip_phone = sup_cip_phone;
		this.sup_cip_email = sup_cip_email;
		this.sup_id = sup_id;
		this.sup_password = sup_password;
		this.sup_etc = sup_etc;
		this.sup_total_addr = sup_total_addr;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_password() {
		return user_password;
	}


	public void setUser_password(String user_password) {
		this.user_password = user_password;
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


	public String getEmp_job() {
		return emp_job;
	}


	public void setEmp_job(String emp_job) {
		this.emp_job = emp_job;
	}


	public String getEmp_id() {
		return emp_id;
	}


	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}


	public String getEmp_password() {
		return emp_password;
	}


	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}


	public String getEmp_phone() {
		return emp_phone;
	}


	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}


	public String getEmp_email() {
		return emp_email;
	}


	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
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


	public String getSup_email() {
		return sup_email;
	}


	public void setSup_email(String sup_email) {
		this.sup_email = sup_email;
	}


	public String getSup_phone() {
		return sup_phone;
	}


	public void setSup_phone(String sup_phone) {
		this.sup_phone = sup_phone;
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


	public String getSup_category() {
		return sup_category;
	}


	public void setSup_category(String sup_category) {
		this.sup_category = sup_category;
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


	public String getSup_cip() {
		return sup_cip;
	}


	public void setSup_cip(String sup_cip) {
		this.sup_cip = sup_cip;
	}


	public String getSup_cip_phone() {
		return sup_cip_phone;
	}


	public void setSup_cip_phone(String sup_cip_phone) {
		this.sup_cip_phone = sup_cip_phone;
	}


	public String getSup_cip_email() {
		return sup_cip_email;
	}


	public void setSup_cip_email(String sup_cip_email) {
		this.sup_cip_email = sup_cip_email;
	}


	public String getSup_id() {
		return sup_id;
	}


	public void setSup_id(String sup_id) {
		this.sup_id = sup_id;
	}


	public String getSup_password() {
		return sup_password;
	}


	public void setSup_password(String sup_password) {
		this.sup_password = sup_password;
	}


	public String getSup_etc() {
		return sup_etc;
	}


	public void setSup_etc(String sup_etc) {
		this.sup_etc = sup_etc;
	}


	public String getSup_total_addr() {
		return sup_total_addr;
	}


	public void setSup_total_addr(String sup_total_addr) {
		this.sup_total_addr = sup_total_addr;
	}


	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", user_password=" + user_password + ", emp_no=" + emp_no + ", emp_name="
				+ emp_name + ", emp_job=" + emp_job + ", emp_id=" + emp_id + ", emp_password=" + emp_password
				+ ", emp_phone=" + emp_phone + ", emp_email=" + emp_email + ", sup_no=" + sup_no + ", sup_name="
				+ sup_name + ", sup_email=" + sup_email + ", sup_phone=" + sup_phone + ", sup_addr1=" + sup_addr1
				+ ", sup_addr2=" + sup_addr2 + ", sup_category=" + sup_category + ", sup_ceo_name=" + sup_ceo_name
				+ ", sup_reg_no=" + sup_reg_no + ", sup_cip=" + sup_cip + ", sup_cip_phone=" + sup_cip_phone
				+ ", sup_cip_email=" + sup_cip_email + ", sup_id=" + sup_id + ", sup_password=" + sup_password
				+ ", sup_etc=" + sup_etc + ", sup_total_addr=" + sup_total_addr + "]";
	}


	
}
