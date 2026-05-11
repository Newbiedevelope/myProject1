package my.project.origin.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import my.project.origin.dto.post.*;
import my.project.origin.service.categoryService.CategoryService;
import my.project.origin.service.postService.PostService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/posts")
public class PostController {

    private final PostService postService;
    private final CategoryService categoryService;

    // 검색 컨트롤러
    @GetMapping("/search")
    public List<PostListResponse> search(PostSearchCondition condition) {
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
    public PostDetailResponse getPost(@PathVariable Long postId) {
        return postService.getPost(postId);
    }

    // 다중 조회 컨트롤러
    @GetMapping
    public List<PostListResponse> getPosts() {
        return postService.getPosts();
    }

    @GetMapping("/write")
    public String writeForm(HttpSession session, Model model) {
        Long loginUserId = (Long) session.getAttribute("LOGIN_USER");

        if (loginUserId == null) {
            return "redirect:/users/login";
        }

        model.addAttribute("categoryList", categoryService.getCategories());

        return "posts/write";
    }

}
