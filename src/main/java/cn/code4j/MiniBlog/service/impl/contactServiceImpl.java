package cn.code4j.MiniBlog.service.impl;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Contact;
import cn.code4j.MiniBlog.dao.IContactDao;
import cn.code4j.MiniBlog.service.IContactService;

public class contactServiceImpl implements IContactService {
	private IContactDao dao;

	public void setDao(IContactDao dao) {
		this.dao = dao;
	}

	@Override
	public void insertContact(Contact contact) {
		dao.insertContact(contact);
	}

}
