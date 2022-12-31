package com.example.spendrecord.repo;

import com.example.spendrecord.domain.Spend;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SpendRepository extends JpaRepository<Spend, Long> {
}
