package com.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the doc_file database table.
 * 
 */
@Entity
@Table(name="doc_file")
@NamedQuery(name="DocFile.findAll", query="SELECT d FROM DocFile d")
public class DocFile implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="pdf_path")
	private String pdfPath;

	@Column(name="doc_no")
	private String docNo;

	@Column(name="pdf_name")
	private String pdfName;

	public DocFile() {
	}

	public String getPdfPath() {
		return this.pdfPath;
	}

	public void setPdfPath(String pdfPath) {
		this.pdfPath = pdfPath;
	}

	public String getDocNo() {
		return this.docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getPdfName() {
		return this.pdfName;
	}

	public void setPdfName(String pdfName) {
		this.pdfName = pdfName;
	}

}