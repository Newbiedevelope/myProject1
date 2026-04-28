package my.project.origin.controller;

import lombok.RequiredArgsConstructor;
import my.project.origin.domain.post.Post;
import my.project.origin.dto.post.PostCreateRequest;
import my.project.origin.dto.post.PostCreateResponse;
import my.project.origin.dto.post.PostSearchCondition;
import my.project.origin.service.postService.PostService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/posts")
public class PostController {

    private final PostService postService;

    @GetMapping("/search")
    public List<Post> search(PostSearchCondition condition) {
        return postService.search(condition);
    }

    @PostMapping
    public PostCreateResponse createPost(@RequestBody PostCreateRequest request) {
        Long postId = postService.createPost(request);
        return new PostCreateResponse(postId);
    }
}
