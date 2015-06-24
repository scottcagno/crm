package com.cagnosolutions.modules.crm.address;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Repository
public interface AddressRepository extends JpaRepository<Address, Integer> {
}
