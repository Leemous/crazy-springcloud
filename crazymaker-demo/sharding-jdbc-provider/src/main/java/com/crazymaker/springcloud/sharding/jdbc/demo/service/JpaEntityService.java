package com.crazymaker.springcloud.sharding.jdbc.demo.service;


import com.crazymaker.springcloud.sharding.jdbc.demo.entity.Order;
import com.crazymaker.springcloud.sharding.jdbc.demo.entity.User;

import java.util.List;

public interface JpaEntityService
{


    void initEnvironment();

    void cleanEnvironment();

    void processSuccess();

    void processFailure();

    void printData();

    //增加订单
    void addOrder(Order dto);

    //查询全部订单
    List<Order> selectAllOrder();


    //增加用户
    void addUser(User dto);

    //查询全部用户
    List<User> selectAllUser();

}
