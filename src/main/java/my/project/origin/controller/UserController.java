package my.project.origin.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import my.project.origin.domain.user.User;
import my.project.origin.dto.user.LoginRequest;
import my.project.origin.dto.user.UserCreateRequest;
import my.project.origin.dto.user.UserCreateResponse;
import my.project.origin.service.userService.UserService;
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
