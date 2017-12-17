package com.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the car_series database table.
 * 
 */
@Entity
@Table(name="car_series")
@NamedQuery(name="CarSery.findAll", query="SELECT c FROM CarSery c")
public class CarSery implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="serie_id")
	private String serieId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date createdDate;

	@Column(name="created_user")
	private String createdUser;

	@Column(name="serie_title")
	private String serieTitle;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_date")
	private Date updatedDate;

	@Column(name="updated_user")
	private String updatedUser;

	public CarSery() {
	}

	public String getSerieId() {
		return this.serieId;
	}

	public void setSerieId(String serieId) {
		this.serieId = serieId;
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

}