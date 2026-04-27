package my.project.origin.repository.postRepository;

import my.project.origin.domain.post.Post;
import my.project.origin.dto.post.PostSearchCondition;

import java.util.List;

public interface PostRepositoryCustom {
    // 게시글의 제목, 내용, 카테고리, 작성자로 검색할 수 있는 메서드
    List<Post> search(PostSearchCondition condition);
}
