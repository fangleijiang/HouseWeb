package com.flj.house.service;

import java.util.List;

import com.flj.house.model.Impeach;

public interface ImpeachService {

	public void save(Impeach impeach);

	public void delete(Impeach impeach);

	public Impeach find_Impeach_By_id(int id);

	public List<Impeach> List_Impeach();

	public void update(Impeach impeach);

}
