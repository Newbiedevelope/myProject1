package my.project.origin.api.board.controller;


import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import my.project.origin.api.user.domain.User;
import my.project.origin.api.board.dto.BoardCreateRequest;
import my.project.origin.api.board.dto.BoardSearchCondition;
import my.project.origin.api.category.service.CategoryService;
import my.project.origin.api.board.service.BoardService;
import my.project.origin.api.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/posts")
@RequiredArgsConstructor
public class BoardViewController {

    private final BoardService boardService;
    private final UserService userService;
    private final CategoryService categoryService;

    @GetMapping
    public String list(Model model, HttpSession session) {
        model.addAttribute("postList", boardService.getPosts());
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
        model.addAttribute("post", boardService.getPost(postId));
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
    public String write(BoardCreateRequest request, HttpSession session) {

        boardService.createPost(request, (Long)session.getAttribute("LOGIN_USER"));

        return "redirect:/posts";
    }

    // 내 게시글 관리
    @GetMapping("/myposts")
    public String myPosts(HttpSession session, Model model) {
        Long loginUserId = (Long) session.getAttribute("LOGIN_USER");

        if (loginUserId == null) {
            return "redirect:/users/login";
        }

        BoardSearchCondition condition = new BoardSearchCondition();

        condition.setUserId(loginUserId);

        model.addAttribute("postList", boardService.search(condition));

        return "posts/myposts";
    }

}
