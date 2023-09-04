package com.kemane.microservice.repository;

import com.kemane.microservice.model.Sale;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SaleRepository extends JpaRepository<Sale, Integer> {

    public Optional<Sale> findByIdClient(int idClient);
}
