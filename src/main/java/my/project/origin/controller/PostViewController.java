package my.project.origin.controller;


import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import my.project.origin.domain.user.User;
import my.project.origin.service.categoryService.CategoryService;
import my.project.origin.service.postService.PostService;
import my.project.origin.service.userService.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    @GetMapping("/write")
    public String writePage(HttpSession session, Model model) {
        Long loginUserId = (Long) session.getAttribute("LOGIN_USER");

        if (loginUserId == null) {
            return "redirect:/users/login";
        }

        model.addAttribute("categoryList", categoryService.getCategories());

        return "posts/write";
    }

}
