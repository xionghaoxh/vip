package com.vip.dao;

import com.vip.entity.SysAccountEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

@Mapper
@Service
public interface SysAccountDao extends CRUDDao<SysAccountEntity,String> {

	
}
