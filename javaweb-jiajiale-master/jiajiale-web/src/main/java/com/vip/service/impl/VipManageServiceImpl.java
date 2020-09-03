package com.vip.service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceResourceBundle;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vip.ao.VipAo;
import com.vip.dao.VipDetailDao;
import com.vip.dao.VipRankDao;
import com.vip.dto.AccountContext;
import com.vip.dto.QueryResult;
import com.vip.entity.VipDetailEntity;
import com.vip.exception.VipException;
import com.vip.service.VipManageService;

import lombok.NonNull;

import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Valid;
import javax.validation.Validator;

@Service
@Transactional
public class VipManageServiceImpl implements VipManageService {
	@Autowired
	VipDetailDao vdao;
	@Autowired
	VipRankDao rdao;
	@Override
	public void addVip(@NonNull VipAo ao, HttpSession session) throws Exception {

			//1验证参数
		/**手机号，可作为会员凭证*/
		String mobile=$("手机号",ao.getMobile());		
		//TODO 手机号需要验证
		/**账号名称(客户姓名)*/
		String name=$("客户姓名",ao.getName());		
		/**等级*/
		String rankId=$("客户等级",ao.getRankId());
		/**性别*/
		boolean sex=ao.isSex();

		/**生日(1990-01-01) 可选*/
		String birthdayStr=trim(ao.getBirthday());
		LocalDate birthday=null;
		if(birthdayStr!=null) {
			//验证满足格式
			birthday=parseLocalDate(birthdayStr, "yyyy-MM-dd");
		}

		/**QQ可选*/
		String qq=trim(ao.getQq());		

		/**邮箱(可选)*/
		String email=trim(ao.getEmail());		

		/**地址(可选)*/
		String address=trim(ao.getAddress());		

		/**邮编(可选)*/
		String zipCode=trim(ao.getZipCode());		
		/**备注(可选)*/
		String remark=trim(ao.getRemark());		
		
		//2业务逻辑
			//2.1 手机号作为账号,不能已存在
			if(vdao.exists("mobile", mobile)) {
				throw new VipException("mobile-exists","手机号已存在");
			}
			//2.2 客户等级ID要有效
			if(!rdao.exists("id", rankId)) {
				throw new VipException("rankid-illegal","等级id无效");
			}
			VipDetailEntity e=new VipDetailEntity();
			e.setId(uuid());
			e.setName(name);
			e.setTotalDiscountMoney(0);
			e.setTotalConsumeMoney(0);
			e.setLastConsumeTime(null);
			//账号使用手机号
			e.setMobile(mobile);
			e.setNo(mobile);
			e.setSex(sex);
			e.setBirthday(birthday);
			e.setQq(qq);
			e.setEmail(email);
			e.setAddress(address);
			e.setZipCode(zipCode);
			e.setRemark(remark);
			e.setRankId(parseInt(rankId));
		    AccountContext ac= (AccountContext) session.getAttribute(AccountContext.class.getName());
		    if(ac!=null){
			e.setCreateUserId(ac.getId());
		    }
			e.setCreateTime(LocalDateTime.now());
			vdao.insert(e);
	}

	@Override
	public VipDetailEntity queryVipByMobile(String mobile) throws Exception {
		//1 验证参数
		mobile=$("客户手机号",mobile);
		//2 业务逻辑
		//2.1 TODO:降低数据库压力，如果mobile符合手机号特征，则不进行数据库查找。
		//2.2 执行业务逻辑
			VipDetailEntity vip=vdao.select("mobile", mobile);
			return vip;
	}
	
	@Override
	public VipDetailEntity checkVipById(String id) throws Exception {
		//1 验证参数
				id=$("id",id);
				//2 业务逻辑
				//2.1 TODO:降低数据库压力，如果mobile符合手机号特征，则不进行数据库查找。
				//2.2 执行业务逻辑
					VipDetailEntity vip=vdao.select("id",id);
					if(vip==null){
					    throw new VipException("数据不存在");
                    }
					return vip;
	}

	@Override
	public QueryResult<VipDetailEntity> queryVipByKey(Integer rankId,String key, int pageNo, int pageSize) throws Exception {
		// 1 验证参数(参数清理)
		key = trim(key);
		if (key != null) {
			key = escapeForSqlLike(key);
			key="%"+key+"%";
		}
		if (pageNo <= 0) {
			pageNo = 1;
		}
		if (pageSize <= 0) {
			pageSize = 5;
		}
		// 2 执行业务逻辑
			PageHelper.startPage(pageNo, pageSize);
			
			PageInfo<VipDetailEntity> page=new PageInfo<>(vdao.selectByRankIdAndKey(rankId,key));
			// 3 组装结果
			QueryResult<VipDetailEntity> result=new QueryResult<VipDetailEntity>();
			result.setPageNo(pageNo);
			result.setRows(page.getList());
			result.setTotalRows(page.getTotal());
			result.setPageSize(pageSize);
			return result;
	}

	@Override
	@Transactional
	public void modifyVip(String id, @Valid VipAo ao) throws Exception {
		//验证参数
		if($(id)==null){
			throw  new NullPointerException("id为空");
		}
		Map<String,Object> map = new HashMap<>();

		//执行逻辑
		map.put("name",ao.getName());
		map.put("sex",ao.isSex());
		map.put("qq",ao.getQq());
		map.put("email",ao.getEmail());
		map.put("zipCode",ao.getZipCode());
		map.put("address",ao.getAddress());
		map.put("remark",ao.getRemark());
		//组装业务
		vdao.update(id,map);
	}

}
