package my.project.origin.domain.user;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;        // 로그인과 연관 없는 DB 용 내부 식별자

    @Column(unique = true, nullable = false)
    private String userName; // 사용자의 로그인 용 ID

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String nickname;    // 표시용 사용자명(중복 가능)

    // create
    public User(String userName, String nickname, String password) {
        this.userName = userName;
        this.nickname = nickname;
        this.password = password;
    }

}