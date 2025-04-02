package com.mired.mired_app.controller;


import com.mired.mired_app.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import com.mired.mired_app.service.FriendshipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FriendshipController {

    @Autowired
    private FriendshipService friendshipService;

    @GetMapping("/friends")
    public String viewFriends(@RequestParam(value = "search", required = false) String search, Model model, HttpSession session) {
        User user = (User) session.getAttribute("usuario");
        if (search != null && !search.isEmpty()) {
            model.addAttribute("results", friendshipService.searchUsers(search, user.getId()));
        }
        model.addAttribute("pending", friendshipService.getPendingRequests(user));
        model.addAttribute("friends", friendshipService.getFriends(user));
        return "friends";
    }

    @PostMapping("/friends/send/{id}")
    public String sendRequest(@PathVariable Long id, HttpSession session) {
        User user = (User) session.getAttribute("usuario");
        friendshipService.sendRequest(user.getId(), id);
        return "redirect:/friends";
    }

    @PostMapping("/friends/accept/{id}")
    public String accept(@PathVariable Long id) {
        friendshipService.acceptRequest(id);
        return "redirect:/friends";
    }

    @PostMapping("/friends/reject/{id}")
    public String reject(@PathVariable Long id) {
        friendshipService.rejectRequest(id);
        return "redirect:/friends";
    }

    @PostMapping("/friends/delete/{id}")
    public String delete(@PathVariable Long id) {
        friendshipService.deleteFriendship(id);
        return "redirect:/friends";
    }
}
