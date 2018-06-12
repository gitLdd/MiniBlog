package cn.code4j.MiniBlog.service.impl;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.dao.IFastRegisterDao;
import cn.code4j.MiniBlog.service.IfastRegisterService;

public class fastRegisterServiceImpl implements IfastRegisterService {

	private IFastRegisterDao dao;
	public void setDao(IFastRegisterDao dao) {
		this.dao = dao;
	}
	
	@Override
	public boolean repeatabilityTest(String account) {
		
		User user = dao.repeatabilityTest(account);
		
		if(user != null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int userRegister(User user) {

		int result = dao.userRegister(user);
		return result;
	}

	@Override
	public User findUserByEmail(String uEmail) {
		return dao.selectUserByEmail(uEmail);
	}

}
