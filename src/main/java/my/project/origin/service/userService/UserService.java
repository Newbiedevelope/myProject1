package my.project.origin.service.userService;

import my.project.origin.domain.user.User;
import my.project.origin.dto.user.UserCreateRequest;

public interface UserService {
    Long createUser(UserCreateRequest request);
    
    // 아이디(username) 중복검사
    boolean existsByUsername(String username);

    // login 메서드
    User login(String username, String password);
}
