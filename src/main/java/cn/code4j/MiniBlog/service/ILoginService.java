package cn.code4j.MiniBlog.service;

import cn.code4j.MiniBlog.commons.beans.User;

public interface ILoginService {

	User findUserByMsg(User user);
	
}
