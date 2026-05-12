package my.project.origin.service.postService;

import my.project.origin.dto.post.PostCreateRequest;
import my.project.origin.dto.post.PostDetailResponse;
import my.project.origin.dto.post.PostListResponse;
import my.project.origin.dto.post.PostSearchCondition;

import java.util.List;

public interface PostService {
    
    // 게시글 검색
    List<PostListResponse> search(PostSearchCondition condition);

    // 게시글 작성
    Long createPost(PostCreateRequest request, Long userId);

    // 다중 조회
    List<PostListResponse> getPosts();

    // 단일 조회
    PostDetailResponse getPost(Long postId);
}
