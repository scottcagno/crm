package com.cagnosolutions.modules.crm.task;

import com.cagnosolutions.modules.crm.contact.Contact;
import org.joda.time.DateTime;

import javax.persistence.*;

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

	@Column(columnDefinition = "LONGBLOB")
	private DateTime start;
	@Column(columnDefinition = "LONGBLOB")
	private DateTime end;

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

	public Task(int id, String name, DateTime start, DateTime end, Contact contact, int priority, int status,
				String description, short allDay, int reminder, int repeatInterval, String color) {
		this.id = id;
		this.name = name;
		this.start = start;
		this.end = end;
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

	public int getReminder() {
		return reminder;
	}

	public void setReminder(int reminder) {
		this.reminder = reminder;
	}

	public DateTime getStart() {
		return start;
	}

	public void setStart(DateTime start) {
		this.start = start;
	}

	public DateTime getEnd() {
		return end;
	}

	public void setEnd(DateTime end) {
		this.end = end;
	}

	public String toString() {
		return "{" +
				"id:" + id +
				", title: '" + name + '\'' +
				", start: ' " + start + '\'' +
				", end: ' " + end + '\'' +
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
