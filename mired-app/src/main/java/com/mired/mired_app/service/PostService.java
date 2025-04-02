package com.mired.mired_app.service;

import com.mired.mired_app.dto.PostDTO;
import com.mired.mired_app.model.Post;
import com.mired.mired_app.model.User;
import com.mired.mired_app.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    @Autowired
    private PostRepository postRepository;

    public Post create(PostDTO dto, User author) {
        Post post = new Post();
        post.setTitle(dto.getTitle());
        post.setCategory(dto.getCategory());
        post.setDescription(dto.getDescription());
        post.setAuthor(author);
        return postRepository.save(post);
    }

    public List<Post> getAll() {
        return postRepository.findAllByOrderByCreatedAtDesc();
    }

    public Post getById(Long id) {
        return postRepository.findById(id).orElse(null);
    }

    public Post update(Long id, PostDTO dto) {
        Post post = postRepository.findById(id).orElse(null);
        if (post != null) {
            post.setTitle(dto.getTitle());
            post.setCategory(dto.getCategory());
            post.setDescription(dto.getDescription());
            return postRepository.save(post);
        }
        return null;
    }

    public void delete(Long id) {
        postRepository.deleteById(id);
    }
}
