package com.vip.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vip.entity.VipConsumeEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface VipConsumeDao extends CRUDDao<VipConsumeEntity,String> {
	
	List<VipConsumeEntity> selectByKey(@Param("key") String key);
	List<VipConsumeEntity> selectByVipId(String id)throws Exception;

	/**
	 *
	 * @param mobile
	 * @param orderId
	 * @param startDate
	 * @param endDate
	 * @return
	 * @throws Exception
	 */
	List<VipConsumeEntity> selectConsume(@Param("mobile")String mobile, @Param("orderId")String orderId,@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate) throws  Exception;
}
