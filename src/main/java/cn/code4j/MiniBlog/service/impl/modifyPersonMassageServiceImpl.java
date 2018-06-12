package cn.code4j.MiniBlog.service.impl;

import cn.code4j.MiniBlog.dao.IMdfUserMsgDao;
import cn.code4j.MiniBlog.service.ImodifyPersonMassageService;

public class modifyPersonMassageServiceImpl implements ImodifyPersonMassageService {

	IMdfUserMsgDao dao;
	public void setDao(IMdfUserMsgDao dao) {
		this.dao = dao;
	}
	
	@Override
	public int updateNickByUid(int uid,String nick) {
		return dao.updateNickByUid(uid,nick);
	}

	@Override
	public int updateSexByUid(int uid, String sex) {
		return dao.updateSexByUid(uid,sex);
	}

	@Override
	public int updateShanChangByUid(int uid, String sC) {
		return dao.updateShanChangByUid(uid,sC);
	}

	@Override
	public int updateGeQianByUid(int uid, String gQ) {
		return dao.updateGeQianByUid(uid,gQ);
	}

	@Override
	public int updatePWDByUid(int uid, String pwd) {
		return dao.updatePWDByUid(uid,pwd);
	}

}
