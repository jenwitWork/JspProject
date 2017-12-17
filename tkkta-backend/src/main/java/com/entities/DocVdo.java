package com.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the doc_vdo database table.
 * 
 */
@Entity
@Table(name="doc_vdo")
@NamedQuery(name="DocVdo.findAll", query="SELECT d FROM DocVdo d")
public class DocVdo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="video_path")
	private String videoPath;

	@Column(name="doc_no")
	private String docNo;

	public DocVdo() {
	}

	public String getVideoPath() {
		return this.videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public String getDocNo() {
		return this.docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

}