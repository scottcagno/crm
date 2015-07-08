package com.cagnosolutions.modules.crm.document;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DocumentRepository extends JpaRepository<Document, Integer> {

	@Query("SELECT d FROM Document d WHERE d.fk=:fk")
	List<Document> findAllByFk(@Param("fk") int fk);
}
