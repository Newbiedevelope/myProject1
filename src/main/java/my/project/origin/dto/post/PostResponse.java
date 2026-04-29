package my.project.origin.dto.post;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PostResponse {
    private Long postId;
    private String title;
    private String content;
    private String nickname;
    private String categoryName;
}
