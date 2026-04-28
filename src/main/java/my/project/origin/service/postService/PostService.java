package my.project.origin.service.postService;

import my.project.origin.domain.post.Post;
import my.project.origin.dto.post.PostCreateRequest;
import my.project.origin.dto.post.PostSearchCondition;

import java.util.List;

public interface PostService {
    List<Post> search(PostSearchCondition condition);

    Long createPost(PostCreateRequest request);
}
