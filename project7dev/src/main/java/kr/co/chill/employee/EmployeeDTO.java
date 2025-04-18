package kr.co.chill.employee;

public class EmployeeDTO {
	private int emp_no;
	private String emp_name;
	private String emp_job;
	private String emp_id;
	private String emp_password;
	private String emp_phone;
	private String emp_email;
	
	public EmployeeDTO() {
		super();
	}

	public EmployeeDTO(int emp_no, String emp_name, String emp_job, String emp_id, String emp_password,
			String emp_phone, String emp_email) {
		super();
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_job = emp_job;
		this.emp_id = emp_id;
		this.emp_password = emp_password;
		this.emp_phone = emp_phone;
		this.emp_email = emp_email;
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

	@Override
	public String toString() {
		return "EmployeeDTO [emp_no=" + emp_no + ", emp_name=" + emp_name + ", emp_job=" + emp_job + ", emp_id="
				+ emp_id + ", emp_password=" + emp_password + ", emp_phone=" + emp_phone + ", emp_email=" + emp_email
				+ "]";
	}

	
}
