package com.itd.company.repositories;

import java.util.ArrayList;

import com.itd.company.models.ClientModel;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends CrudRepository<ClientModel, Integer> {
  public abstract ArrayList<ClientModel> findByName(String name);
}