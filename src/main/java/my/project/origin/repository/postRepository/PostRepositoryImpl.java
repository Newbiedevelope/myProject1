package my.project.origin.repository.postRepository;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import my.project.origin.domain.category.QCategory;
import my.project.origin.domain.post.Post;
import my.project.origin.domain.post.QPost;
import my.project.origin.domain.user.QUser;
import my.project.origin.dto.post.PostSearchCondition;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class PostRepositoryImpl implements PostRepositoryCustom{

        private final JPAQueryFactory queryFactory;

        @Override
        public List<Post> search(PostSearchCondition condition) {

            QPost post = QPost.post;
            QUser user = QUser.user;
            QCategory category = QCategory.category;

            return queryFactory
                    .selectFrom(post)
                    .leftJoin(post.user, user)
                    .fetchJoin() // N+1 방지 (작성자)
                    .leftJoin(post.category, category)
                    .fetchJoin() // N+1 방지 (카테고리)
                    .where(
                            titleContains(condition.getTitle()),
                            contentContains(condition.getContent()),
                            nicknameEq(condition.getNickname()),
                            categoryNameEq(condition.getCategoryName())
                    )
                    .fetch();
        }

        // 조건 메서드들
        private BooleanExpression titleContains(String title) {
            return (title != null && !title.isBlank())
                    ? QPost.post.title.contains(title)
                    : null;
        }

        private BooleanExpression contentContains(String content) {
            return (content != null && !content.isBlank())
                    ? QPost.post.content.contains(content)
                    : null;
        }

        private BooleanExpression nicknameEq(String nickname) {
            return (nickname != null && !nickname.isBlank())
                    ? QUser.user.nickname.eq(nickname)
                    : null;
        }

        private BooleanExpression categoryNameEq(String categoryName) {
            return (categoryName != null && !categoryName.isBlank())
                    ? QCategory.category.name.eq(categoryName)
                    : null;
        }

}
