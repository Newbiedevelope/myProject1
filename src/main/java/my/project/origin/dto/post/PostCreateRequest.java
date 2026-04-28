package my.project.origin.dto.post;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostCreateRequest {

    private String title;
    private String content;
    private String username;
    private Long categoryId;

}
