package com.cagnosolutions.modules.crm.extension.documents.dqf400;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
public class DQF400 {

	@Id
	@GeneratedValue
	private int id;
}
