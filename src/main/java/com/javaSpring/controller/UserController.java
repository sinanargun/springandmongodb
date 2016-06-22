package com.javaSpring.controller;

import com.javaSpring.model.UserModel;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by nuvia on 20.06.2016.
 *
 */
@Controller
public class UserController {

    @Autowired
    private MongoTemplate mongoTemplate;


   @RequestMapping(value = "/userLists", method = {RequestMethod.GET})
   @ResponseBody //To return value as a JSON
   public List<UserModel> getAllUsers() {

       List<UserModel> users = new ArrayList<UserModel>();

       UserModel user = new UserModel("Sinan", "Argun", "55555");

       users.add(user);

       return users;
   }



    @RequestMapping(value = "/getUsers", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView getPeople() {

        List<UserModel> list;


        list = mongoTemplate.find(new Query(), UserModel.class);
        System.out.println( mongoTemplate.find(new Query(), UserModel.class));;
        //return back to index.jsp


        ModelAndView model = new ModelAndView("index");
        model.addObject("lists", list);

        return model;
    }

    @RequestMapping(value = "/save", method = {RequestMethod.POST})
    public @ResponseBody UserModel saveNewRecord(@RequestParam("name") String name, @RequestParam("surname") String surname, @RequestParam("phone") String phone) {

        UserModel user = new UserModel(name,surname,phone);

        mongoTemplate.save(user);

        return user;
    }

    @RequestMapping(path = "/deleteUser", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView deleteUser(@RequestParam("id") String id) {
        System.out.println(id);

        Query query = new Query();
        query.addCriteria(Criteria.where("_id").is(new ObjectId(id)));

        mongoTemplate.remove(query,UserModel.class);

        List<UserModel> list;

        list = mongoTemplate.find(new Query(), UserModel.class);

        ModelAndView model = new ModelAndView("index");
        model.addObject("lists", list);

        return model;

    }

   @RequestMapping(path = "/editUser", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView editUser(@RequestParam("id") String id) {
       System.out.println("yesanda");

        UserModel user;
        user = mongoTemplate.findById(new ObjectId(id),UserModel.class);

        ModelAndView model = new ModelAndView("edit");
        model.addObject("user",user);

        return model;
    }

    @RequestMapping(path = "/editUser", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView userEditButton(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("surname") String surname, @RequestParam("phone") String phone) {

        Query query = new Query();
        query.addCriteria(Criteria.where("_id").is(new ObjectId(id)));

        Update update = new Update();
        update.set("name", name);
        update.set("surName", surname);
        update.set("phone", phone);

        mongoTemplate.findAndModify(query,update, UserModel.class );

       return getPeople();
    }

}
