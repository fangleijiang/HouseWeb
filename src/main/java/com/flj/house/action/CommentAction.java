package com.flj.house.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.Comment;
import com.flj.house.model.HouseInfo;
import com.flj.house.service.CommentService;
import com.flj.house.service.HouseInfoService;

@Controller
@Scope("prototype")
public class CommentAction{

	private static final long serialVersionUID = 1L;
	
	private CommentService commentService;
	
	private HouseInfoService houseInfoService;

	public CommentService getCommentService() {
		return commentService;
	}

	@Resource
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	
	public HouseInfoService getHouseInfoService() {
		return houseInfoService;
	}

	@Resource
	public void setHouseInfoService(HouseInfoService houseInfoService) {
		this.houseInfoService = houseInfoService;
	}

	
	/**
	 * 用户评论
	 * @param request
	 * @param response
	 * @param house_id
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="addComments")
	public void addComments(HttpServletRequest request,
			HttpServletResponse response,int house_id) throws UnsupportedEncodingException{
		String str = URLDecoder.decode(request.getParameter("comments_word"),
				"UTF-8");
		JSONObject jb = new JSONObject();
		// 将json格式的字符串转换为json对象，并取得该对象的comments属性值
		String comment = (String) jb.fromObject(str).get("comments");
		String day = (String)jb.fromObject(str).get("day");
		HouseInfo houseInfo = this.houseInfoService.find_HouseInfo_By_id(house_id);
		System.out.println("======================="+comment);
		//System.out.println(comment+day);
		Comment cm = new Comment();
		cm.setComments(comment);
		cm.setDate(day);
		cm.setHouseInfo(houseInfo);
		this.commentService.save(cm);
		
	}
	
	/**
	 * admin遍历所有的评论
	 * @return
	 */
	@RequestMapping(value="admin/listAllComments")
	public ModelAndView listAllComments(){
		ModelAndView mav = new ModelAndView();
		List<Comment> list = this.commentService.List_Comment();
		mav.addObject("list", list);
		mav.setViewName("../admin_jsp/all_comments");
		return mav;
	}
	
	/**
	 * admin删除评论
	 * @param id
	 * @return
	 */
	@RequestMapping(value="admin/deleteComments")
	public String deleteComments(int id){
		Comment com = this.commentService.find_Comment_By_id(id);
		if(com!=null){
			this.commentService.delete(com);
		}
		return "redirect:listAllComments.action";
	}
	
}
