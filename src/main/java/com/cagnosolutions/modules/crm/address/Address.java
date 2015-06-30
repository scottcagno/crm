package com.cagnosolutions.modules.crm.address;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
public class Address {

	@Id
	@GeneratedValue
	private int id;

	private String street;
	private String city;
	private String state;
	private String zip;
	private int type;

	public Address(){}

	public Address(int id, String street, String city, String state, String zip, int type) {
		this.id = id;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String toString() {
		return "{" +
				"id:" + id +
				", street: '" + street + '\'' +
				", city: '" + city + '\'' +
				", state: '" + state + '\'' +
				", zip: '" + zip + '\'' +
				", type: " + type +
				'}';
	}
}
