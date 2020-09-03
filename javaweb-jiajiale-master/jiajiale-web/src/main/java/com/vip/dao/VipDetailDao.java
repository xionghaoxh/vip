package com.vip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vip.entity.VipDetailEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface VipDetailDao extends CRUDDao<VipDetailEntity,String> {
	List<VipDetailEntity> selectByRankIdAndKey(@Param("rankId") Integer rankId,@Param("key") String key);
}
