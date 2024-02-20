package com.dat.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dat.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	List<Product> findByPrice(double minPrice, double maxPrice);
}
