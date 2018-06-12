package cn.code4j.MiniBlog.service.impl;

import java.util.HashMap;
import java.util.Map;

import cn.code4j.MiniBlog.dao.IModifyPwdDao;
import cn.code4j.MiniBlog.service.ImodifyPasswordService;

public class modifyPasswordServiceImpl implements ImodifyPasswordService {

	private IModifyPwdDao dao;
	public void setDao(IModifyPwdDao dao) {
		this.dao = dao;
	}
	
	@Override
	public int modifyPassword(String uEmail, String newPwd) {
		Map<String, String> map = new HashMap<>();
		map.put("uEmail", uEmail);
		map.put("newPwd", newPwd);
		
		return dao.updatePwdByUac(map);
		
	}

}
