package hotel.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Users {

	@Id
	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "name")
	private String name;

	@Column(name = "birthday")
	private String birthday;

	@Column(name = "date_created")
	private String dateCreated;

	@Column(name = "date_updated")
	private String dateUpdated;

	@Column(name = "user_created")
	private String userCreated;

	@Column(name = "user_updated")
	private String userUpdated;

/*	public Users(String username, String password, String email, String name, String birthday, String dateCreated,
			String dateUpdated, String userCreated, String userUpdated) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.name = name;
		this.birthday = birthday;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
		this.userCreated = userCreated;
		this.userUpdated = userUpdated;
	}*/

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(String dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public String getUserCreated() {
		return userCreated;
	}

	public void setUserCreated(String userCreated) {
		this.userCreated = userCreated;
	}

	public String getUserUpdated() {
		return userUpdated;
	}

	public void setUserUpdated(String userUpdated) {
		this.userUpdated = userUpdated;
	}

	@Override
	public String toString() {
		return "Users [username=" + username + ", password=" + password + ", email=" + email + ", name=" + name
				+ ", birthday=" + birthday + ", dateCreated=" + dateCreated + ", dateUpdated=" + dateUpdated
				+ ", userCreated=" + userCreated + ", userUpdated=" + userUpdated + "]";
	}

}
