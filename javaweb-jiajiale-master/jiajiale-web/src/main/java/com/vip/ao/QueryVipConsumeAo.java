package com.vip.ao;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
@Data
public class QueryVipConsumeAo {
    /**会员手机号*/
    private String mobile;
    /**关联订单id*/
    private String orderId;
    /**初始时间*/
    private String startDate;
    /**结束时间*/
    private String endDate;
}
