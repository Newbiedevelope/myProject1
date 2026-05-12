package my.project.origin.controller;


import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import my.project.origin.domain.user.User;
import my.project.origin.dto.post.PostCreateRequest;
import my.project.origin.dto.post.PostSearchCondition;
import my.project.origin.service.categoryService.CategoryService;
import my.project.origin.service.postService.PostService;
import my.project.origin.service.userService.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/posts")
@RequiredArgsConstructor
public class PostViewController {

    private final PostService postService;
    private final UserService userService;
    private final CategoryService categoryService;

    @GetMapping
    public String list(Model model, HttpSession session) {
        model.addAttribute("postList", postService.getPosts());
        Long loginUserId = (Long) session.getAttribute("LOGIN_USER");
        if (loginUserId != null) {

            User user = userService.findById(loginUserId);

            model.addAttribute(
                    "loginNickname",
                    user.getNickname()
            );
        }

        return "posts/home";
    }

    @GetMapping("/{postId}")
    public String detail(@PathVariable Long postId, Model model) {
        model.addAttribute("post", postService.getPost(postId));
        return "posts/postDetail";
    }

    // 게시글 작성 페이지
    @GetMapping("/write")
    public String writePage(HttpSession session, Model model) {
        Long loginUserId = (Long) session.getAttribute("LOGIN_USER");

        if (loginUserId == null) {
            return "redirect:/users/login";
        }

        model.addAttribute("categoryList", categoryService.getCategories());

        return "posts/write";
    }

    // 실제 게시글 작성
    @PostMapping("/write")
    public String write(PostCreateRequest request, HttpSession session) {

        postService.createPost(request, (Long)session.getAttribute("LOGIN_USER"));

        return "redirect:/posts";
    }

    // 내 게시글 관리
    @GetMapping("/myposts")
    public String myPosts(HttpSession session, Model model) {
        Long loginUserId = (Long) session.getAttribute("LOGIN_USER");

        if (loginUserId == null) {
            return "redirect:/users/login";
        }

        PostSearchCondition condition = new PostSearchCondition();

        condition.setUserId(loginUserId);

        model.addAttribute("postList", postService.search(condition));

        return "posts/myposts";
    }

}
