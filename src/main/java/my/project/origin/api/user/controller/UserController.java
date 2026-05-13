package my.project.origin.api.user.controller;

import lombok.RequiredArgsConstructor;
import my.project.origin.api.user.dto.UserCreateRequest;
import my.project.origin.api.user.dto.UserCreateResponse;
import my.project.origin.api.user.service.UserService;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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

    @GetMapping("/check-username")
    public Map<String, Boolean> checkUsername(@RequestParam String username) {
        boolean exists = userService.existsByUsername(username);

        return Map.of("available", !exists);
    }
}
