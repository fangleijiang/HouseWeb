package com.flj.house.service;

import java.util.List;

import com.flj.house.model.Cart;

public interface CartService {

	public void save(Cart cart);

	public void delete(Cart cart);

	public Cart find_Cart_By_id(int id);

	public List<Cart> List_Cart();

	public void update(Cart cart);
}
