package com.cagnosolutions.modules.crm.document;


import org.joda.time.DateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.HashMap;

@Entity
public class Document {

	@Id
	@GeneratedValue
	private int id;

	private String name;

	@Column(columnDefinition = "LONGBLOB")
	private DateTime completed;
	private int fk;

	@Column(columnDefinition = "LONGBLOB")
	private HashMap<String,String> data;

	public Document() {}

	public Document(int id, String name, DateTime completed, int fk, HashMap<String, String> data) {
		this.id = id;
		this.name = name;
		this.completed = completed;
		this.fk = fk;
		this.data = data;
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

	public DateTime getCompleted() {
		return completed;
	}

	public void setCompleted(DateTime completed) {
		this.completed = completed;
	}

	public int getFk() {
		return fk;
	}

	public void setFk(int fk) {
		this.fk = fk;
	}

	public HashMap<String, String> getData() {
		return data;
	}

	public void setData(HashMap<String, String> data) {
		this.data = data;
	}
}
