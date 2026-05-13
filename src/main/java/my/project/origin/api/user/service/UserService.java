package my.project.origin.api.user.service;

import my.project.origin.api.user.domain.User;
import my.project.origin.api.user.dto.UserCreateRequest;

public interface UserService {
    Long createUser(UserCreateRequest request);
    
    // 아이디(username) 중복검사
    boolean existsByUsername(String username);

    // login 메서드
    User login(String username, String password);

    User findById(Long userId);
}
