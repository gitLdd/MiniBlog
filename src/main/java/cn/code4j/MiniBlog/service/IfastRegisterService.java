package cn.code4j.MiniBlog.service;

import cn.code4j.MiniBlog.commons.beans.User;

public interface IfastRegisterService {

	boolean repeatabilityTest(String account);

	int userRegister(User user);

	User findUserByEmail(String uEmail);

}
