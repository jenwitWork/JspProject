package com.database.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.database.model.Users;
import com.database.util.DbUtil;

public class UsersDao {
	private Connection connection;

	public UsersDao() {
		connection = DbUtil.getConnection();
	}

	public List<Users> getAll() {
		List<Users> users = new ArrayList<Users>();
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("select * from users;");
			while (rs.next()) {
				Users user = new Users();
				user.setUser_id(rs.getString("user_id"));
				user.setUser_code(rs.getString("user_code"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setTitle_id(rs.getString("title_id"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setAddress(rs.getString("address"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setRole(rs.getString("role"));
				user.setFaculty_id(rs.getString("faculty_id"));
				user.setDepartment_id(rs.getString("department_id"));
				users.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return users;
	}

	public Users find(int id) {
		Users user = new Users();
		try {
			Statement st = connection.createStatement();
			String sql = "select * from users where user_id=" + id;
			st.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}

	public void add(Users user) {

		try {

			Statement st = connection.createStatement();
			String sql = "insert into users (user_code, username, password, title_id, first_name, last_name, address, phone, email, role, faculty_id, department_id, lasr_update) "
					+ " value ('" + user.getUser_code() + "','" + user.getUsername() + "','" + user.getPassword()
					+ "','" + user.getTitle_id() + "','" + user.getFirst_name() + "','" + user.getLast_name() + "','"
					+ user.getAddress() + "','" + user.getPhone() + "','" + user.getEmail() + "','" + user.getRole()
					+ "','" + user.getFaculty_id() + "','" + user.getDepartment_id() + "','" + user.getLast_update()
					+ "')";
			st.executeQuery(sql);
		} catch (Exception e) {

		}

	}

}
