package com.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;

/**
 * The persistent class for the car_model database table.
 * 
 */
@Entity
@Table(name = "car_model")
@NamedQuery(name = "CarModel.findAll", query = "SELECT c FROM CarModel c")
public class CarModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "cm_id")
	private String cmId;

	@Column(name = "cm_name")
	private String cmName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date")
	private Date createdDate;

	@Column(name = "created_user")
	private String createdUser;

	@Column(name = "serie_id")
	private String serieId;

	@Column(name = "serie_title")
	private String serieTitle;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_date")
	private Date updatedDate;

	@Column(name = "updated_user")
	private String updatedUser;

	public CarModel() {
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

	public CarModel update(CarModel car_model) {
		CarModel cm = new CarModel();
		cm.setCmId(car_model.getCmId());
		cm.setCmName(car_model.getCmName());
		cm.setSerieId(car_model.getSerieId());
		cm.setSerieTitle(car_model.getSerieTitle());
		cm.setCreatedDate(car_model.getCreatedDate());
		cm.setCreatedUser(car_model.getCreatedUser());
		cm.setUpdatedDate(car_model.getUpdatedDate());
		cm.setUpdatedUser(car_model.getUpdatedUser());
		return cm;
	}

}