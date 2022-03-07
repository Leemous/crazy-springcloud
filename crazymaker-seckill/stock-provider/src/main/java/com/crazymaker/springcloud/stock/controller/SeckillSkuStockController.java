package com.crazymaker.springcloud.stock.controller;

import com.crazymaker.springcloud.common.page.PageOut;
import com.crazymaker.springcloud.common.page.PageReq;
import com.crazymaker.springcloud.common.result.RestOut;
import com.crazymaker.springcloud.seckill.api.dto.SeckillDTO;
import com.crazymaker.springcloud.seckill.api.dto.SeckillSkuDTO;
import com.crazymaker.springcloud.standard.ratelimit.RedisRateLimitImpl;
import com.crazymaker.springcloud.standard.redis.RedisRepository;
import com.crazymaker.springcloud.stock.service.impl.SeckillSkuStockServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;


@RestController
@RequestMapping("/api/seckill/sku/")
@Api(tags = "商品库存")
public class SeckillSkuStockController {
    @Resource
    SeckillSkuStockServiceImpl seckillSkuStockService;


    @Resource(name = "redisRateLimitImpl")
    RedisRateLimitImpl rateLimitService;

    /**
     * 缓存数据操作类
     */
    @Resource
    RedisRepository redisRepository;


    /**
     * 获取所有的秒杀商品列表
     *
     * @param pageReq 当前页 ，从1 开始,和 页的元素个数
     * @return
     */
    @PostMapping("/list/v1")
    @ApiOperation(value = "全部秒杀商品")
    RestOut<PageOut<SeckillSkuDTO>> findAll(@RequestBody PageReq pageReq) {
        PageOut<SeckillSkuDTO> page = seckillSkuStockService.findAll(pageReq);
        RestOut<PageOut<SeckillSkuDTO>> r = RestOut.success(page);
        return r;

    }

    /**
     * 查询商品信息
     *
     * @param dto 商品id
     * @return 商品 skuDTO
     */
    @PostMapping("/detail/v1")
    @ApiOperation(value = "秒杀商品详情")
    RestOut<SeckillSkuDTO> skuDetail(@RequestBody SeckillDTO dto) {
        Long skuId = dto.getSeckillSkuId();

        SeckillSkuDTO skuDTO = seckillSkuStockService.detail(skuId);

        if (null != skuDTO) {

            return RestOut.success(skuDTO).setRespMsg("查找成功");
        }


        return RestOut.error("未找到指定秒杀商品");
    }

    /**
     * 删除商品信息
     *
     * @param dto 商品id
     * @return 商品 skuDTO
     */
    @PostMapping("/delete/v1")
    @ApiOperation(value = "删除商品信息")
    RestOut<SeckillSkuDTO> deleteSku(@RequestBody SeckillDTO dto) {
        Long skuId = dto.getSeckillSkuId();

        seckillSkuStockService.delete(skuId);


        return RestOut.error("删除商品信息 ok");
    }


    /**
     * 设置秒杀库存
     *
     * @param dto 商品与库存
     * @return 商品 skuDTO
     */
    @PutMapping("/stock/v1")
    @ApiOperation(value = "设置秒杀库存")
    RestOut<SeckillSkuDTO> setStock(@RequestBody SeckillDTO dto) {
        Long skuId = dto.getSeckillSkuId();
        int stock = dto.getNewStockNum();

        SeckillSkuDTO skuDTO = seckillSkuStockService.setNewStock(skuId, stock);

        if (null != skuDTO) {
            return RestOut.success(skuDTO).setRespMsg("设置秒杀库存成功");
        }
        return RestOut.error("未找到指定秒杀商品");
    }


    /**
     * 增加秒杀的商品
     *
     * @param stockCount 库存
     * @param title      标题
     * @param price      商品原价格
     * @param costPrice  价格
     * @return
     */
    @PostMapping("/add/v1")
    @ApiOperation(value = "增加秒杀商品")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "title", value = "商品名称", dataType = "string", paramType = "query", required = true, defaultValue = "秒杀商品-1"),
            @ApiImplicitParam(name = "stockCount", value = "秒杀数量", dataType = "int", paramType = "query", required = true, defaultValue = "10000", example = "10000"),
            @ApiImplicitParam(name = "price", value = "原始价格", dataType = "float", paramType = "query", required = true, defaultValue = "1000", example = "1000"),
            @ApiImplicitParam(name = "costPrice", value = "秒杀价格", dataType = "float", paramType = "query", required = true, defaultValue = "10", example = "1000")
    })
    RestOut<SeckillSkuDTO> addSeckill(
            @RequestParam(value = "title", required = true) String title,
            @RequestParam(value = "stockCount", required = true) int stockCount,
            @RequestParam(value = "price", required = true) float price,
            @RequestParam(value = "costPrice", required = true) float costPrice) {
        SeckillSkuDTO dto = seckillSkuStockService.addSeckillSku(title, stockCount, price, costPrice);
        return RestOut.success(dto).setRespMsg("增加秒杀的商品成功");

    }


    /**
     * 暴露商品秒杀

     {
     "exposedKey": "4b70903f6e1aa87788d3ea962f8b2f0e",
     "newStockNum": 10000,
     "seckillSkuId": 1157197244718385152,
     "seckillToken": "0f8459cbae1748c7b14e4cea3d991000",
     "userId": 37
     }

     * @param dto 商品id
     * @return 商品 skuDTO
     */
    @PostMapping("/expose/v1")
    @ApiOperation(value = "暴露商品秒杀")
    RestOut<SeckillSkuDTO> expose(@RequestBody SeckillDTO dto) {
        Long skuId = dto.getSeckillSkuId();

        SeckillSkuDTO skuDTO = seckillSkuStockService.detail(skuId);

        if (null == skuDTO) {
            return RestOut.error("未找到指定秒杀商品");
        }

        //初始化秒杀的限流器
        rateLimitService.initLimitKey(
                "seckill",
                String.valueOf(skuId),
                10000000,//总数 SeckillConstants.MAX_ENTER,
                1000// 100/s  SeckillConstants.PER_SECKOND_ENTER
        );


        //暴露秒杀
        skuDTO = seckillSkuStockService.exposeSeckillSku(skuId);

        return RestOut.success(skuDTO).setRespMsg("秒杀开启成功");


    }

}
