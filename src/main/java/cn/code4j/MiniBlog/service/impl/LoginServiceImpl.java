package cn.code4j.MiniBlog.service.impl;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.dao.ILoginDao;
import cn.code4j.MiniBlog.service.ILoginService;

public class LoginServiceImpl implements ILoginService {

	private ILoginDao dao;
	public void setDao(ILoginDao dao) {
		this.dao = dao;
	}
	
	@Override
	public User findUserByMsg(User user) {

		User nowUser = dao.findUserByMsg(user);
		
		if(nowUser != null){
			return nowUser;
		}else{
			return null;
		}
		
	}

}
