package my.project.origin.repository.userRepository;

import my.project.origin.domain.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

//@Repository JpaRepository 를 상속받았기 때문에 생략 가능
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUsername(String username);

    boolean existsByUsername(String username);

}
