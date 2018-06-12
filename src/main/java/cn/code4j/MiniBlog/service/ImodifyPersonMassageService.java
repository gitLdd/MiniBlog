package cn.code4j.MiniBlog.service;

public interface ImodifyPersonMassageService {

	int updateNickByUid(int uid, String nick);

	int updateSexByUid(int uid, String sex);

	int updateShanChangByUid(int uid, String sC);

	int updateGeQianByUid(int uid, String gQ);

	int updatePWDByUid(int uid, String pwd);

}
