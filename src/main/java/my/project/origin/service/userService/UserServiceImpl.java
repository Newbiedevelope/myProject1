package my.project.origin.service.userService;

import lombok.RequiredArgsConstructor;
import my.project.origin.domain.user.User;
import my.project.origin.dto.user.UserCreateRequest;
import my.project.origin.repository.userRepository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class UserServiceImpl implements UserService{

    private final UserRepository userRepository;

    @Override
    public Long createUser(UserCreateRequest request) {
        User user = User.create(
                request.getUsername()
                , request.getPassword()
                , request.getNickname()
        );

        return userRepository.save(user).getId();
    }//close createUser()
}
