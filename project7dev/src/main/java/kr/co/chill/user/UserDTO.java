package kr.co.chill.user;

public class UserDTO {

	private String user_id;
	private String user_password;
	private int emp_no;
	private int sup_no;
	
	
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


	public int getSup_no() {
		return sup_no;
	}


	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}


	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", user_password=" + user_password + ", emp_no=" + emp_no + ", sup_no="
				+ sup_no + "]";
	}

	
	
}
