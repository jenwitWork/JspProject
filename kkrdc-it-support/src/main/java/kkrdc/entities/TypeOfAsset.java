package kkrdc.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the type_of_asset database table.
 * 
 */
@Entity
@Table(name="type_of_asset")
@NamedQuery(name="TypeOfAsset.findAll", query="SELECT t FROM TypeOfAsset t")
public class TypeOfAsset implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="asset_type")
	private String assetType;

	@Column(name="asset_type_desc")
	private String assetTypeDesc;

	@Temporal(TemporalType.DATE)
	@Column(name="created_date")
	private Date createdDate;

	@Column(name="created_user")
	private String createdUser;

	@Temporal(TemporalType.DATE)
	@Column(name="updated_date")
	private Date updatedDate;

	@Column(name="updated_user")
	private String updatedUser;

	public TypeOfAsset() {
	}

	public String getAssetType() {
		return this.assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public String getAssetTypeDesc() {
		return this.assetTypeDesc;
	}

	public void setAssetTypeDesc(String assetTypeDesc) {
		this.assetTypeDesc = assetTypeDesc;
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