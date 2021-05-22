package com.itd.company.controllers;

import java.util.ArrayList;
import java.util.Optional;

import com.itd.company.models.ClientModel;
import com.itd.company.services.ClientService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
// import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/client")
public class ClientController {
  @Autowired
  ClientService clientService;

  // @GetMapping()
  // public ArrayList<ClientModel> getClients() {
  //   return clientService.getClients();
  // }

  @GetMapping()
  public String getClients(Model model) {
    ArrayList<ClientModel>clients = clientService.getClients();
    model.addAttribute("clients", clients);
    return "index";
  }
  @GetMapping(path = "/new")
  public String addClient(Model model) {
    model.addAttribute("client", new ClientModel());
    return "formClient";
  }

  @PostMapping(path = "/save")
  public String saveClient(@Validated ClientModel client) {
    this.clientService.saveClient(client);
    return "redirect:/client";
  }

  @GetMapping(path = "/{id}")
  public Optional<ClientModel> getClientById(@PathVariable("id") Integer id) {
    return this.clientService.getById(id);
  }

  @GetMapping(path = "/query")
  public ArrayList<ClientModel> getClientByName(@RequestParam("name") String name) {
    return this.clientService.getByName(name);
  }

  @GetMapping(path = "/edit/{id}")
  public String editClient(@PathVariable("id") Integer id, Model model) {
    Optional<ClientModel>client = this.clientService.getById(id);
    model.addAttribute("client", client);
    return "formClient";
  }

  @GetMapping(path = "/delete/{id}")
  public String deleteById(@PathVariable("id") Integer id) {
    // boolean success = this.clientService.deleteClient(id);
    this.clientService.deleteClient(id);
    return "redirect:/client";
    // if (success) {
    //   return "Cliente con id: " + id + "eliminado con éxito";
    // } else {
    //   return "Cliente con id: " + id + "no pudo ser eliminado";
    // }
  }
  
}