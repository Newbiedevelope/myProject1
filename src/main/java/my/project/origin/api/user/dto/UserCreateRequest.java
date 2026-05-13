package my.project.origin.api.user.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreateRequest {

    private String username;
    private String password;
    private String nickname;

}
