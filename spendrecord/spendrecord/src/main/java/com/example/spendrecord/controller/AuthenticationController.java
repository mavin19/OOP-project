package com.example.spendrecord.controller;

import com.example.spendrecord.domain.User;
import com.example.spendrecord.repo.UserRepository;
import com.example.spendrecord.reqmodel.LoginReq;
import com.example.spendrecord.reqmodel.RegisterReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Objects;

@Controller
public class AuthenticationController {
    @Autowired
    UserRepository userRepo;


    @PostMapping(value = "/v1/auth/login")
    ResponseEntity<User> loginController(@RequestBody LoginReq req) {
        User user = userRepo.findByEmail(req.getEmail());

        if (user == null) {
            return new ResponseEntity<>(null, HttpStatus.FORBIDDEN);
        }

        if (!Objects.equals(user.getPassword(), req.getPassword())) {
            return new ResponseEntity<>(null, HttpStatus.FORBIDDEN);
        }

        return new ResponseEntity<User>(user, HttpStatus.OK);

    }

    @PostMapping(value = "/v1/auth/register")
    ResponseEntity<User> registerController(@RequestBody RegisterReq req) {
        User user = userRepo.findByEmail(req.getEmail());
        if (user != null) {
            // user already exist
            return new ResponseEntity<>(null, HttpStatus.FORBIDDEN);
        }

        return new ResponseEntity<User>(userRepo.save(new User(req.getName(), req.getEmail(), req.getPassword())), HttpStatus.OK);

    }
}
