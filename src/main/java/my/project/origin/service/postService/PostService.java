package my.project.origin.service.postService;

import my.project.origin.domain.post.Post;
import my.project.origin.dto.post.PostCreateRequest;
import my.project.origin.dto.post.PostResponse;
import my.project.origin.dto.post.PostSearchCondition;

import java.util.List;

public interface PostService {
    
    // 게시글 검색
    List<PostResponse> search(PostSearchCondition condition);

    // 게시글 작성
    Long createPost(PostCreateRequest request);

    // 다중 조회
    List<PostResponse> getPosts();

    // 단일 조회
    PostResponse getPost(Long postId);
}
