package cn.code4j.MiniBlog.service.impl;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.dao.IFastRegisterDao;
import cn.code4j.MiniBlog.dao.IRoutineRegisterDao;
import cn.code4j.MiniBlog.service.IroutineRegisterService;

public class routineRegisterServiceImpl implements IroutineRegisterService {

	private IRoutineRegisterDao dao;
	private IFastRegisterDao fastRegdao;
	public void setDao(IRoutineRegisterDao dao) {
		this.dao = dao;
	}
	public void setFastRegdao(IFastRegisterDao fastRegdao) {
		this.fastRegdao = fastRegdao;
	}
	
	
	@Override
	public boolean uNickCheck(String uNick) {
		
		User user = dao.getUserByNick(uNick);
		
		if(user != null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int insertUser(User user) {

		return fastRegdao.userRegister(user);
		
	}

}
