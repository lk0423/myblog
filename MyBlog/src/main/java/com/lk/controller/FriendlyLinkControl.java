package com.lk.controller;

import com.lk.model.Result;
import com.lk.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: zhangocean
 * @Date: 2019/5/19 17:04
 * Describe: 友链页面
 */
@RestController
public class FriendlyLinkControl {

    @Autowired
    FriendLinkService friendLinkService;

    /**
     * 获得所有友链信息
     */
    @PostMapping("/getFriendLinkInfo")
    public Result getFriendLink(){
        return friendLinkService.getFriendLink();
    }

}
