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
	private String startTime = "";
	private String endTime = "";

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contact_fk", nullable = false)
	private Contact contact;

	private int priority; // 0 = low, 1 = medium, 2 = high
	private int status; // 0 = open, 1 = closed
	private String description;

	private short allDay;
	private int reminder;  // 0 = none, 1 = email, 2 = text, 3 = both
	private int repeatInterval; // 0 = none, 1 = weekly, 2 = monthly, 3 = yearly

	private String color;

	public Task() {}

	public Task(int id, String name, Date startDate, Date endDate, String startTime, String endTime, Contact contact,
				int priority, int status, String description, short allDay, int reminder, int repeatInterval, String color) {
		this.id = id;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.contact = contact;
		this.priority = priority;
		this.status = status;
		this.description = description;
		this.allDay = allDay;
		this.reminder = reminder;
		this.repeatInterval = repeatInterval;
		this.color = color;
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

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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

	public short getAllDay() {
		return allDay;
	}

	public void setAllDay(short allDay) {
		this.allDay = allDay;
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

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getReminder() {
		return reminder;
	}

	public void setReminder(int reminder) {
		this.reminder = reminder;
	}

	public String toString() {
		return "{" +
				"id:" + id +
				", title: '" + name + '\'' +
				", start: ' " + startDate + 'T' + startTime + "Z'" +
				", end: ' " + endDate + 'T' + endTime + "Z'" +
				", contact: " + contact +
				", priority: " + priority +
				", status: " + status +
				", description: \"" + description + '"' +
				", repeatInterval: " + repeatInterval +
				", reminder: " + reminder +
				", color: '" + color + '\'' +
				", allDay: " + ((allDay == 1) ? "true" : "false") +
				'}';
	}
}
