package cn.code4j.MiniBlog.dao;

import java.util.Map;

public interface IModifyPwdDao {

	int updatePwdByUac(Map<String, String> map);

}
