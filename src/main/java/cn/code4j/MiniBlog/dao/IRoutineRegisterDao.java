package cn.code4j.MiniBlog.dao;

import cn.code4j.MiniBlog.commons.beans.User;

public interface IRoutineRegisterDao {

	User getUserByNick(String uNick);

}
