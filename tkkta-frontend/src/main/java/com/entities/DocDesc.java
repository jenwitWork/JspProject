package com.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the doc_desc database table.
 * 
 */
@Entity
@Table(name="doc_desc")
@NamedQuery(name="DocDesc.findAll", query="SELECT d FROM DocDesc d")
public class DocDesc implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="doc_no")
	private String docNo;

	@Lob
	@Column(name="case_desc")
	private String caseDesc;

	public DocDesc() {
	}

	public String getDocNo() {
		return this.docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getCaseDesc() {
		return this.caseDesc;
	}

	public void setCaseDesc(String caseDesc) {
		this.caseDesc = caseDesc;
	}

}