package kr.co.chill.procurement;

import java.util.List;

public class MppFormDTO {
	private List<ProcurementDTO> mppList;

	public MppFormDTO() {
		super();
	}

	public MppFormDTO(List<ProcurementDTO> mppList) {
		super();
		this.mppList = mppList;
	}

	public List<ProcurementDTO> getMppList() {
		return mppList;
	}

	public void setMppList(List<ProcurementDTO> mppList) {
		this.mppList = mppList;
	}

	@Override
	public String toString() {
		return "MppFormDTO [mppList=" + mppList + "]";
	}
	
}
