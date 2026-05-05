package my.project.origin.controller;


import lombok.RequiredArgsConstructor;
import my.project.origin.service.postService.PostService;
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

    @GetMapping()
    public String list(Model model) {
        model.addAttribute("postList", postService.getPosts());
        return "posts/home";
    }

    @GetMapping("/{postId}")
    public String detail(@PathVariable Long postId, Model model) {
        model.addAttribute("post", postService.getPost(postId));
        return "posts/postDetail";
    }

}
