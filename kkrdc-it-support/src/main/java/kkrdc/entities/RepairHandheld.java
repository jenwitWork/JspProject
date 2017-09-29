package kkrdc.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the repair_handheld database table.
 * 
 */
@Entity
@Table(name="repair_handheld")
@NamedQuery(name="RepairHandheld.findAll", query="SELECT r FROM RepairHandheld r")
public class RepairHandheld implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="repair_id")
	private String repairId;

	@Column(name="asset_no_lotus")
	private String assetNoLotus;

	@Column(name="asset_no_spare")
	private String assetNoSpare;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date createdDate;

	@Column(name="created_user")
	private String createdUser;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="finish_date")
	private Date finishDate;

	@Column(name="finish_user")
	private String finishUser;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="repair_date")
	private Date repairDate;

	@Column(name="repair_user")
	private String repairUser;

	@Column(name="serial_lotus")
	private String serialLotus;

	@Column(name="serial_spare")
	private String serialSpare;

	private String status;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_date")
	private Date updatedDate;

	@Column(name="updated_user")
	private String updatedUser;

	public RepairHandheld() {
	}

	public String getRepairId() {
		return this.repairId;
	}

	public void setRepairId(String repairId) {
		this.repairId = repairId;
	}

	public String getAssetNoLotus() {
		return this.assetNoLotus;
	}

	public void setAssetNoLotus(String assetNoLotus) {
		this.assetNoLotus = assetNoLotus;
	}

	public String getAssetNoSpare() {
		return this.assetNoSpare;
	}

	public void setAssetNoSpare(String assetNoSpare) {
		this.assetNoSpare = assetNoSpare;
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

	public Date getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public String getFinishUser() {
		return this.finishUser;
	}

	public void setFinishUser(String finishUser) {
		this.finishUser = finishUser;
	}

	public Date getRepairDate() {
		return this.repairDate;
	}

	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}

	public String getRepairUser() {
		return this.repairUser;
	}

	public void setRepairUser(String repairUser) {
		this.repairUser = repairUser;
	}

	public String getSerialLotus() {
		return this.serialLotus;
	}

	public void setSerialLotus(String serialLotus) {
		this.serialLotus = serialLotus;
	}

	public String getSerialSpare() {
		return this.serialSpare;
	}

	public void setSerialSpare(String serialSpare) {
		this.serialSpare = serialSpare;
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