package com.group1.springmvcsummer.repository;

import com.group1.springmvcsummer.model.Discount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Long> {

    public Discount findById(Long i);
}
