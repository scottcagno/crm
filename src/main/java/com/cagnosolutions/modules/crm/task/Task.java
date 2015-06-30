package com.cagnosolutions.modules.crm.task;

import com.cagnosolutions.modules.crm.contact.Contact;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
public class Task {

	@Id
	@GeneratedValue
	private int id;

	private String name;
	private Date startDate;
	private Date endDate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contact_fk", nullable = false)
	private Contact contact;

	private int priority;
	private int status;
	private String description;

	private short sendEmail;
	private short sendText;
	private short repeate;
	private int repeatInterval;

	private String color;

	public Task() {}

	public Task(int id, String name, Date startDate, Contact contact, int priority, int status, String description,
						short sendEmail, short sendText, short repeate, int repeatInterval) {
		this.id = id;
		this.name = name;
		this.startDate = startDate;
		this.contact = contact;
		this.priority = priority;
		this.status = status;
		this.description = description;
		this.sendEmail = sendEmail;
		this.sendText = sendText;
		this.repeate = repeate;
		this.repeatInterval = repeatInterval;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public short getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(short sendEmail) {
		this.sendEmail = sendEmail;
	}

	public short getSendText() {
		return sendText;
	}

	public void setSendText(short sendText) {
		this.sendText = sendText;
	}

	public short getRepeate() {
		return repeate;
	}

	public void setRepeate(short repeate) {
		this.repeate = repeate;
	}

	public int getRepeatInterval() {
		return repeatInterval;
	}

	public void setRepeatInterval(int repeatInterval) {
		this.repeatInterval = repeatInterval;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String toString() {
		return "{" +
				"id:" + id +
				", title: '" + name + '\'' +
				", start: " + "new Date('" + startDate + " EDT')" +
				", contact: " + contact +
				", priority: " + priority +
				", status: " + status +
				", description: '" + description + '\'' +
				", sendEmail: " + sendEmail +
				", sendText: " + sendText +
				", repeat: " + repeate +
				", repeatInterval: " + repeatInterval +
				", color: '" + color + '\'' +
				'}';
	}
}
