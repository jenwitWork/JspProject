package com.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the doc_pic database table.
 * 
 */
@Entity
@Table(name="doc_pic")
@NamedQuery(name="DocPic.findAll", query="SELECT d FROM DocPic d")
public class DocPic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="image_path")
	private String imagePath;

	@Column(name="doc_no")
	private String docNo;

	public DocPic() {
	}

	public String getImagePath() {
		return this.imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDocNo() {
		return this.docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

}