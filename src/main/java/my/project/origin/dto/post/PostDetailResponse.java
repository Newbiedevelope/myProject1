package my.project.origin.dto.post;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class PostDetailResponse {
    private Long postId;
    private String title;
    private String nickname;
    private String categoryName;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
