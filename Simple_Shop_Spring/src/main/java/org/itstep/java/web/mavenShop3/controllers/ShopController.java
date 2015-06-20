
package org.itstep.java.web.mavenShop3.controllers;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import org.itstep.java.web.mavenShop3.model.Korzinka;
import org.itstep.java.web.mavenShop3.model.ChtoV_Korzinke;
import org.itstep.java.web.mavenShop3.model.Category;
import org.itstep.java.web.mavenShop3.model.Good;
import org.itstep.java.web.mavenShop3.model.Order;
import org.itstep.java.web.mavenShop3.service.GoodService;
import org.itstep.java.web.mavenShop3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller

@RequestMapping("/shop")
@SessionAttributes(types = Korzinka.class)

public class ShopController {
    public Korzinka bask = null;
    @Autowired
    GoodService goodService;
    UserService userService;
    @RequestMapping(method = RequestMethod.GET)
    public String categories(ModelMap model) {
        List<Category> cats = goodService.getCategoruiesList();
        
        model.addAttribute("cats", cats);
               
        return "categories";
    }
    
    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    public String goods(
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        List<Good> goods = goodService.getList(id);
        model.addAttribute("goods", goods);
        
        return "goodlist";
    }
    
    @RequestMapping(value = "/add/{catId}/{id}", method = RequestMethod.GET)
    public String addToBasket(
            @PathVariable(value = "catId")
            Integer catId,
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        
        Korzinka basket = (Korzinka) model.get("basket");
        if (basket == null) basket = new Korzinka();
                
        ChtoV_Korzinke i = basket.get(id);
        if (i == null) {
            i = new ChtoV_Korzinke();
            i.setGood(goodService.find(id));
        } else {
            i.incCount();
        }

        basket.put(id, i);
        bask = new Korzinka();
        bask = basket;
        //model.addAttribute("basket", basket);
        model.addAttribute("basket", bask);
        return "redirect:/shop/category/" + catId.toString();
    }
    
    @RequestMapping(value = "/delete/{catId}/{id}", method = RequestMethod.GET)
    public String goodDelete(
            @PathVariable(value = "catId")
            Integer catId,
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        goodService.deleteGood(id);
        
        return "redirect:/shop/category/" + catId.toString();
    }
    
    @RequestMapping(value = "/addGood", method = RequestMethod.GET)
    public String addGood(ModelMap model){
        List<Category> cats = goodService.getCategoruiesList();
        model.addAttribute("cats", cats);
        
        return "addGood";
    }
    
    @RequestMapping(value = "/goodAddSave", method = RequestMethod.GET)
    public String goodSave(
            //@RequestParam(value = "id") Integer id,
            @RequestParam(value = "name") String name,
            @RequestParam(value = "desc") String desc, 
            @RequestParam(value = "price") Double price,
            @RequestParam(value = "cat") Integer cat, 
            ModelMap model){        
        
        model.addAttribute("name", name);
        model.addAttribute("desc", desc);
        model.addAttribute("price", price);       
        model.addAttribute("cat", cat);
        Good g = new Good(name, desc, price, cat);
        goodService.add(g);

        return "redirect:/shop/category/" + cat.toString();
    }
    
    @RequestMapping(value = "/editGood/{catId}/{id}", method = RequestMethod.GET)
    public String editGood(
            @PathVariable(value = "catId")
            Integer catId,
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        
        List<Category> cats = goodService.getCategoruiesList();
        Good g = goodService.find(id);
        model.addAttribute("catId", catId);
        model.addAttribute("cats", cats);
        model.addAttribute("good", g);
        
        return "editGood";
    }
    
    @RequestMapping(value = "/goodEditSave/{id}", method = RequestMethod.GET)
    public String userEditSave(
            @RequestParam(value = "id") Integer id,
            @RequestParam(value = "name") String name,
            @RequestParam(value = "desc") String desc, 
            @RequestParam(value = "price") Double price,
            @RequestParam(value = "cat") Integer cat, 
            ModelMap model) {
        model.addAttribute("id", id);

        Good g = new Good(id, name, desc, price, cat);        
        goodService.edit(g);
        
        return "redirect:/shop/category/" + cat.toString();
    }
    
    @RequestMapping(value = "/orderAdd", method = RequestMethod.GET)
    public String addOrder(
            Integer catId,
            ModelMap model) {
        List<Good> goods = goodService.findAll();
        Timestamp date = null;
        String str = null;
        model.addAttribute("str", str);
        model.addAttribute("date", date);
        model.addAttribute("goods", goods);

        return "addOrder";
    }
    
    @RequestMapping(value = "/saveOrder", method = RequestMethod.GET)
    public String saveOrder(
            @RequestParam(value = "id") Integer id,
            @RequestParam(value = "DeliverAddress") String DeliverAddress,
            ModelMap model) {
        Order o = new Order();
            
        for (HashMap.Entry<Integer, ChtoV_Korzinke>pair:bask.entrySet()){
            Integer key = pair.getKey();
            ChtoV_Korzinke value = pair.getValue();
            o.setIdUser(id);
            if (!DeliverAddress.equals("")){
                o.setAddress(DeliverAddress);
            } else {
                return "addOrder";
            }
            o.setIdGood(value.getGood().getId());
            o.setAmount(value.getCount());
            o.setPrice(value.getGood().getPrice());                     
           
            goodService.addOrders(o);
        }
        Korzinka basket = new Korzinka();
        bask = new Korzinka();
        bask = basket;
        model.addAttribute("basket", bask);
        
        return "redirect:/shop/category/" + 1;
    }
    
    @RequestMapping(value = "/history/{id}", method = RequestMethod.GET)
    public String historyOrder(
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        
        model.addAttribute("id", id);
        List<Order> o = goodService.getListOfOrderThisName(id);
        List<Good> g = goodService.findAll();
        model.addAttribute("Order", o);
        model.addAttribute("Good", g);

        return "historyOrder";
    }
    
    @RequestMapping(value = "/basketDelete", method = RequestMethod.GET)
    //@RequestMapping(value = "/basketDelete/{catId}", method = RequestMethod.GET)
    public String deleteToBasket(
            //@PathVariable(value = "catId")
            //Integer catId,
            ModelMap model) {
        
        Korzinka basket = new Korzinka();
        bask = new Korzinka();
        bask = basket;
        //model.addAttribute("basket", basket);
        model.addAttribute("basket", bask);
        //return "redirect:/shop/category/" + catId.toString();
        return "redirect:/shop/category/" + 1;
    }
    
    @RequestMapping(value = "/deleteGoodInBasket/{catId}/{id}", method = RequestMethod.GET)
    public String deleteToGoodBasket(
            @PathVariable(value = "catId")
            Integer catId,
            @PathVariable(value = "id")
            Integer id,
            ModelMap model) {
        
        Korzinka basket = (Korzinka) model.get("basket");
        if (basket == null) basket = new Korzinka();
               
        ChtoV_Korzinke i = basket.get(id);
        if (i.getCount() == 1) {
            basket.remove(id);
        } else {
            i.decCount();
        }

        bask = new Korzinka();
        bask = basket;
        //model.addAttribute("basket", basket);
        model.addAttribute("basket", bask);
        return "redirect:/shop/category/" + catId.toString();
    }
}
