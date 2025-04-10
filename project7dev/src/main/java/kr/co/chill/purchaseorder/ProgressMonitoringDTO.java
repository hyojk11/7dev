package kr.co.chill.purchaseorder;

public class ProgressMonitoringDTO {
	
	//progress_monitoring table
	private int progress_monitoring_no;
	private int progress_monitoring_ver;
	private String progress_monitoring_code;
	private int material_cnt; //차수별 검수된 수량
	private String progress_monitoring_date; //검수날짜
	private String progress_monitoring_etc; //검수별 비고
	
	private int progress_rate; //** 자재별 진척률 별칭
	private int total_progress_rate; //** 총 누적 진척률 별칭
	private String next_progress_date; //** 다음 진척검수일 별칭
	private int total_material_cnt; //** 총 검수된 수량 별칭
	private int rest_progress_cnt; //** 검수할 남은 수량 별칭
	
	//purchase_order table
	private int purc_order_no;
	private String purc_order_code; //시리얼코드
	private String purc_order_reg_date; //발주일
	private String purc_order_dterms; //인도조건
	
	private String end_date; //**납기일 별칭
	
	//supplier table
	private int sup_no;
	private String sup_name;
	private String sup_reg_no; //사업자번호
	private String sup_ceo_name;
	private String sup_phone;
	private String sup_addr1;
	private String sup_addr2; //상세주소
	private String sup_cip; //담당자
	private String sup_cip_phone; //담당자 연락처
	private String sup_cip_email; //담당자 이메일
	
	private String sup_total_addr; //**전체주소 별칭
	
	//company table
	private int comp_no;
	private String comp_name;
	private String comp_ceo_name;
	private String comp_reg_no; //사업자번호
	private String comp_addr1;
	private String comp_addr2; //상세주소
	
	private String comp_total_addr; //**전체주소 별칭

	//contract table
	private int cont_no;
	private int cont_material_cnt; //자재수량
	private String cont_date; //계약일
	
	//employee table
	private int emp_no;
	private String emp_name;
	private String emp_email;
	
	//material_resource_plan table
	private int mrp_no;
	private String mrp_due_date; //자재납기일
	
	//material table
	private int material_no;
	private String material_name;
	private String material_code;
	
	
	
	public ProgressMonitoringDTO() {
		super();
	}



	public ProgressMonitoringDTO(int progress_monitoring_no, int progress_monitoring_ver,
			String progress_monitoring_code, int material_cnt, String progress_monitoring_date,
			String progress_monitoring_etc, int progress_rate, int total_progress_rate, String next_progress_date,
			int total_material_cnt, int rest_progress_cnt, int purc_order_no, String purc_order_code,
			String purc_order_reg_date, String purc_order_dterms, String end_date, int sup_no, String sup_name,
			String sup_reg_no, String sup_ceo_name, String sup_phone, String sup_addr1, String sup_addr2,
			String sup_cip, String sup_cip_phone, String sup_cip_email, String sup_total_addr, int comp_no,
			String comp_name, String comp_ceo_name, String comp_reg_no, String comp_addr1, String comp_addr2,
			String comp_total_addr, int cont_no, int cont_material_cnt, String cont_date, int emp_no, String emp_name,
			String emp_email, int mrp_no, String mrp_due_date, int material_no, String material_name,
			String material_code) {
		super();
		this.progress_monitoring_no = progress_monitoring_no;
		this.progress_monitoring_ver = progress_monitoring_ver;
		this.progress_monitoring_code = progress_monitoring_code;
		this.material_cnt = material_cnt;
		this.progress_monitoring_date = progress_monitoring_date;
		this.progress_monitoring_etc = progress_monitoring_etc;
		this.progress_rate = progress_rate;
		this.total_progress_rate = total_progress_rate;
		this.next_progress_date = next_progress_date;
		this.total_material_cnt = total_material_cnt;
		this.rest_progress_cnt = rest_progress_cnt;
		this.purc_order_no = purc_order_no;
		this.purc_order_code = purc_order_code;
		this.purc_order_reg_date = purc_order_reg_date;
		this.purc_order_dterms = purc_order_dterms;
		this.end_date = end_date;
		this.sup_no = sup_no;
		this.sup_name = sup_name;
		this.sup_reg_no = sup_reg_no;
		this.sup_ceo_name = sup_ceo_name;
		this.sup_phone = sup_phone;
		this.sup_addr1 = sup_addr1;
		this.sup_addr2 = sup_addr2;
		this.sup_cip = sup_cip;
		this.sup_cip_phone = sup_cip_phone;
		this.sup_cip_email = sup_cip_email;
		this.sup_total_addr = sup_total_addr;
		this.comp_no = comp_no;
		this.comp_name = comp_name;
		this.comp_ceo_name = comp_ceo_name;
		this.comp_reg_no = comp_reg_no;
		this.comp_addr1 = comp_addr1;
		this.comp_addr2 = comp_addr2;
		this.comp_total_addr = comp_total_addr;
		this.cont_no = cont_no;
		this.cont_material_cnt = cont_material_cnt;
		this.cont_date = cont_date;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_email = emp_email;
		this.mrp_no = mrp_no;
		this.mrp_due_date = mrp_due_date;
		this.material_no = material_no;
		this.material_name = material_name;
		this.material_code = material_code;
	}



