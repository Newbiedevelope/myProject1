package my.project.origin.api.board.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardCreateRequest {

    private String title;
    private String content;
    private Long categoryId;

}
