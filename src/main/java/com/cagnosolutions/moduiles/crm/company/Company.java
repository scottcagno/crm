package com.cagnosolutions.moduiles.crm.company;

import com.cagnosolutions.moduiles.crm.address.Address;
import com.sun.org.apache.xpath.internal.operations.String;

import javax.persistence.*;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
public class Company {

	@Id
	@GeneratedValue
	private int id;

	private String name;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "address_fk", nullable = false)
	private Address address;

	private String phone;
	private String fax;
	private String website;
	private String description;

	public Company() {}

	public Company(int id, String name, Address address, String phone, String fax, String website, String description) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.fax = fax;
		this.website = website;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public java.lang.String toString() {
		return "Company{" +
				"id=" + id +
				", name=" + name +
				", address=" + address +
				", phone=" + phone +
				", fax=" + fax +
				", website=" + website +
				", description=" + description +
				'}';
	}
}
