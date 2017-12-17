package com.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the problem_type database table.
 * 
 */
@Entity
@Table(name="problem_type")
@NamedQuery(name="ProblemType.findAll", query="SELECT p FROM ProblemType p")
public class ProblemType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="pb_type")
	private String pbType;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date createdDate;

	@Column(name="created_user")
	private String createdUser;

	@Column(name="pb_name")
	private String pbName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_date")
	private Date updatedDate;

	@Column(name="updated_user")
	private String updatedUser;

	public ProblemType() {
	}

	public String getPbType() {
		return this.pbType;
	}

	public void setPbType(String pbType) {
		this.pbType = pbType;
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

	public String getPbName() {
		return this.pbName;
	}

	public void setPbName(String pbName) {
		this.pbName = pbName;
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