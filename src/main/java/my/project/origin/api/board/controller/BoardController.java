package my.project.origin.api.board.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import my.project.origin.api.board.dto.*;
import my.project.origin.board.dto.*;
import my.project.origin.api.category.service.CategoryService;
import my.project.origin.api.board.service.BoardService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/posts")
public class BoardController {

    private final BoardService boardService;
    private final CategoryService categoryService;

    // 검색 컨트롤러
    @GetMapping("/search")
    public List<BoardListResponse> search(BoardSearchCondition condition) {
        return boardService.search(condition);
    }

    // 게시글 생성 컨트롤러
    @PostMapping
    public BoardCreateResponse createPost(@RequestBody BoardCreateRequest request, HttpSession session) {
        Long postId = boardService.createPost(request, (Long)session.getAttribute("LOGIN_USER"));
        return new BoardCreateResponse(postId);
    }

    // 단일 조회 컨트롤러
    @GetMapping("/{postId}")
    public BoardDetailResponse getPost(@PathVariable Long postId) {
        return boardService.getPost(postId);
    }

    // 다중 조회 컨트롤러
    @GetMapping
    public List<BoardListResponse> getPosts() {
        return boardService.getPosts();
    }

}
