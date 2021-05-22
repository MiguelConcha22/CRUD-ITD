package com.itd.company.services;

import java.util.ArrayList;
import java.util.Optional;

import com.itd.company.models.ClientModel;
import com.itd.company.repositories.ClientRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {
  @Autowired
  ClientRepository clientRepository;

  public ArrayList<ClientModel> getClients() {
    return (ArrayList<ClientModel>) clientRepository.findAll();
  }

  public ClientModel saveClient(ClientModel client) {
    return clientRepository.save(client);
  }

  public Optional<ClientModel> getById(Integer id) {
    return clientRepository.findById(id);
  }

  public ArrayList<ClientModel> getByName(String name) {
    return clientRepository.findByName(name);
  }

  public boolean deleteClient(Integer id) {
    try {
      clientRepository.deleteById(id);
      return true;
    } catch (Exception error) {
      return false;
    }
  }
  
}