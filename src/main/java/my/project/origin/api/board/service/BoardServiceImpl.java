package my.project.origin.api.board.service;

import lombok.RequiredArgsConstructor;
import my.project.origin.api.board.domain.Board;
import my.project.origin.api.category.domain.Category;
import my.project.origin.api.user.domain.User;
import my.project.origin.api.board.dto.BoardCreateRequest;
import my.project.origin.api.board.dto.BoardDetailResponse;
import my.project.origin.api.board.dto.BoardListResponse;
import my.project.origin.api.board.dto.BoardSearchCondition;
import my.project.origin.api.category.repository.CategoryRepository;
import my.project.origin.api.board.repository.BoardRepository;
import my.project.origin.api.user.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardServiceImpl implements BoardService {

    private final BoardRepository boardRepository;
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;

    @Override
    @Transactional(readOnly = true)
    public List<BoardListResponse> search(BoardSearchCondition condition) {
        return boardRepository.search(condition).stream()
                .map(post -> new BoardListResponse(
                        post.getId()
                        , post.getTitle()
                        , post.getContent()
                        , post.getUser().getNickname()
                        , post.getCategory().getName()
                        , post.getCreatedAt()
                ))
                .toList();
    }//close search()

    @Override
    public Long createPost(BoardCreateRequest request, Long userId) {

        // 유저 조회
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자입니다."));

        // 카테고리 조회
        Category category = categoryRepository.findById(request.getCategoryId())
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 카테고리입니다."));

        // 게시글 생성
        Board board = Board.create(
                request.getTitle()
                , request.getContent()
                , user
                , category
        );

        // 저장
        Board savedBoard = boardRepository.save(board);

        return savedBoard.getId();
    }//close createPost()

    @Override
    @Transactional(readOnly = true)
    public List<BoardListResponse> getPosts() {

        return boardRepository.findAll().stream()
                .map(post -> new BoardListResponse(
                        post.getId()
                        , post.getTitle()
                        , post.getContent()
                        , post.getUser().getNickname()
                        , post.getCategory().getName()
                        , post.getCreatedAt()
                ))
                .toList();

    }//close getPosts() - 다중 조회

    @Override
    public BoardDetailResponse getPost(Long postId) {

        Board board = boardRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시글입니다."));

        return new BoardDetailResponse(
                board.getId()
                , board.getTitle()
                , board.getContent()
                , board.getUser().getNickname()
                , board.getCategory().getName()
                , board.getCreatedAt()
                , board.getUpdatedAt()
        );
    }//close getPost() - 단일 조회
}
