package com.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the user_page database table.
 * 
 */
@Entity
@Table(name="user_page")
@NamedQuery(name="UserPage.findAll", query="SELECT u FROM UserPage u")
public class UserPage implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Column(name="branch_id")
	private String branchId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date createdDate;

	@Column(name="created_user")
	private String createdUser;

	@Column(name="flag_add")
	private String flagAdd;

	@Column(name="flag_approve")
	private String flagApprove;

	@Column(name="flag_delete")
	private String flagDelete;

	@Column(name="flag_edit")
	private String flagEdit;

	@Column(name="page_name")
	private String pageName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_date")
	private Date updatedDate;

	@Column(name="updated_user")
	private String updatedUser;

	private String username;

	public UserPage() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBranchId() {
		return this.branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
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

	public String getFlagAdd() {
		return this.flagAdd;
	}

	public void setFlagAdd(String flagAdd) {
		this.flagAdd = flagAdd;
	}

	public String getFlagApprove() {
		return this.flagApprove;
	}

	public void setFlagApprove(String flagApprove) {
		this.flagApprove = flagApprove;
	}

	public String getFlagDelete() {
		return this.flagDelete;
	}

	public void setFlagDelete(String flagDelete) {
		this.flagDelete = flagDelete;
	}

	public String getFlagEdit() {
		return this.flagEdit;
	}

	public void setFlagEdit(String flagEdit) {
		this.flagEdit = flagEdit;
	}

	public String getPageName() {
		return this.pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
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

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}