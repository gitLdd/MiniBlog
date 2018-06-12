package cn.code4j.MiniBlog.handlers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.Contact;
import cn.code4j.MiniBlog.service.IContactService;

@Controller
@RequestMapping("/contact")

public class contactHandler {
	
	//两种不同的注解，但是效果相差不多
	  @Autowired
    /*    @Resource(name="IContactService")
    */	
	private IContactService service;
	public void setService(IContactService service) {
		this.service = service;
	}
	@RequestMapping("/queryContact.do")
	public String queryContact(Contact contact){
		service.insertContact(contact);
		return "redirect:/jsp/contact.jsp";
	}
	
	

}
