package com.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the document database table.
 * 
 */
@Entity
@NamedQuery(name="Document.findAll", query="SELECT d FROM Document d")
public class Document implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="doc_no")
	private String docNo;

	@Column(name="branch_id")
	private String branchId;

	@Column(name="case_name_en")
	private String caseNameEn;

	@Column(name="case_name_th")
	private String caseNameTh;

	@Column(name="cm_id")
	private String cmId;

	@Column(name="cm_name")
	private String cmName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date createdDate;

	@Column(name="created_user")
	private String createdUser;

	@Column(name="its_notwork")
	private int itsNotwork;

	@Column(name="its_work")
	private int itsWork;

	@Column(name="pb_name")
	private String pbName;

	@Column(name="pb_type")
	private String pbType;

	@Column(name="serie_id")
	private String serieId;

	@Column(name="serie_title")
	private String serieTitle;

	private String status;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_date")
	private Date updatedDate;

	@Column(name="updated_user")
	private String updatedUser;

	@Column(name="view_count")
	private int viewCount;

	public Document() {
	}

	public String getDocNo() {
		return this.docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getBranchId() {
		return this.branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getCaseNameEn() {
		return this.caseNameEn;
	}

	public void setCaseNameEn(String caseNameEn) {
		this.caseNameEn = caseNameEn;
	}

	public String getCaseNameTh() {
		return this.caseNameTh;
	}

	public void setCaseNameTh(String caseNameTh) {
		this.caseNameTh = caseNameTh;
	}

	public String getCmId() {
		return this.cmId;
	}

	public void setCmId(String cmId) {
		this.cmId = cmId;
	}

	public String getCmName() {
		return this.cmName;
	}

	public void setCmName(String cmName) {
		this.cmName = cmName;
	}

	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedUser() {
		return this.createdUser;
	}

	public void setCreatedUser(String createdUser) {
		this.createdUser = createdUser;
	}

	public int getItsNotwork() {
		return this.itsNotwork;
	}

	public void setItsNotwork(int itsNotwork) {
		this.itsNotwork = itsNotwork;
	}

	public int getItsWork() {
		return this.itsWork;
	}

	public void setItsWork(int itsWork) {
		this.itsWork = itsWork;
	}

	public String getPbName() {
		return this.pbName;
	}

	public void setPbName(String pbName) {
		this.pbName = pbName;
	}

	public String getPbType() {
		return this.pbType;
	}

	public void setPbType(String pbType) {
		this.pbType = pbType;
	}

	public String getSerieId() {
		return this.serieId;
	}

	public void setSerieId(String serieId) {
		this.serieId = serieId;
	}

	public String getSerieTitle() {
		return this.serieTitle;
	}

	public void setSerieTitle(String serieTitle) {
		this.serieTitle = serieTitle;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdatedDate() {
		return this.updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getUpdatedUser() {
		return this.updatedUser;
	}

	public void setUpdatedUser(String updatedUser) {
		this.updatedUser = updatedUser;
	}

	public int getViewCount() {
		return this.viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	public void update(Document obj) {
		setBranchId(obj.getBranchId().trim());
		setCaseNameEn(obj.getCaseNameEn().trim());
		setCaseNameTh(obj.getCaseNameTh().trim());
		setCmId(obj.getCmId().trim());
		setCmName(obj.getCmName().trim());
		setPbName(obj.getPbName().trim());
		setPbType(obj.getPbType().trim());
		setSerieId(obj.getSerieId().trim());
		setSerieTitle(obj.getSerieTitle().trim());
		setUpdatedDate(obj.getUpdatedDate());
		setUpdatedUser(obj.getUpdatedUser().trim());
		setStatus(obj.getStatus().trim());
	}

}