package com.example.spendrecord.domain;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.lang.NonNull;

import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@RequiredArgsConstructor
@Table(name = "spends")
@EqualsAndHashCode(exclude = {"id"})
public class Spend {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Setter(AccessLevel.NONE)
    private long id;
    @Column(name = "item")
    @NonNull
    private String item;

    @Column(name = "cost")
    @NonNull
    private double cost;

    @Column(name = "created_at")
    @NonNull
    private Date createdAt;
}
