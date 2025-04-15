package com.app.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.demo.model.User;
import com.app.demo.repository.UserRepo;

@Service
public class UserServices {
	
	@Autowired
	private UserRepo userrepo;

	public UserRepo getUserrepo() {
		return userrepo;
	}

	public void setUserrepo(UserRepo userrepo) {
		this.userrepo = userrepo;
	}
	
	public void save(User user) {
		System.out.println("saving...");
		userrepo.save(user);
	}

	public List<User> findAll() {
		return userrepo.findAll();
	}

	public void deleteUser(int id) {
		System.out.println("deleting....");
		userrepo.deleteById(id);
	}

	public User findById(int id) {
		return userrepo.findById(id).orElse(null);
	}
	
	public void updateUserDetails(String email, String firstName, String lastName, String gender, String contactno, String address, String role, int id) {


		userrepo.updateUser(email, firstName, lastName, gender, contactno, address, role, id);
	}
	
	public void updateUserProfile(String email, String firstName, String lastName, String gender, String contactno, String address, String role, String password, String cpassword, int id) {
		userrepo.updateUserpro(email, firstName, lastName, gender, contactno, address, role, password, cpassword, id);
	}

	public long userCount() {
		return userrepo.countByRole("USER");
	}

	public User findByEmail(String email) {
		return userrepo.findByEmail(email);
	}

	public List<User> findBykey(String searchkey) {
		return userrepo.findbykey(searchkey);
	}


}
