package my.project.origin.controller;

import lombok.RequiredArgsConstructor;
import my.project.origin.domain.post.Post;
import my.project.origin.dto.post.PostCreateRequest;
import my.project.origin.dto.post.PostCreateResponse;
import my.project.origin.dto.post.PostResponse;
import my.project.origin.dto.post.PostSearchCondition;
import my.project.origin.service.postService.PostService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/posts")
public class PostController {

    private final PostService postService;

    // 검색 컨트롤러
    @GetMapping("/search")
    public List<PostResponse> search(PostSearchCondition condition) {
        return postService.search(condition);
    }

    // 게시글 생성 컨트롤러
    @PostMapping
    public PostCreateResponse createPost(@RequestBody PostCreateRequest request) {
        Long postId = postService.createPost(request);
        return new PostCreateResponse(postId);
    }

    // 단일 조회 컨트롤러
    @GetMapping("/{postId}")
    public PostResponse getPost(@PathVariable Long postId) {
        return postService.getPost(postId);
    }

    // 다중 조회 컨트롤러
    @GetMapping
    public List<PostResponse> getPosts() {
        return postService.getPosts();
    }

}
