package com.mired.mired_app.controller;

import com.mired.mired_app.dto.PostDTO;
import com.mired.mired_app.dto.UserDTO;
import com.mired.mired_app.model.Post;
import com.mired.mired_app.model.User;
import com.mired.mired_app.service.PostService;
import com.mired.mired_app.service.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    @GetMapping("/login")
    public String loginForm(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "login";
    }

    // 🆕 Método para manejar el login manual
    @PostMapping("/login")
    public String login(@ModelAttribute("userDTO") UserDTO dto, Model model, HttpSession session) {
        User user = userService.authenticate(dto.getEmail(), dto.getPassword());
        if (user == null) {
            model.addAttribute("error", "Correo o contraseña incorrectos");
            return "login";
        }
        session.setAttribute("usuario", user);
        return "redirect:/home";
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("userDTO") UserDTO dto, BindingResult result, HttpSession session, Model model) {
        if (result.hasErrors()) {
            return "register";
        }

        if (userService.emailExists(dto.getEmail())) {
            model.addAttribute("error", "Este correo ya está registrado.");
            return "register";
        }

        User user = userService.register(dto);
        session.setAttribute("usuario", user);
        return "redirect:/home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/post_details/{id}")
    public String detallePublicacion(@PathVariable Long id, Model model, HttpSession session) {
        Post post = postService.getById(id);
        if (post == null) {
            return "redirect:/home";
        }
        model.addAttribute("post", post);
        return "post_detail"; // JSP ubicado en /WEB-INF/views/post_details.jsp
    }

    @GetMapping("/post_edit/{id}")
    public String editarPublicacion(@PathVariable Long id, Model model, HttpSession session) {
        Post post = postService.getById(id);
        if (post == null) {
            return "redirect:/home";
        }

        model.addAttribute("post", post);
        return "post_edit"; // el JSP que ya tienes
    }

    @PostMapping("/post_edit/{id}")
    public String actualizarPublicacion(@PathVariable Long id, @ModelAttribute Post post, HttpSession session) {
        postService.update(id, new PostDTO(post.getTitle(), post.getCategory(), post.getDescription()));
        return "redirect:/home";
    }

    @GetMapping("/post/create")
    public String mostrarFormularioPublicacion(Model model) {
        model.addAttribute("postDTO", new PostDTO());
        return "post_create"; // debe coincidir con el nombre del JSP: post_create.jsp
    }

    @PostMapping("/post/create")
    public String crearPublicacion(@ModelAttribute PostDTO postDTO, HttpSession session) {
        User usuario = (User) session.getAttribute("usuario");
        if (usuario == null) {
            return "redirect:/login";
        }

        postService.create(postDTO, usuario);
        return "redirect:/home";
    }
}