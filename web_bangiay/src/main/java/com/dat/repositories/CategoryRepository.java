package com.dat.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dat.entities.Categories;

@Repository
public interface CategoryRepository extends JpaRepository<Categories, Integer> {

}
