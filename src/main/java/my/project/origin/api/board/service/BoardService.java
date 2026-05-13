package my.project.origin.api.board.service;

import my.project.origin.api.board.dto.BoardCreateRequest;
import my.project.origin.api.board.dto.BoardDetailResponse;
import my.project.origin.api.board.dto.BoardListResponse;
import my.project.origin.api.board.dto.BoardSearchCondition;

import java.util.List;

public interface BoardService {
    
    // 게시글 검색
    List<BoardListResponse> search(BoardSearchCondition condition);

    // 게시글 작성
    Long createPost(BoardCreateRequest request, Long userId);

    // 다중 조회
    List<BoardListResponse> getPosts();

    // 단일 조회
    BoardDetailResponse getPost(Long postId);
}
