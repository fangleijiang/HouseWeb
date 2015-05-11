package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.CartDao;
import com.flj.house.model.Cart;
import com.flj.house.service.CartService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class CartServiceImpl implements CartService {

	private CartDao cartdao;

	public CartDao getCartdao() {
		return cartdao;
	}

	@Resource
	public void setCartdao(CartDao cartdao) {
		this.cartdao = cartdao;
	}

	@Override
	public void save(Cart cart) {
		this.cartdao.add(cart);
	}

	@Override
	public void delete(Cart cart) {
		this.cartdao.delete(cart);
	}

	@Override
	public Cart find_Cart_By_id(int id) {
		return this.cartdao.getById(id);
	}

	@Override
	public List<Cart> List_Cart() {
		String sql = "from Cart cart order by cart.id desc";
		return this.cartdao.listAll(sql);
	}

	@Override
	public void update(Cart cart) {
		this.cartdao.update(cart);
	}

}
