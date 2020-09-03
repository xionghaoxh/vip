package com.vip.service.impl;

import com.vip.ao.VipAo;
import com.vip.dao.VipDetailDao;
import com.vip.entity.SysAccountEntity;
import com.vip.entity.VipDetailEntity;
import com.vip.service.CommonService;
import com.vip.service.VipDetailService;
import lombok.NonNull;
import org.omg.CORBA.Current;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@Service
public class VipDetailServiceImpl implements VipDetailService, CommonService {
    @Autowired
    VipDetailDao dao;
    @Override
    public void add(@NonNull VipAo ao) throws Exception {
        //验证参数
        String address = $("邮件地址", ao.getAddress());
        String email= $("邮件",ao.getEmail());
        String mobile= $("手机号",ao.getMobile());
        String name=$("名字",ao.getName());
        String  qq=$("qq",ao.getQq());
        String vipcode=$("vip码",ao.getZipCode());
        String id=$("id",ao.getId());
        //执行逻辑
        VipDetailEntity vip = dao.select("id", id);
        if(vip==null){
            //组装业务
            VipDetailEntity e = new VipDetailEntity();
            e.setAddress(address);
            //e.setBirthday(LocalDate.parse(ao.getBirthday(), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            e.setBirthday(null);
            e.setCreateTime(LocalDateTime.now());
            e.setEmail(email);
            e.setId(id);
            e.setMobile(mobile);
            e.setName(name);
            e.setNo("13666666667");
            e.setQq(qq);
            e.setSex(ao.isSex());
            e.setRankId(Integer.valueOf(ao.getRankId()));
            e.setZipCode(vipcode);
            e.setCreateTime(LocalDateTime.now());
//            e.setCreateUserId("07d2ab1f870f8579ab0449f4e3783bc5");
          //  e.setCreateUserId(ao.getCreateUserId());
            e.setLastConsumeTime(LocalDateTime.now());
            e.setTotalConsumeMoney(12000);
            dao.insert(e);
        }

    }
}
