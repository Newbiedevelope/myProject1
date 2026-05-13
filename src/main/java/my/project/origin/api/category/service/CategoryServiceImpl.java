package my.project.origin.api.category.service;

import lombok.RequiredArgsConstructor;
import my.project.origin.api.category.domain.Category;
import my.project.origin.api.category.dto.CategoryCreateRequest;
import my.project.origin.api.category.repository.CategoryRepository;
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
