package my.project.origin.controller;

import lombok.RequiredArgsConstructor;
import my.project.origin.service.userService.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/users")
public class UserViewController {

    private final UserService userService;

    @GetMapping("/join")
    public String joinPage() {
        return "user/join";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "users/login";
    }
}
