package com.hsb.spring.blog.web;/*
 * Copyright ©2011-2016 hsb
 */

import com.hsb.spring.blog.dao.IBlogDao;
import com.hsb.spring.entity.BlogEntity;
import com.hsb.spring.entity.UserEntity;
import com.hsb.spring.user.dao.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
class BlogController {
    @Autowired
    private IBlogDao blogDao;
    @Autowired
    private IUserDao userDao;

    @RequestMapping(value = "/blog/blogs/addBlogToDb", method = RequestMethod.POST)
    public String addBlog(@ModelAttribute("blog")BlogEntity blogEntity) {
        System.out.println("blog to real");
        blogDao.saveAndFlush(blogEntity);
        return "redirect:/blog/blogs";
    }

    @RequestMapping(value = "/blog/blogs/add", method = RequestMethod.GET)
    public String forwardAddBlog(ModelMap modelMap) {
        List<UserEntity> userList = userDao.findAll();
        modelMap.addAttribute("userList",userList);
        return "blog/addBlog";
    }

    @RequestMapping(value = "/blog/blogs", method = RequestMethod.GET)
    public String showBlogs(ModelMap modelMap){
        List<BlogEntity> blogList = blogDao.findAll();
        modelMap.addAttribute("blogList",blogList);
        return "blog/blogs";
    }

}
