package my.project.origin.api.user.service;

import lombok.RequiredArgsConstructor;
import my.project.origin.api.user.domain.User;
import my.project.origin.api.user.dto.UserCreateRequest;
import my.project.origin.api.user.repository.UserRepository;
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

    @Override
    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    @Override
    public User login(String username, String password) {

        User user = userRepository.findByUsername(username)
                .orElseThrow(() ->
                        new IllegalArgumentException("아이디 없음"));

        if (!user.getPassword().equals(password)) {
            throw new IllegalArgumentException("비밀번호 불일치");
        }

        return user;
    }

    @Override
    public User findById(Long userId) {

        return userRepository.findById(userId).orElseThrow(
                () -> new IllegalArgumentException("존재하지 않는 회원"));
    }
}
