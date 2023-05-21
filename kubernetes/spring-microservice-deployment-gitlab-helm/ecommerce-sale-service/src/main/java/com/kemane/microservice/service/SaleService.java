package com.kemane.microservice.service;

import com.kemane.microservice.model.Sale;
import com.kemane.microservice.repository.SaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SaleService {

    @Autowired
    private SaleRepository saleRepository;

    public List<Sale> getAllSales(){
        return saleRepository.findAll();
    }

    public Optional<Sale> getSaleById(int id){
        return saleRepository.findById(id);
    }

    public Sale addVente(Sale sale){
        return saleRepository.save(sale);
    }

    public Optional<Sale> getSaleByIdClient(int idClient){
        return saleRepository.findByIdClient(idClient);
    }
}
