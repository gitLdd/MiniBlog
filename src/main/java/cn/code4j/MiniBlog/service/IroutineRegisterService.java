package cn.code4j.MiniBlog.service;

import cn.code4j.MiniBlog.commons.beans.User;

public interface IroutineRegisterService {

	boolean uNickCheck(String uNick);

	int insertUser(User user);

}
