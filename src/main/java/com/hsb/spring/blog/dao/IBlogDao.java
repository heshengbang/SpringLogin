package com.hsb.spring.blog.dao;
/*
 * Copyright ©2011-2016 hsb
 */

import com.hsb.spring.entity.BlogEntity;
import com.hsb.spring.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
public interface IBlogDao extends JpaRepository<BlogEntity, Integer> {
    @Modifying
    @Transactional
    @Query("update BlogEntity be set be.title=:qTitle, be.blogByUserId.id=:qUserId, be.content=:qContent, be.pubDate=:qPubDate where be.id=:qId")
    void updateBlog(@Param("qTitle") String title, @Param("qUserId") int userId, @Param("qContent") String content, @Param("qPubDate") Date pubDate, @Param("qId") int id);

    @Query("select be from BlogEntity be where be.blogByUserId.id=:userId")
    List<BlogEntity> getBlogsByUserId(@Param("userId") Integer userId);
}
