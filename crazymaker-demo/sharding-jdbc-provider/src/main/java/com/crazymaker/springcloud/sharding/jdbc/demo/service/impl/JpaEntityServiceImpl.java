/*
 * Copyright 2016-2018 shardingsphere.io.
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * </p>
 */

package com.crazymaker.springcloud.sharding.jdbc.demo.service.impl;

import com.crazymaker.springcloud.sharding.jdbc.demo.dao.OrderRepository;
import com.crazymaker.springcloud.sharding.jdbc.demo.dao.UserRepository;
import com.crazymaker.springcloud.sharding.jdbc.demo.entity.Order;
import com.crazymaker.springcloud.sharding.jdbc.demo.entity.User;
import com.crazymaker.springcloud.sharding.jdbc.demo.entity.jpa.OrderEntity;
import com.crazymaker.springcloud.sharding.jdbc.demo.entity.jpa.UserEntity;
import com.crazymaker.springcloud.sharding.jdbc.demo.service.JpaEntityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class JpaEntityServiceImpl implements JpaEntityService
{
    @Resource
    private OrderRepository orderRepository;

    @Resource
    private UserRepository userRepository;

    @Override
    public void initEnvironment()
    {
        orderRepository.createTableIfNotExists();
        orderRepository.truncateTable();
    }

    @Override
    public void cleanEnvironment()
    {
        orderRepository.dropTable();
    }

    @Transactional
    @Override
    public void addOrder(Order order)
    {
        Order orderEntity = new OrderEntity();
        orderEntity.setUserId(order.getUserId());
        orderEntity.setStatus("INSERT_TEST");
        orderRepository.insert(orderEntity);
    }

    @Override
    public List<Order> selectAllOrder()
    {
        return orderRepository.selectAll();
    }

    //增加用户
    public void addUser(User dto)
    {
        User userEntity = new UserEntity();
        userEntity.setUserId(dto.getUserId());
        userEntity.setName(dto.getName());
        userRepository.insert(userEntity);
    }

    //查询全部用户
    public List<User> selectAllUser()
    {
        return userRepository.selectAll();
    }


    @Transactional
    @Override
    public void processSuccess()
    {
        System.out.println("-------------- Process Success Begin ---------------");
        List<Long> orderIds = insertData();
        printData();
        deleteData(orderIds);
        printData();
        System.out.println("-------------- Process Success Finish --------------");
    }

    @Transactional
    @Override
    public void processFailure()
    {
        System.out.println("-------------- Process Failure Begin ---------------");
        insertData();
        System.out.println("-------------- Process Failure Finish --------------");
        throw new RuntimeException("Exception occur for transaction test.");
    }

    private List<Long> insertData()
    {
        System.out.println("---------------------------- Insert Data ----------------------------");
        List<Long> result = new ArrayList<>(10);
        for (int i = 1; i <= 10; i++)
        {
            Order order = new OrderEntity();
            order.setUserId(i);
            order.setStatus("INSERT_TEST");
            orderRepository.insert(order);
            result.add(order.getOrderId());
        }
        return result;
    }
    @Transactional
    private void deleteData(final List<Long> orderIds)
    {
        System.out.println("---------------------------- Delete Data ----------------------------");
        for (Long each : orderIds)
        {
            orderRepository.delete(each);
        }
    }

    @Override
    public void printData()
    {
        System.out.println("---------------------------- Print Order Data -----------------------");
        System.out.println(orderRepository.selectAll());
    }


}
