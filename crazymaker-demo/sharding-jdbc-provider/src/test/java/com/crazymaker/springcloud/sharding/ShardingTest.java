package com.crazymaker.springcloud.sharding;

import com.crazymaker.springcloud.sharding.jdbc.demo.service.JpaEntityService;
import com.crazymaker.springcloud.sharding.jdbc.demo.start.ShardingJdbcDemoCloudApplication;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {ShardingJdbcDemoCloudApplication.class})
// 指定启动类
public class ShardingTest
{

    @Resource
    JpaEntityService jpaEntityService;


    @Test
    public void testPrintData()
    {
        jpaEntityService.printData();
    }


}