	public int getProgress_monitoring_no() {
		return progress_monitoring_no;
	}



	public void setProgress_monitoring_no(int progress_monitoring_no) {
		this.progress_monitoring_no = progress_monitoring_no;
	}



	public int getProgress_monitoring_ver() {
		return progress_monitoring_ver;
	}



	public void setProgress_monitoring_ver(int progress_monitoring_ver) {
		this.progress_monitoring_ver = progress_monitoring_ver;
	}



	public String getProgress_monitoring_code() {
		return progress_monitoring_code;
	}



	public void setProgress_monitoring_code(String progress_monitoring_code) {
		this.progress_monitoring_code = progress_monitoring_code;
	}



	public int getMaterial_cnt() {
		return material_cnt;
	}



	public void setMaterial_cnt(int material_cnt) {
		this.material_cnt = material_cnt;
	}



	public String getProgress_monitoring_date() {
		return progress_monitoring_date;
	}



	public void setProgress_monitoring_date(String progress_monitoring_date) {
		this.progress_monitoring_date = progress_monitoring_date;
	}



	public String getProgress_monitoring_etc() {
		return progress_monitoring_etc;
	}



	public void setProgress_monitoring_etc(String progress_monitoring_etc) {
		this.progress_monitoring_etc = progress_monitoring_etc;
	}



	public int getProgress_rate() {
		return progress_rate;
	}



	public void setProgress_rate(int progress_rate) {
		this.progress_rate = progress_rate;
	}



	public int getTotal_progress_rate() {
		return total_progress_rate;
	}



	public void setTotal_progress_rate(int total_progress_rate) {
		this.total_progress_rate = total_progress_rate;
	}



	public String getNext_progress_date() {
		return next_progress_date;
	}



	public void setNext_progress_date(String next_progress_date) {
		this.next_progress_date = next_progress_date;
	}



	public int getTotal_material_cnt() {
		return total_material_cnt;
	}



	public void setTotal_material_cnt(int total_material_cnt) {
		this.total_material_cnt = total_material_cnt;
	}



	public int getRest_progress_cnt() {
		return rest_progress_cnt;
	}



	public void setRest_progress_cnt(int rest_progress_cnt) {
		this.rest_progress_cnt = rest_progress_cnt;
	}



	public int getPurc_order_no() {
		return purc_order_no;
	}



	public void setPurc_order_no(int purc_order_no) {
		this.purc_order_no = purc_order_no;
	}



	public String getPurc_order_code() {
		return purc_order_code;
	}



	public void setPurc_order_code(String purc_order_code) {
		this.purc_order_code = purc_order_code;
	}



	public String getPurc_order_reg_date() {
		return purc_order_reg_date;
	}



	public void setPurc_order_reg_date(String purc_order_reg_date) {
		this.purc_order_reg_date = purc_order_reg_date;
	}



	public String getPurc_order_dterms() {
		return purc_order_dterms;
	}



	public void setPurc_order_dterms(String purc_order_dterms) {
		this.purc_order_dterms = purc_order_dterms;
	}



	public String getEnd_date() {
		return end_date;
	}



	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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



	public String getSup_reg_no() {
		return sup_reg_no;
	}



	public void setSup_reg_no(String sup_reg_no) {
		this.sup_reg_no = sup_reg_no;
	}



	public String getSup_ceo_name() {
		return sup_ceo_name;
	}



