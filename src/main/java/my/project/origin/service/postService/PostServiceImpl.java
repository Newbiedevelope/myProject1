package my.project.origin.service.postService;

import lombok.RequiredArgsConstructor;
import my.project.origin.domain.category.Category;
import my.project.origin.domain.post.Post;
import my.project.origin.domain.user.User;
import my.project.origin.dto.post.PostCreateRequest;
import my.project.origin.dto.post.PostResponse;
import my.project.origin.dto.post.PostSearchCondition;
import my.project.origin.repository.catogoryRepository.CategoryRepository;
import my.project.origin.repository.postRepository.PostRepository;
import my.project.origin.repository.userRepository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class PostServiceImpl implements PostService{

    private final PostRepository postRepository;
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;

    @Override
    @Transactional(readOnly = true)
    public List<PostResponse> search(PostSearchCondition condition) {
        return postRepository.search(condition).stream()
                .map(post -> new PostResponse(
                        post.getId()
                        , post.getTitle()
                        , post.getContent()
                        , post.getUser().getNickname()
                        , post.getCategory().getName()
                ))
                .toList();
    }//close search()

    @Override
    public Long createPost(PostCreateRequest request) {

        // 유저 조회
        User user = userRepository.findById(request.getUserId())
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자입니다."));

        // 카테고리 조회
        Category category = categoryRepository.findById(request.getCategoryId())
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 카테고리입니다."));

        // 게시글 생성
        Post post = Post.create(
                request.getTitle()
                , request.getContent()
                , user
                , category
        );

        // 저장
        Post savedPost = postRepository.save(post);

        return savedPost.getId();
    }//close createPost()

    @Override
    @Transactional(readOnly = true)
    public List<PostResponse> getPosts() {

        return postRepository.findAll().stream()
                .map(post -> new PostResponse(
                        post.getId()
                        , post.getTitle()
                        , post.getContent()
                        , post.getUser().getNickname()
                        , post.getCategory().getName()
                ))
                .toList();

    }//close getPosts() - 다중 조회

    @Override
    public PostResponse getPost(Long postId) {

        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 게시글입니다."));

        return new PostResponse(
                post.getId()
                , post.getTitle()
                , post.getContent()
                , post.getUser().getNickname()
                , post.getCategory().getName()
        );
    }//close getPost() - 단일 조회
}
