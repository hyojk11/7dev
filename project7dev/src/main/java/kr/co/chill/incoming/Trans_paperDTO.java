package kr.co.chill.incoming;

public class Trans_paperDTO {
		
		private int trans_paper_no;
		private int trans_paper_material_cnt;
		private String trans_paper_reg_date;
		private int supplier_sup_no;
		private int material_material_no;
		private int employee_emp_no;
		
		// 초기화
		public Trans_paperDTO() {}

		public Trans_paperDTO(int trans_paper_no, int trans_paper_material_cnt, String trans_paper_reg_date,
				int supplier_sup_no, int material_material_no, int employee_emp_no) {
			super();
			this.trans_paper_no = trans_paper_no;
			this.trans_paper_material_cnt = trans_paper_material_cnt;
			this.trans_paper_reg_date = trans_paper_reg_date;
			this.supplier_sup_no = supplier_sup_no;
			this.material_material_no = material_material_no;
			this.employee_emp_no = employee_emp_no;
		}
		
		
		public int getTrans_paper_no() {
			return trans_paper_no;
		}

		public void setTrans_paper_no(int trans_paper_no) {
			this.trans_paper_no = trans_paper_no;
		}

		public int getTrans_paper_material_cnt() {
			return trans_paper_material_cnt;
		}

		public void setTrans_paper_material_cnt(int trans_paper_material_cnt) {
			this.trans_paper_material_cnt = trans_paper_material_cnt;
		}

		public String getTrans_paper_reg_date() {
			return trans_paper_reg_date;
		}

		public void setTrans_paper_reg_date(String trans_paper_reg_date) {
			this.trans_paper_reg_date = trans_paper_reg_date;
		}

		public int getSupplier_sup_no() {
			return supplier_sup_no;
		}

		public void setSupplier_sup_no(int supplier_sup_no) {
			this.supplier_sup_no = supplier_sup_no;
		}

		public int getMaterial_material_no() {
			return material_material_no;
		}

		public void setMaterial_material_no(int material_material_no) {
			this.material_material_no = material_material_no;
		}

		public int getEmployee_emp_no() {
			return employee_emp_no;
		}

		public void setEmployee_emp_no(int employee_emp_no) {
			this.employee_emp_no = employee_emp_no;
		}

		
		@Override
		public String toString() {
			return "Trans_paperDTO [trans_paper_no=" + trans_paper_no + ", trans_paper_material_cnt="
					+ trans_paper_material_cnt + ", trans_paper_reg_date=" + trans_paper_reg_date + ", supplier_sup_no="
					+ supplier_sup_no + ", material_material_no=" + material_material_no + ", employee_emp_no="
					+ employee_emp_no + "]";
		}

}
