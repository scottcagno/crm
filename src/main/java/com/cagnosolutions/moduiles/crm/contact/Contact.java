package com.cagnosolutions.moduiles.crm.contact;

import com.cagnosolutions.moduiles.crm.address.Address;
import com.cagnosolutions.moduiles.crm.company.Company;

import javax.persistence.*;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
public class Contact {

	@Id
	@GeneratedValue
	int id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "company_fk", nullable = false)
	private Company company;

	private String firstName;
	private String lastName;
	private String email;
	private String phone;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "address_fk", nullable = false)
	private Address address;

	private String description;

	public Contact() {}

	public Contact(int id, Company company, String firstName, String lastName, String email, String phone, Address address, String description) {
		this.id = id;
		this.company = company;

		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String toString() {
		return "Contact{" +
				"id=" + id +
				", company=" + company +
				", firstName='" + firstName + '\'' +
				", lastName='" + lastName + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", address=" + address +
				", description='" + description + '\'' +
				'}';
	}
}
