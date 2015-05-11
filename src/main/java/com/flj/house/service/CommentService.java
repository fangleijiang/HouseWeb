package com.flj.house.service;

import java.util.List;

import com.flj.house.model.Comment;

public interface CommentService {
	public void save(Comment comment);

	public void delete(Comment comment);

	public Comment find_Comment_By_id(int id);

	public List<Comment> List_Comment();

	public void update(Comment comment);

}
