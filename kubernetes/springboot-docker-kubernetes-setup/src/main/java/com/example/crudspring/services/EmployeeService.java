package com.example.crudspring.services;

import com.example.crudspring.exception.ResourceNotFoundException;
import com.example.crudspring.models.Employee;
import com.example.crudspring.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    // get all employees
    public List<Employee> getAllEmployees(){
        return employeeRepository.findAll();
    }

    // create employee rest api
    public Employee createEmployee(@RequestBody Employee employe) {
        return employeeRepository.save(employe);
    }

    // get employee by id rest api
    public ResponseEntity<Employee> getEmployeeById(@PathVariable Long id) {
        Employee employe = employeeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id :" + id));
        return ResponseEntity.ok(employe);
    }

    // update employee rest api
    public ResponseEntity<Employee> updateEmployee(@PathVariable Long id, @RequestBody Employee employeeDetails){
        Employee employe = employeeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id :" + id));

        employe.setFirstName(employeeDetails.getFirstName());
        employe.setLastName(employeeDetails.getLastName());
        employe.setEmailId(employeeDetails.getEmailId());

        Employee updatedEmployee = employeeRepository.save(employe);
        return ResponseEntity.ok(updatedEmployee);
    }

    // delete employee rest api
    public ResponseEntity<Map<String, Boolean>> deleteEmployee(@PathVariable Long id){
        Employee employe = employeeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id :" + id));

        employeeRepository.delete(employe);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return ResponseEntity.ok(response);
    }
}

