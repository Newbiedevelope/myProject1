package my.project.origin.controller;

import lombok.RequiredArgsConstructor;
import my.project.origin.dto.user.UserCreateRequest;
import my.project.origin.dto.user.UserCreateResponse;
import my.project.origin.service.userService.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    @PostMapping
    public UserCreateResponse createUser(@RequestBody UserCreateRequest request) {
        Long userId = userService.createUser(request);
        return new UserCreateResponse(userId);
    }

}
