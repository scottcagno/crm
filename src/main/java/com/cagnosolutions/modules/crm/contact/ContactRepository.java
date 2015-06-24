package com.cagnosolutions.modules.crm.contact;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Repository
public interface ContactRepository extends JpaRepository<Contact, Integer> {
}
