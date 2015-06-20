/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.itstep.java.web.mavenShop3.service;

import java.util.List;
import org.itstep.java.web.mavenShop3.model.Category;
import org.itstep.java.web.mavenShop3.model.Good;
import org.itstep.java.web.mavenShop3.model.Order;
//import org.itstep.java.web.mavenShop3.model.OrderInfo;



public interface GoodService {

    boolean add(Good good);

    boolean edit(Good good);

    Good find(Integer id);

    List<Category> getCategoruiesList();

    Category getCategory(String name);

    List<Good> getList(Integer category);

    List<Order> getListOfOrder(Integer id);
    
    boolean deleteGood(Integer id);
    
    List<Order> getListOfOrderThisName(Integer id);
    
    List<Order> getListOfOrderAll();
    
    List<Good> findAll();
    
    //boolean addOrderInfo(OrderInfo oi);
    
    boolean addOrders(Order o);
}
