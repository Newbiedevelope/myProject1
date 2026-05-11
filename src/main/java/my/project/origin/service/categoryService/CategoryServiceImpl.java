package my.project.origin.service.categoryService;

import lombok.RequiredArgsConstructor;
import my.project.origin.domain.category.Category;
import my.project.origin.dto.category.CategoryCreateRequest;
import my.project.origin.repository.catogoryRepository.CategoryRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class CategoryServiceImpl implements CategoryService{

    private final CategoryRepository categoryRepository;

    @Override
    public Long createCategory(CategoryCreateRequest request) {

        categoryRepository.findByName(request.getName())
                .ifPresent(c -> {
                    throw new IllegalArgumentException("이미 존재하는 카테고리입니다.");
                });

        Category category = Category.create(request.getName());

        return categoryRepository.save(category).getId();

    }

    @Override
    public List<Category> getCategories() {
        return categoryRepository.findAll();
    }
}
