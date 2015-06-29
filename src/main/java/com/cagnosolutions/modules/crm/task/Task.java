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
	private Date date;

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

	public Task() {}

	public Task(int id, String name, Date date, Contact contact, int priority, int status, String description,
						short sendEmail, short sendText, short repeate, int repeatInterval) {
		this.id = id;
		this.name = name;
		this.date = date;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String toString() {
		return "Task{" +
				"id=" + id +
				", name='" + name + '\'' +
				", date=" + date +
				", contact=" + contact +
				", priority=" + priority +
				", status=" + status +
				", description='" + description + '\'' +
				", sendEmail=" + sendEmail +
				", sendText=" + sendText +
				", repeat=" + repeate +
				", repeatInterval=" + repeatInterval +
				'}';
	}
}
