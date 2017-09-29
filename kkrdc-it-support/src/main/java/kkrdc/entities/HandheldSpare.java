package kkrdc.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the handheld_spare database table.
 * 
 */
@Entity
@Table(name="handheld_spare")
@NamedQuery(name="HandheldSpare.findAll", query="SELECT h FROM HandheldSpare h")
public class HandheldSpare implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="serial_no")
	private String serialNo;

	@Column(name="asset_no")
	private String assetNo;

	@Column(name="asset_type")
	private String assetType;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date createdDate;

	@Column(name="created_user")
	private String createdUser;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="input_date")
	private Date inputDate;

	private String model;

	private String remark;

	private String status;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_date")
	private Date updatedDate;

	@Column(name="updated_user")
	private String updatedUser;

	public HandheldSpare() {
	}

	public String getSerialNo() {
		return this.serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public String getAssetNo() {
		return this.assetNo;
	}

	public void setAssetNo(String assetNo) {
		this.assetNo = assetNo;
	}

	public String getAssetType() {
		return this.assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
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

	public Date getInputDate() {
		return this.inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

}