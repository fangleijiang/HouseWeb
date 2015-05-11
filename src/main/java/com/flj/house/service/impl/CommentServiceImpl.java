package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.CommentDao;
import com.flj.house.model.Comment;
import com.flj.house.service.CommentService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class CommentServiceImpl implements CommentService {
	
	private CommentDao commentdao;
	

	public CommentDao getCommentdao() {
		return commentdao;
	}

	@Resource
	public void setCommentdao(CommentDao commentdao) {
		this.commentdao = commentdao;
	}

	@Override
	public void save(Comment comment) {
		this.commentdao.add(comment);
	}

	@Override
	public void delete(Comment comment) {
		this.commentdao.delete(comment);
	}

	@Override
	public Comment find_Comment_By_id(int id) {
		return this.commentdao.getById(id);
	}

	@Override
	public List<Comment> List_Comment() {
		String sql = "from Comment comment order by comment.id desc";
		return this.commentdao.listAll(sql);
	}

	@Override
	public void update(Comment comment) {
		this.commentdao.update(comment);
	}

}
