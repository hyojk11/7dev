package kr.co.chill.productionPlanning;

public class ProductionPlanningDTO {

<<<<<<< HEAD
	
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
	
	//employee table
	private int emp_no;				//담당자정보 로드용(직원명, 직원연락처, 직원이메일)
	private String emp_name;			//직원명
	private String emp_phone;		//직원연락처
	private String emp_email;		//직원이메일
	
	
=======
	private int prplNo;
	private String prplPlant;		//우리공장(kr,cn)
	private String prplLine;		//우리공장 생산라인
	private String prplDueDate;		//제품납기일(이날까지 완성되어 출고되어야함)
	private int prplLeadtime;		//제품 리드타임
	private String prplEtc;			//기타사항
	private int productCnt;			//생산계획수량(총 소요량-재고량)
	
	private int pstorageNo;			//제품창고 로드용(창고재고수량)
	private int pstorageStock;		//창고재고수량(화면출력/연산용)
	
	private int productNo;			//제품정보 로드용(제품명, 제품코드)
	private String productName;		//제품명(화면출력용)
	private String productCode;		//제품코드(화면 입/출력용)
	
	private int empNo;				//담당자정보 로드용(직원명, 직원연락처, 직원이메일)
	private String empName;			//직원명
	private String empPhone;		//직원연락처
	private String empEmail;		//직원이메일
>>>>>>> branch 'main' of https://github.com/Simwons/7dev.git
	
	public ProductionPlanningDTO() {
		super();
<<<<<<< HEAD
=======
	}

	public ProductionPlanningDTO(int prplNo, String prplPlant, String prplLine, String prplDueDate, int prplLeadtime,
			String prplEtc, int productCnt, int pstorageNo, int pstorageStock, int productNo, String productName,
			String productCode, int empNo, String empName, String empPhone, String empEmail) {
		super();
		this.prplNo = prplNo;
		this.prplPlant = prplPlant;
		this.prplLine = prplLine;
		this.prplDueDate = prplDueDate;
		this.prplLeadtime = prplLeadtime;
		this.prplEtc = prplEtc;
		this.productCnt = productCnt;
		this.pstorageNo = pstorageNo;
		this.pstorageStock = pstorageStock;
		this.productNo = productNo;
		this.productName = productName;
		this.productCode = productCode;
		this.empNo = empNo;
		this.empName = empName;
		this.empPhone = empPhone;
		this.empEmail = empEmail;
	}

	public int getPrplNo() {
		return prplNo;
	}

	public void setPrplNo(int prplNo) {
		this.prplNo = prplNo;
	}

	public String getPrplPlant() {
		return prplPlant;
	}

	public void setPrplPlant(String prplPlant) {
		this.prplPlant = prplPlant;
	}

	public String getPrplLine() {
		return prplLine;
	}

	public void setPrplLine(String prplLine) {
		this.prplLine = prplLine;
	}

	public String getPrplDueDate() {
		return prplDueDate;
	}

	public void setPrplDueDate(String prplDueDate) {
		this.prplDueDate = prplDueDate;
	}

	public int getPrplLeadtime() {
		return prplLeadtime;
	}

	public void setPrplLeadtime(int prplLeadtime) {
		this.prplLeadtime = prplLeadtime;
	}

	public String getPrplEtc() {
		return prplEtc;
	}

	public void setPrplEtc(String prplEtc) {
		this.prplEtc = prplEtc;
>>>>>>> branch 'main' of https://github.com/Simwons/7dev.git
	}

<<<<<<< HEAD


	public ProductionPlanningDTO(int prpl_no, String prpl_code, String prpl_line, String prpl_plant, int product_cnt,
			String prpl_due_date, int prpl_leadtime, String prpl_etc, String plan_cnt, String reg_date,
			String prpl_due_date_only, int product_no, String product_name, String product_code, int eop,
			int pstorage_no, int pstorage_stock, int emp_no, String emp_name, String emp_phone, String emp_email) {
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
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_phone = emp_phone;
		this.emp_email = emp_email;
=======
	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	public int getPstorageNo() {
		return pstorageNo;
	}

	public void setPstorageNo(int pstorageNo) {
		this.pstorageNo = pstorageNo;
	}

	public int getPstorageStock() {
		return pstorageStock;
	}

	public void setPstorageStock(int pstorageStock) {
		this.pstorageStock = pstorageStock;
	}

	public int getProductNo() {
		return productNo;
>>>>>>> branch 'main' of https://github.com/Simwons/7dev.git
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

<<<<<<< HEAD


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
=======
	public int getEmpNo() {
		return empNo;
>>>>>>> branch 'main' of https://github.com/Simwons/7dev.git
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

<<<<<<< HEAD


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



=======
>>>>>>> branch 'main' of https://github.com/Simwons/7dev.git
	@Override
	public String toString() {
<<<<<<< HEAD
		return "ProductionPlanningDTO [prpl_no=" + prpl_no + ", prpl_code=" + prpl_code + ", prpl_line=" + prpl_line
				+ ", prpl_plant=" + prpl_plant + ", product_cnt=" + product_cnt + ", prpl_due_date=" + prpl_due_date
				+ ", prpl_leadtime=" + prpl_leadtime + ", prpl_etc=" + prpl_etc + ", plan_cnt=" + plan_cnt
				+ ", reg_date=" + reg_date + ", prpl_due_date_only=" + prpl_due_date_only + ", product_no=" + product_no
				+ ", product_name=" + product_name + ", product_code=" + product_code + ", eop=" + eop
				+ ", pstorage_no=" + pstorage_no + ", pstorage_stock=" + pstorage_stock + ", emp_no=" + emp_no
				+ ", emp_name=" + emp_name + ", emp_phone=" + emp_phone + ", emp_email=" + emp_email + "]";
=======
		return "ProductionPlanningDTO [prplNo=" + prplNo + ", prplPlant=" + prplPlant + ", prplLine=" + prplLine
				+ ", prplDueDate=" + prplDueDate + ", prplLeadtime=" + prplLeadtime + ", prplEtc=" + prplEtc
				+ ", productCnt=" + productCnt + ", pstorageNo=" + pstorageNo + ", pstorageStock=" + pstorageStock
				+ ", productNo=" + productNo + ", productName=" + productName + ", productCode=" + productCode
				+ ", empNo=" + empNo + ", empName=" + empName + ", empPhone=" + empPhone + ", empEmail=" + empEmail
				+ "]";
>>>>>>> branch 'main' of https://github.com/Simwons/7dev.git
	}
<<<<<<< HEAD



=======
	
>>>>>>> branch 'main' of https://github.com/Simwons/7dev.git
}
