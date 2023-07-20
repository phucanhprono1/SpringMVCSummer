package com.group1.springmvcsummer.repository;

import com.group1.springmvcsummer.model.Supplier;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierRepository extends JpaRepository<Supplier, Long> {
    @Query("SELECT c FROM Supplier c WHERE LOWER(c.name) LIKE LOWER(CONCAT('%', :name, '%'))")
    List<Supplier> findByNameContainingIgnoreCase(@Param("name")String name);

    public Supplier findById(Long id);
    
    public void deleteById(Long id);
}
