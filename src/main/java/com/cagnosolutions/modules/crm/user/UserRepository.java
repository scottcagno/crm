package com.cagnosolutions.modules.crm.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	@Query("SELECT u FROM User u WHERE u.username=:username")
	User findOneByUsername(@Param("username") String username);

	@Query("SELECT COUNT(u.id) FROM User u WHERE u.id<>:id AND u.username=:username")
	int canUpdate(@Param("id") int id, @Param("username") String username);
}
