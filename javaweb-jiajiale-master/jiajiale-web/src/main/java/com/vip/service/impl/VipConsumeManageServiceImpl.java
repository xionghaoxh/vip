package com.vip.service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import com.vip.ao.QueryVipConsumeAo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vip.ao.VipConsumeAo;
import com.vip.dao.VipConsumeDao;
import com.vip.dao.VipDetailDao;
import com.vip.dto.QueryResult;
import com.vip.entity.VipConsumeEntity;
import com.vip.entity.VipDetailEntity;
import com.vip.entity.VipRankEntity;
import com.vip.service.CommonService;
import com.vip.service.VipConsumeManageService;
import com.yizhuoyan.common.BeanMap;

import lombok.NonNull;

@Service
public class VipConsumeManageServiceImpl implements VipConsumeManageService, CommonService {
	@Autowired
	VipConsumeDao vcdao;
	@Autowired
	VipDetailDao vdao;

	@Override
	@Transactional
	public void addVipConsume(@NonNull VipConsumeAo ao) throws Exception {
		// 1验证参数

		String vipMobile = $("会员手机号", ao.getVipMobile());
		String consumeMoney = $("消费金额", ao.getConsumeMoney());
		double consumeMoneyInt = assertDouble("消费金额", consumeMoney);
		assertGreatThan("消费金额", consumeMoneyInt, 0);
		String orderId = $("关联订单", ao.getOrderId());
		String remark = trim(ao.getRemark());

		// 2业务逻辑
		// 2.1 查找会员
		VipDetailEntity vip = vdao.select("mobile", vipMobile);
		assertNotNull("会员手机号不存在[%s]", vip, vipMobile);

		// 2.2 查找会员等级
		VipRankEntity rank = vip.getRank();
		// 2.3 获取折扣
		int enjoyDiscount = rank.getEnjoyDiscount();
		VipConsumeEntity e = new VipConsumeEntity();
		e.setId(uuid());
		e.setVipId(vip.getId());
		// 单位为分
		e.setConsumeMoney((int) (consumeMoneyInt * 100));
		e.setEnjoyDiscount(enjoyDiscount);
		e.setDiscountMoney((int) (e.getConsumeMoney() * (enjoyDiscount / 100.0)));
		e.setActualPayMoney(e.getConsumeMoney() - e.getDiscountMoney());

		e.setConsumeTime(LocalDateTime.now());

		e.setOrderId(orderId);
		// TODO 创建人id
		String createUserId = "00000000000000000000000000000000";
		e.setCreateUserId(createUserId);
		e.setStatus(VipConsumeEntity.STATUS_NORMAL);
		e.setRemark(remark);
        e.setCreateTime(LocalDateTime.now());
		vcdao.insert(e);
	}

	@Override
	public QueryResult<VipConsumeEntity> queryVipConsumeByMobile(String mobile, int pageNo, int pageSize)
			throws Exception {
		// 1 验证参数
		mobile = $("客户手机号", mobile);
		if (pageNo <= 0) {
			pageNo = 1;
		}
		if (pageSize <= 0) {
			pageSize = 5;
		}
		// 2 业务逻辑
		// 2.2 执行业务逻辑

		VipDetailEntity vip = vdao.select("mobile", mobile);
		assertNotNull("客户不存在[%s]", vip, mobile);
		// 查询消费记录
		PageHelper.startPage(pageNo, pageSize);
		List<VipConsumeEntity> list = vcdao.selectByVipId(vip.getId());
		PageInfo<VipConsumeEntity> page = new PageInfo<>(list);
		// 3 组装结果
		QueryResult<VipConsumeEntity> result = new QueryResult<VipConsumeEntity>();
		result.setPageNo(pageNo);
		result.setRows(page.getList());
		result.setTotalRows(page.getTotal());
		result.setPageSize(pageSize);
		return result;
		// 3
	}

	@Override
	public VipConsumeEntity checkVipConsume(String id) throws Exception {
		// 1 验证参数
		id = $("id", id);
		// 2 业务逻辑
		// 2.2 执行业务逻辑
		VipConsumeEntity vip = vcdao.select("id", id);
		return vip;
	}

	@Override
	public QueryResult<VipConsumeEntity> queryVipConsumeByKey(String key, int pageNo, int pageSize) throws Exception {
		// 1 验证参数(参数清理)
		key = trim(key);
		if (key != null) {
			key = escapeForSqlLike(key);
			key = "%" + key + "%";
		}

		if (pageNo <= 0) {
			pageNo = 1;
		}
		if (pageSize <= 0) {
			pageSize = 5;
		}
		// 2 执行业务逻辑
		PageHelper.startPage(pageNo, pageSize);

		PageInfo<VipConsumeEntity> page = new PageInfo<>(vcdao.selectByKey(key));
		// 3 组装结果
		QueryResult<VipConsumeEntity> result = new QueryResult<VipConsumeEntity>();
		result.setPageNo(pageNo);
		result.setRows(page.getList());
		result.setTotalRows(page.getTotal());
		result.setPageSize(pageSize);
		return result;

	}

	@Override
	public QueryResult<VipConsumeEntity> queryConsume(QueryVipConsumeAo ao, int pageNo, int pageSize) throws Exception {
		//1.参数验证 （清理）(手机号，订单号，开始时间，结束时间)
		String mobile = trim(ao.getMobile());
		if (mobile != null) {
			mobile = escapeForSqlLike(mobile);
			mobile = "%" + mobile + "%";
		}
		String orderId = trim(ao.getOrderId());
		if (orderId != null) {
			orderId = escapeForSqlLike(orderId);
			orderId = "%" + orderId + "%";
		}
		String startDate = trim(ao.getStartDate());
		LocalDate sDate = null;
		if (startDate != null) {
			sDate = parseLocalDate(startDate, "yyyy-MM-dd");
		}
		String endDate = trim(ao.getEndDate());
		LocalDate eDate = null;
		if (endDate != null) {
			eDate = parseLocalDate(endDate, "yyyy-MM-dd");
		}
		if (pageNo <= 0) {
			pageNo = 1;
		}
		if (pageSize <= 0) {
			pageSize = 5;
		}
		// 2 执行业务逻辑
		PageHelper.startPage(pageNo, pageSize);
		PageInfo<VipConsumeEntity> page = new PageInfo<>(vcdao.selectConsume(mobile, orderId, sDate, eDate));
		// 3 组装结果
		QueryResult<VipConsumeEntity> result = new QueryResult<VipConsumeEntity>();
		result.setPageNo(pageNo);
		result.setRows(page.getList());
		result.setTotalRows(page.getTotal());
		result.setPageSize(pageSize);
		return result;
	}

	@Override
	@Transactional
	public void deleteVipConsume(String id) throws Exception {
		vcdao.update(id, BeanMap.of("status", VipConsumeEntity.STATUS_DELETED));
	}

}
