package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.ImpeachDao;
import com.flj.house.model.Impeach;
import com.flj.house.service.ImpeachService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class ImpeachServiceImpl implements ImpeachService {

	private ImpeachDao impeachdao;
	
	
	public ImpeachDao getImpeachdao() {
		return impeachdao;
	}

	@Resource
	public void setImpeachdao(ImpeachDao impeachdao) {
		this.impeachdao = impeachdao;
	}

	@Override
	public void save(Impeach impeach) {
		this.impeachdao.add(impeach);
	}

	@Override
	public void delete(Impeach impeach) {
		this.impeachdao.delete(impeach);
	}

	@Override
	public Impeach find_Impeach_By_id(int id) {
		return this.impeachdao.getById(id);
	}

	@Override
	public List<Impeach> List_Impeach() {
		String sql = "from Impeach impeach order by impeach desc";
		return this.impeachdao.listAll(sql);
	}

	@Override
	public void update(Impeach impeach) {
		this.impeachdao.update(impeach);
	}

}
