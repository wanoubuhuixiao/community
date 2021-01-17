package com.ares.design.controller;

import cn.hutool.http.HtmlUtil;
import com.ares.design.domain.Article;
import com.ares.design.domain.Comment;
import com.ares.design.domain.User;
import com.ares.design.enums.Role;
import com.ares.design.service.ArticleService;
import com.ares.design.service.CommentService;
import com.ares.design.service.UserService;
import com.ares.design.util.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/deletecomment/{deletecommentid}/{articleid}")
    public String deleteComments(@PathVariable("deletecommentid") int deletecommentid,
                                 @PathVariable("articleid") int articleId
            , HttpServletRequest request, Model model, Comment comment) {
        //b把整个的comment拿过来看看对不对
        System.out.println("delete");
        System.out.println("deletecommentid:"+deletecommentid);
        System.out.println("articleId:"+articleId);

        commentService.deleteComment(deletecommentid);

        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("user", user);

        String returnurl="redirect:/article/" + articleId;
        System.out.println("articleId:" + articleId);
        System.out.println("returnurl:"+returnurl);
        return returnurl;
    }

    @PostMapping(value = "/replycomment")
    public String replyComments(HttpServletRequest request, Model model, Comment comment) {
        //把整个的comment拿过来看看对不对\
        System.out.println("reply");
        String commentPid = request.getParameter("commentPid");
        String commentPname = request.getParameter("commentPname");
        String articleId = request.getParameter("articleId");
        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userAvatar = request.getParameter("userAvatar");
        String replycommentcontent = request.getParameter("replycommentcontent");
        replycommentcontent = replycommentcontent.trim();

        comment.setCommentContent(replycommentcontent);
        comment.setCommentPname(commentPname);
        comment.setCommentPid(Integer.valueOf(commentPid));
        comment.setCommentArticleId(Integer.valueOf(articleId));
        comment.setCommentAuthorName(userName);
        comment.setCommentAuthorEmail(userEmail);
        comment.setCommentAuthorAvatar(userAvatar);
        comment.setCommentAuthorId(Integer.valueOf(userId));
        Article article=articleService.getArticleById(Integer.valueOf(articleId));
        comment.setArticle(article);

        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("user", user);

        comment.setCommentCreateTime(new Date());
        comment.setCommentIp(MyUtils.getIpAddr(request));

        if (request.getSession().getAttribute("user") != null) {
            comment.setCommentRole(Role.ADMIN.getValue());
        } else {
            comment.setCommentRole(Role.VISITOR.getValue());
        }
        comment.setCommentAuthorAvatar(MyUtils.getGravatar(comment.getCommentAuthorEmail()));

        //过滤字符，防止XSS攻击
        comment.setCommentContent(HtmlUtil.escape(comment.getCommentContent()));
        comment.setCommentAuthorName(HtmlUtil.escape(comment.getCommentAuthorName()));
        comment.setCommentAuthorEmail(HtmlUtil.escape(comment.getCommentAuthorEmail()));
        comment.setCommentAuthorUrl(HtmlUtil.escape(comment.getCommentAuthorUrl()));

        try {
            commentService.insertComment(comment);
            //更新文章的评论数,目前还没做
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        String returnurl="redirect:/article/" + articleId;
        System.out.println("articleId:" + articleId);
        System.out.println("returnurl:"+returnurl);
        return returnurl;
    }


    /**
     * '添加评论
     *
     * @param request
     * @param model
     * @param comment
     */
    @PostMapping(value = "/addcomments")
    public String addComment(HttpServletRequest request, Model model, Comment comment) {
        /*大的步骤：
        1、得到参数
                2、创建comment
                3.使用insert添加（以后会改）*/


        //获取user的所有信息
        //获取需求页面的信息
        String articleId = request.getParameter("articleId");
        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userAvatar = request.getParameter("userAvatar");
        String commentcontent = request.getParameter("commentcontent");



        //查看是否是省略了空格、
        // 换行
        commentcontent = commentcontent.trim();
        System.out.println("content:" + commentcontent);
        //String commentcontent = request.getParameter("commentcontent");

        //第一阶段完成
        System.out.println("function 1 done");

        comment.setCommentContent(commentcontent);
        comment.setCommentArticleId(Integer.valueOf(articleId));
        comment.setCommentAuthorName(userName);
        comment.setCommentAuthorEmail(userEmail);
        comment.setCommentAuthorAvatar(userAvatar);
        comment.setCommentAuthorId(Integer.valueOf(userId));
        comment.setCommentPname("");
        comment.setCommentPid(0);
        Article article=articleService.getArticleById(Integer.valueOf(articleId));
        comment.setArticle(article);


        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("user", user);

        comment.setCommentCreateTime(new Date());
        comment.setCommentIp(MyUtils.getIpAddr(request));

        if (request.getSession().getAttribute("user") != null) {
            comment.setCommentRole(Role.ADMIN.getValue());
        } else {
            comment.setCommentRole(Role.VISITOR.getValue());
        }
        comment.setCommentAuthorAvatar(MyUtils.getGravatar(comment.getCommentAuthorEmail()));

        //过滤字符，防止XSS攻击
        comment.setCommentContent(HtmlUtil.escape(comment.getCommentContent()));
        comment.setCommentAuthorName(HtmlUtil.escape(comment.getCommentAuthorName()));
        comment.setCommentAuthorEmail(HtmlUtil.escape(comment.getCommentAuthorEmail()));
        comment.setCommentAuthorUrl(HtmlUtil.escape(comment.getCommentAuthorUrl()));

        try {
            commentService.insertComment(comment);
            //更新文章的评论数,目前还没做
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        String returnurl="redirect:/article/" + articleId;
        System.out.println("articleId:" + articleId);
        System.out.println("returnurl:"+returnurl);
        return returnurl;
    }

    /**
     * 查找评论
     *
     * @param request
     * @param model
     * @param comment
     */
    @PostMapping(value = "/comments")
    public String insertComment(HttpServletRequest request, Model model, Comment comment) {
        //添加评论，此时需要用到Comment实体类

        String information = request.getParameter("information");
        System.out.println("information" + information);
        String type = request.getParameter("type");
        System.out.println("type" + type);
        int counts = 0;
        List<Comment> commentList = new ArrayList<Comment>();
        model.addAttribute("information", information);
        model.addAttribute("type", type);
        if (type.equals("1")) {
            //评论id
            commentList = Collections.singletonList(commentService.getCommentById(Integer.valueOf(information)));
            model.addAttribute("commentList", commentList);
            System.out.println("1");
        } else if (type.equals("2")) {
            //父评论
            commentList = commentService.listChildComment(Integer.valueOf(information));
            model.addAttribute("commentList", commentList);
            System.out.println("2");
        } else if (type.equals("3")) {
            //文章id
            commentList = commentService.listCommentByArticleId(Integer.valueOf(information));
            model.addAttribute("commentList", commentList);
            System.out.println("3");
        } else {
            //全部评论
            commentList = commentService.listComment();
            model.addAttribute("commentList", commentList);
            System.out.println("4");
        }
        System.out.println("commentList.size():" + commentList.size());
        counts = commentList.size();
        String count = String.valueOf(counts);
        System.out.println("count" + count);
        model.addAttribute("count", count);
        System.out.println("finish");
        System.out.println("comments" + commentList);
        return "comments";
    }


}
