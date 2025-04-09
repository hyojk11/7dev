package kr.co.chill.product;

public class ProductDTO {
	private String productName;		//제품명	
	private String productCode;		//제품코드
	private int eop;				//판매상태
	
	public ProductDTO(String productName, String productCode, int eop) {
		super();
		this.productName = productName;
		this.productCode = productCode;
		this.eop = eop;
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

	public int getEop() {
		return eop;
	}

	public void setEop(int eop) {
		this.eop = eop;
	}

	@Override
	public String toString() {
		return "ProductDTO [productName=" + productName + ", productCode=" + productCode + ", eop=" + eop + "]";
	}
	
}
