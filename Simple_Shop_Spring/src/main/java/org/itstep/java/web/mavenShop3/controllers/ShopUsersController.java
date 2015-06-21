/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.itstep.java.web.mavenShop3.controllers;

import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.itstep.java.web.mavenShop3.model.User;
import org.itstep.java.web.mavenShop3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author ALEXANDR
 */

@Controller
//@RequestMapping("/MavenShop/users")
//@RequestMapping("/user")
@RequestMapping("/user")
@SessionAttributes({"current","thisUser"})
//@SessionAttributes("message")
public class ShopUsersController {
    @Autowired
    UserService userService;

    
    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public String user(
            UsernamePasswordAuthenticationToken currentUser,
            @RequestParam(value = "id",required = true, defaultValue = "1")
            Integer id,
            Model model) {
        
        User u = (User)currentUser.getPrincipal();
        User uId = userService.findByName(u.getName());
        model.addAttribute("thisUser", uId);
        
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        model.addAttribute("current", (User) currentUser.getPrincipal());
        
        return "user";
    }
       
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String userDelete(
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        userService.deleteUser(id);
        
        return "redirect:/user/show";
    }
    
    @RequestMapping(value = "/editUser/{id}", method = RequestMethod.POST)
    public String userEdit(
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        User u = userService.find(id);
        model.addAttribute("user", u);
        
        return "editUser";
    }
    
    @RequestMapping(value = "/userEditSave", method = RequestMethod.POST)
    public String userEditSave(
            @RequestParam(value = "id") Integer id,
            @RequestParam(value = "name") String name,
            @RequestParam(value = "email") String email, 
            @RequestParam(value = "password") String password,
            @RequestParam(value = "isAdmin", required = false, defaultValue = "false") boolean isAdmin, 
            Model model) {
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        model.addAttribute("email", email);
        model.addAttribute("password", password);
        model.addAttribute("isAdmin", isAdmin);
         User u = new User(name, email, password, isAdmin);
         u.setId(id);

        userService.save(u);
        return "redirect:/user/show";
    }
    
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(Model model){
        return "addUser";
    }
    
    @RequestMapping(value = "/userSave", method = RequestMethod.POST)
    public String userSave(
            @RequestParam(value = "name") String name,
            @RequestParam(value = "email") String email, 
            @RequestParam(value = "password") String password,
            @RequestParam(value = "isAdmin", required = false, defaultValue = "false") boolean isAdmin, 
            Model model){
        model.addAttribute("name", name);
        model.addAttribute("email", email);
        model.addAttribute("password", password);       
        model.addAttribute("isAdmin", isAdmin);
        User u = new User(name, email, password, isAdmin);
        userService.save(u);
        
        return "redirect:/user/show";
    }
    
    
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(ModelMap model) {
        
        return "login";
    }
        
}
