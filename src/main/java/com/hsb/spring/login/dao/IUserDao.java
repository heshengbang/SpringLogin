package com.hsb.spring.login.dao;
/*
 * Copyright ©2011-2016 hsb
 */

import com.hsb.spring.login.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserDao extends JpaRepository<UserEntity,Integer>{
}
