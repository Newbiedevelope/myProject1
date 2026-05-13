package my.project.origin.api.board.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardSearchCondition {

    private String title;
    private String content;
    private String nickname;
    private String categoryName;
    private Long userId;
}
