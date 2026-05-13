package my.project.origin.api.board.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class BoardListResponse {
    private Long postId;
    private String title;
    private String content;
    private String nickname;
    private String categoryName;
    private LocalDateTime createdAt;
}
