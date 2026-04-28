package my.project.origin.service.userService;

import my.project.origin.dto.user.UserCreateRequest;

public interface UserService {
    Long createUser(UserCreateRequest request);
}
