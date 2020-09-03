package com.vip.service.impl;

import com.vip.ao.ModifyPasswordAo;
import com.vip.dao.SysAccountDao;
import com.vip.dto.AccountContext;
import com.vip.entity.SysAccountEntity;
import com.vip.service.UserAccountService;
import com.yizhuoyan.common.BeanMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserAccountServiceImpl implements UserAccountService {
	@Autowired
    SysAccountDao udao;
	@Override
	public AccountContext login(String account, String password) throws Exception {
		// 1
		account = $("账号", account);
		password = $("密码", password);

		// 2 执行业务逻辑
		SysAccountEntity u = udao.select("account", account);
		assertNotNull("账号和密码不匹配", u);
		assertEquals("账号和密码不匹配", u.getPassword(), password);

		AccountContext ac = new AccountContext();
		ac.setAccount(account);
		ac.setAvatar(u.getAvatar());
		ac.setId(u.getId());
		ac.setLastLoginIp(u.getLastLoginIp());
		ac.setName(u.getName());
		ac.setTimeCreate(u.getCreateTime());
		ac.setTimeLastLogin(u.getLastLoginTime());
		ac.setTimeLastAlterPassword(u.getLastModifyPasswordTime());
		return ac;
	}

	@Override
	@Transactional
	public void updatePassword(String id, ModifyPasswordAo ao)
			throws Exception {
		// 1 验证参数
		// 1.0 四个参数都不能为空
		id = $("id不能为空", id);
		String oldPassword = $("旧密码", ao.getOldPassword());
		String newPassword = $("新密码", ao.getNewPassword());
		String newPasswordConfirm = $("新密码确认", ao.getNewPasswordConfirm());
		// 1.1 两次密码一致 新密码是否符合规范(6-16位)
		assertEquals("两次密码不一致", newPassword, newPasswordConfirm);
			SysAccountEntity u = udao.select("id", id);
			// 1.2 id存在
			assertNotNull("id不存在", u);
			// 1.3 old密码必须和原密码一致
			assertEquals("旧密码错误", u.getPassword(), oldPassword);
			// 1.4 新密码不能和旧密码一样
			assertNotEquals("新密码不能和旧密码一样", oldPassword, newPassword);

			// 2 执行业务逻辑
			// 2.1 更新数据库

			udao.update(id, BeanMap.of("password", newPassword));
	}

	@Override
	public void modifyName(String id, String name) throws Exception {
		//1.参数验证
		id = $("id不能为空", id);
		name = $("账户名称", name);
		//判断id长度是否符合规范
		System.out.println(id);
		System.out.println(name);
		if (id.length() != 32) {
			throwException("id的长度不满足");
		}
		//判断id是否存在
		SysAccountEntity u = udao.select("id", id);
		System.out.println(u.getId());
		assertNotNull("id不存在", u);

		//2.执行业务逻辑
		Map<String,Object> map = new HashMap<>(16);
		map.put("name",name);
		udao.update(id,map);
		//组装业务
	}

}
