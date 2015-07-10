package com.cagnosolutions.modules.crm.user;

public class UserSession {

	private Boolean admin;

	public UserSession(Boolean admin) {
		this.admin = admin;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
}
