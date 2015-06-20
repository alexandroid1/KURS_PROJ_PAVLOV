/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.itstep.java.web.mavenShop3.service;

import java.sql.SQLException;
import java.util.List;
import org.itstep.java.web.mavenShop3.model.User;


public interface UserService {

    boolean authorize(String name, String password);

    boolean deleteUser(Integer id);

    boolean edit(User u);

    User find(Integer id);

    List<User> findAll();

    User findByName(String name);

    List<User> findByNames(String name);

    int save(User u);
    
}
