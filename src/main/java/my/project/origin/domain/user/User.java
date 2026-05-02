package my.project.origin.domain.user;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import my.project.origin.domain.common.BaseTimeEntity;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "users")
public class User extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;        // 로그인과 연관 없는 DB 용 내부 식별자

    @Column(unique = true, nullable = false)
    private String username; // 사용자의 로그인 용 ID

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String nickname;    // 표시용 사용자명(중복 가능)

    // create
    public User(String username, String password, String nickname) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
    }

    public static User create(String username, String password, String nickname) {
        User user = new User();
        user.username = username;
        user.password = password;
        user.nickname = nickname;
        return user;
    }

}