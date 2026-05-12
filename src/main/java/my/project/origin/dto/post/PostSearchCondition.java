package my.project.origin.dto.post;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostSearchCondition {

    private String title;
    private String content;
    private String nickname;
    private String categoryName;
    private Long userId;
}
