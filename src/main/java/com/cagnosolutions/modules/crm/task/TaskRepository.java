package com.cagnosolutions.modules.crm.task;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Repository
public interface TaskRepository extends JpaRepository<Task, Integer>{
}
