package com.hsb.spring.login.web;

import com.hsb.spring.login.dao.IUserDao;
import com.hsb.spring.login.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/*
 * Copyright &copy;2011-2016 hsb
 */
@Controller
public class FirstController {
    @Autowired
    private transient IUserDao userDao;

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap) {
        List<UserEntity> userEntities = userDao.findAll();
        modelMap.addAttribute("userList", userEntities);
        return "/admin/users";
    }

    @RequestMapping(value = "/admin/users/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user")UserEntity userEntity){
        System.out.println(userEntity.getNickname());
        userDao.saveAndFlush(userEntity);
        return "redirect:/admin/users";
    }

    @RequestMapping(value = "/admin/users/add", method = RequestMethod.GET)
    public String  forwardAddUser(){
        return "admin/addUser";
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "inde";
    }
}
