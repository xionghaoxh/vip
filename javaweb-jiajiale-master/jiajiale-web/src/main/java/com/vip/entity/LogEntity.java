package com.vip.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class LogEntity {
    private String id;
    private LocalDateTime loginTime;
    private String loginAccount;
    private String loginIp;
    private String avator;
    private String loginAccountName;
    private String loginDevice;
    private LocalDateTime logoffTime;
    private LocalDateTime onlineTime;


}
