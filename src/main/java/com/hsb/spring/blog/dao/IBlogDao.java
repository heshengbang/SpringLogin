package com.hsb.spring.blog.dao;/*
 * Copyright ©2011-2016 hsb
 */

import com.hsb.spring.entity.BlogEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IBlogDao extends JpaRepository<BlogEntity, Integer> {
}
