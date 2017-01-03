package com.hsb.spring.user.dao;
/*
 * Copyright ©2011-2016 hsb
 */

import com.hsb.spring.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface IUserDao extends JpaRepository<UserEntity,Integer>{
    @Modifying
    @Transactional
    @Query("update UserEntity us set us.nickname=:qNickname, us.firstName=:qFirstName, us.lastName=:qLastName, us.password=:qPassword where us.id=:qId")
    void updateUser(@Param("qNickname") String nickname, @Param("qFirstName") String firstName, @Param("qLastName") String qLastName, @Param("qPassword") String password, @Param("qId") Integer id);
}
