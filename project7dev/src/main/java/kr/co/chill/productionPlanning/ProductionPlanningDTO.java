package kr.co.chill.productionPlanning;

public class ProductionPlanningDTO {

	//production_planning table
	private int prpl_no;
	private String prpl_code;
	private String prpl_line;		//우리공장 생산라인
	private String prpl_plant;		//우리공장(kr,cn)
	private int product_cnt;		//출고계획수량 - 제품재고수량 = 생산계획수량
	private String prpl_due_date;	//제품납기일(이날까지 완성되어 출고되어야함)
	private int prpl_leadtime;		//제품 리드타임(일수. 조립소요기간)
	private String prpl_etc;
	
	private String plan_cnt;		// ** 출고계획수량(고객사 요청)별칭
	private String reg_date;		// ** 작성일 별칭(코드메이커용)
	private String prpl_due_date_only;	//** 년월일만 나오는 제품납기일 별칭

	//product table
	private int product_no;			//제품정보 로드용(제품명, 제품코드)
	private String product_name;		//제품명(화면출력용)
	private String product_code;		//제품코드(화면 입/출력용)
	private int eop;
	
	//product_storage table
	private int pstorage_no;			//제품창고 로드용(창고재고수량)
	private int pstorage_stock;		//창고재고수량(화면출력/연산용)
	private String pstorage_code;	//창고코드
	
	//employee table
	private int emp_no;				//담당자정보 로드용(직원명, 직원연락처, 직원이메일)
	private String emp_name;			//직원명
	private String emp_phone;		//직원연락처
	private String emp_email;		//직원이메일
	
	public ProductionPlanningDTO() {
		super();
	}

	public ProductionPlanningDTO(int prpl_no, String prpl_code, String prpl_line, String prpl_plant, int product_cnt,
			String prpl_due_date, int prpl_leadtime, String prpl_etc, String plan_cnt, String reg_date,
			String prpl_due_date_only, int product_no, String product_name, String product_code, int eop,
			int pstorage_no, int pstorage_stock, String pstorage_code, int emp_no, String emp_name, String emp_phone,
			String emp_email) {
		super();
		this.prpl_no = prpl_no;
		this.prpl_code = prpl_code;
		this.prpl_line = prpl_line;
		this.prpl_plant = prpl_plant;
		this.product_cnt = product_cnt;
		this.prpl_due_date = prpl_due_date;
		this.prpl_leadtime = prpl_leadtime;
		this.prpl_etc = prpl_etc;
		this.plan_cnt = plan_cnt;
		this.reg_date = reg_date;
		this.prpl_due_date_only = prpl_due_date_only;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_code = product_code;
		this.eop = eop;
		this.pstorage_no = pstorage_no;
		this.pstorage_stock = pstorage_stock;
		this.pstorage_code = pstorage_code;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_phone = emp_phone;
		this.emp_email = emp_email;
	}

	public int getPrpl_no() {
		return prpl_no;
	}

	public void setPrpl_no(int prpl_no) {
		this.prpl_no = prpl_no;
	}

	public String getPrpl_code() {
		return prpl_code;
	}

	public void setPrpl_code(String prpl_code) {
		this.prpl_code = prpl_code;
	}

	public String getPrpl_line() {
		return prpl_line;
	}

	public void setPrpl_line(String prpl_line) {
		this.prpl_line = prpl_line;
	}

	public String getPrpl_plant() {
		return prpl_plant;
	}

	public void setPrpl_plant(String prpl_plant) {
		this.prpl_plant = prpl_plant;
	}

	public int getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}

	public String getPrpl_due_date() {
		return prpl_due_date;
	}

	public void setPrpl_due_date(String prpl_due_date) {
		this.prpl_due_date = prpl_due_date;
	}

	public int getPrpl_leadtime() {
		return prpl_leadtime;
	}

	public void setPrpl_leadtime(int prpl_leadtime) {
		this.prpl_leadtime = prpl_leadtime;
	}

	public String getPrpl_etc() {
		return prpl_etc;
	}

	public void setPrpl_etc(String prpl_etc) {
		this.prpl_etc = prpl_etc;
	}

	public String getPlan_cnt() {
		return plan_cnt;
	}

	public void setPlan_cnt(String plan_cnt) {
		this.plan_cnt = plan_cnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getPrpl_due_date_only() {
		return prpl_due_date_only;
	}

	public void setPrpl_due_date_only(String prpl_due_date_only) {
		this.prpl_due_date_only = prpl_due_date_only;
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

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public int getEop() {
		return eop;
	}

	public void setEop(int eop) {
		this.eop = eop;
	}

	public int getPstorage_no() {
		return pstorage_no;
	}

	public void setPstorage_no(int pstorage_no) {
		this.pstorage_no = pstorage_no;
	}

	public int getPstorage_stock() {
		return pstorage_stock;
	}

	public void setPstorage_stock(int pstorage_stock) {
		this.pstorage_stock = pstorage_stock;
	}

	public String getPstorage_code() {
		return pstorage_code;
	}

	public void setPstorage_code(String pstorage_code) {
		this.pstorage_code = pstorage_code;
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
		return "ProductionPlanningDTO [prpl_no=" + prpl_no + ", prpl_code=" + prpl_code + ", prpl_line=" + prpl_line
				+ ", prpl_plant=" + prpl_plant + ", product_cnt=" + product_cnt + ", prpl_due_date=" + prpl_due_date
				+ ", prpl_leadtime=" + prpl_leadtime + ", prpl_etc=" + prpl_etc + ", plan_cnt=" + plan_cnt
				+ ", reg_date=" + reg_date + ", prpl_due_date_only=" + prpl_due_date_only + ", product_no=" + product_no
				+ ", product_name=" + product_name + ", product_code=" + product_code + ", eop=" + eop
				+ ", pstorage_no=" + pstorage_no + ", pstorage_stock=" + pstorage_stock + ", pstorage_code="
				+ pstorage_code + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", emp_phone=" + emp_phone
				+ ", emp_email=" + emp_email + "]";
	}

}
