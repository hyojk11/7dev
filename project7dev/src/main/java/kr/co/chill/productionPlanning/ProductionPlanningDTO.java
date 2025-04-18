package kr.co.chill.productionPlanning;

public class ProductionPlanningDTO {

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
	
	public ProductionPlanningDTO() {
		super();
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
	}

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
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	@Override
	public String toString() {
		return "ProductionPlanningDTO [prplNo=" + prplNo + ", prplPlant=" + prplPlant + ", prplLine=" + prplLine
				+ ", prplDueDate=" + prplDueDate + ", prplLeadtime=" + prplLeadtime + ", prplEtc=" + prplEtc
				+ ", productCnt=" + productCnt + ", pstorageNo=" + pstorageNo + ", pstorageStock=" + pstorageStock
				+ ", productNo=" + productNo + ", productName=" + productName + ", productCode=" + productCode
				+ ", empNo=" + empNo + ", empName=" + empName + ", empPhone=" + empPhone + ", empEmail=" + empEmail
				+ "]";
	}
	
}
