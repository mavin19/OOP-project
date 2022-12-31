package com.example.spendrecord.domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.lang.NonNull;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@RequiredArgsConstructor
@Table(name = "users", uniqueConstraints = {@UniqueConstraint(columnNames = "email")})
@EqualsAndHashCode(exclude = {"id"})
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Setter(AccessLevel.NONE)
    private long id;
    @Column(name = "name")
    @NonNull
    private String name;
    @Column(name = "email")
    @NonNull
    private String email;

    @Column(name = "password")
    @NonNull
    private String password;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Spend> spendList = new ArrayList<>();

    public void addSpend(Spend spend) {
        getSpendList().add(spend);
    }
}
