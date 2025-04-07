package kr.co.chill.material;

public class MaterialDTO {
	private String materialName;		//부품명
	private String materialRawMaterial;	//원자재
	private String materialCode;		//부품코드
	private String materialDescription;	//규격
	private String materialUnit;		//단위(mm,ml등)
	private String materialFile;		//세부제작사항
	
	public MaterialDTO(String materialName, String materialRawMaterial, String materialCode, String materialDescription,
			String materialUnit, String materialFile) {
		super();
		this.materialName = materialName;
		this.materialRawMaterial = materialRawMaterial;
		this.materialCode = materialCode;
		this.materialDescription = materialDescription;
		this.materialUnit = materialUnit;
		this.materialFile = materialFile;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public String getMaterialRawMaterial() {
		return materialRawMaterial;
	}

	public void setMaterialRawMaterial(String materialRawMaterial) {
		this.materialRawMaterial = materialRawMaterial;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public String getMaterialDescription() {
		return materialDescription;
	}

	public void setMaterialDescription(String materialDescription) {
		this.materialDescription = materialDescription;
	}

	public String getMaterialUnit() {
		return materialUnit;
	}

	public void setMaterialUnit(String materialUnit) {
		this.materialUnit = materialUnit;
	}

	public String getMaterialFile() {
		return materialFile;
	}

	public void setMaterialFile(String materialFile) {
		this.materialFile = materialFile;
	}

	@Override
	public String toString() {
		return "MaterialDTO [materialName=" + materialName + ", materialRawMaterial=" + materialRawMaterial
				+ ", materialCode=" + materialCode + ", materialDescription=" + materialDescription + ", materialUnit="
				+ materialUnit + ", materialFile=" + materialFile + "]";
	}
	
}
