package my.project.origin.api.board.repository;

import my.project.origin.api.board.domain.Board;
import my.project.origin.api.board.dto.BoardSearchCondition;

import java.util.List;

public interface BoardRepositoryCustom {
    // 게시글의 제목, 내용, 카테고리, 작성자로 검색할 수 있는 메서드
    List<Board> search(BoardSearchCondition condition);
}
