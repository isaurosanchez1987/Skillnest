package com.mired.mired_app.controller;

import com.mired.mired_app.model.Post;
import com.mired.mired_app.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import com.mired.mired_app.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private PostService postService;

    @GetMapping({"/", "/home"})
    public String home(Model model, HttpSession session) {
        User user = (User) session.getAttribute("usuario");
        if (user == null) {
            return "redirect:/login";
        }
        List<Post> posts = postService.getAll();
        model.addAttribute("posts", posts);
        return "home";
    }
}
