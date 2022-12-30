package com.example.spendrecord.controller;

import com.example.spendrecord.domain.Spend;
import com.example.spendrecord.domain.User;
import com.example.spendrecord.repo.SpendRepository;
import com.example.spendrecord.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Date;
import java.util.List;

@Controller
public class SpendController {
    @Autowired
    SpendRepository spendRepo;
    @Autowired
    UserRepository userRepo;


    @PostMapping(value = "/v1/spend/{userId}")
    ResponseEntity<Spend> createSpend(@PathVariable Long userId, @RequestBody Spend spend) {
        User user = userRepo.findUserById(userId);

        spend.setCreatedAt(new Date());
        spend = spendRepo.save(spend);
        user.addSpend(spend);
        userRepo.save(user);
        return new ResponseEntity<>(spend, HttpStatus.OK);
    }

    @GetMapping(value = "/v1/spend/{userId}")
    ResponseEntity<List<Spend>> getSpends(@PathVariable Long userId) {
        User user = userRepo.findUserById(userId);
        return new ResponseEntity<>(user.getSpendList(), HttpStatus.OK);
    }

}