	public void setSup_ceo_name(String sup_ceo_name) {
		this.sup_ceo_name = sup_ceo_name;
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



	public String getSup_total_addr() {
		return sup_total_addr;
	}



	public void setSup_total_addr(String sup_total_addr) {
		this.sup_total_addr = sup_total_addr;
	}



	public int getComp_no() {
		return comp_no;
	}



	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}



	public String getComp_name() {
		return comp_name;
	}



	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}



	public String getComp_ceo_name() {
		return comp_ceo_name;
	}



	public void setComp_ceo_name(String comp_ceo_name) {
		this.comp_ceo_name = comp_ceo_name;
	}



	public String getComp_reg_no() {
		return comp_reg_no;
	}



	public void setComp_reg_no(String comp_reg_no) {
		this.comp_reg_no = comp_reg_no;
	}



	public String getComp_addr1() {
		return comp_addr1;
	}



	public void setComp_addr1(String comp_addr1) {
		this.comp_addr1 = comp_addr1;
	}



	public String getComp_addr2() {
		return comp_addr2;
	}



	public void setComp_addr2(String comp_addr2) {
		this.comp_addr2 = comp_addr2;
	}



	public String getComp_total_addr() {
		return comp_total_addr;
	}



	public void setComp_total_addr(String comp_total_addr) {
		this.comp_total_addr = comp_total_addr;
	}



	public int getCont_no() {
		return cont_no;
	}



	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}



	public int getCont_material_cnt() {
		return cont_material_cnt;
	}



	public void setCont_material_cnt(int cont_material_cnt) {
		this.cont_material_cnt = cont_material_cnt;
	}



	public String getCont_date() {
		return cont_date;
	}



	public void setCont_date(String cont_date) {
		this.cont_date = cont_date;
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



	public String getEmp_email() {
		return emp_email;
	}



	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}



	public int getMrp_no() {
		return mrp_no;
	}



	public void setMrp_no(int mrp_no) {
		this.mrp_no = mrp_no;
	}



	public String getMrp_due_date() {
		return mrp_due_date;
	}



	public void setMrp_due_date(String mrp_due_date) {
		this.mrp_due_date = mrp_due_date;
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



	@Override
	public String toString() {
		return "ProgressMonitoringDTO [progress_monitoring_no=" + progress_monitoring_no + ", progress_monitoring_ver="
				+ progress_monitoring_ver + ", progress_monitoring_code=" + progress_monitoring_code + ", material_cnt="
				+ material_cnt + ", progress_monitoring_date=" + progress_monitoring_date + ", progress_monitoring_etc="
				+ progress_monitoring_etc + ", progress_rate=" + progress_rate + ", total_progress_rate="
				+ total_progress_rate + ", next_progress_date=" + next_progress_date + ", total_material_cnt="
				+ total_material_cnt + ", rest_progress_cnt=" + rest_progress_cnt + ", purc_order_no=" + purc_order_no
				+ ", purc_order_code=" + purc_order_code + ", purc_order_reg_date=" + purc_order_reg_date
				+ ", purc_order_dterms=" + purc_order_dterms + ", end_date=" + end_date + ", sup_no=" + sup_no
				+ ", sup_name=" + sup_name + ", sup_reg_no=" + sup_reg_no + ", sup_ceo_name=" + sup_ceo_name
				+ ", sup_phone=" + sup_phone + ", sup_addr1=" + sup_addr1 + ", sup_addr2=" + sup_addr2 + ", sup_cip="
				+ sup_cip + ", sup_cip_phone=" + sup_cip_phone + ", sup_cip_email=" + sup_cip_email
				+ ", sup_total_addr=" + sup_total_addr + ", comp_no=" + comp_no + ", comp_name=" + comp_name
				+ ", comp_ceo_name=" + comp_ceo_name + ", comp_reg_no=" + comp_reg_no + ", comp_addr1=" + comp_addr1
				+ ", comp_addr2=" + comp_addr2 + ", comp_total_addr=" + comp_total_addr + ", cont_no=" + cont_no
				+ ", cont_material_cnt=" + cont_material_cnt + ", cont_date=" + cont_date + ", emp_no=" + emp_no
				+ ", emp_name=" + emp_name + ", emp_email=" + emp_email + ", mrp_no=" + mrp_no + ", mrp_due_date="
				+ mrp_due_date + ", material_no=" + material_no + ", material_name=" + material_name
				+ ", material_code=" + material_code + "]";
	}




}
