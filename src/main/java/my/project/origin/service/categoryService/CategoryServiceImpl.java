package my.project.origin.service.categoryService;

import lombok.RequiredArgsConstructor;
import my.project.origin.domain.category.Category;
import my.project.origin.dto.category.CategoryCreateRequest;
import my.project.origin.repository.catogoryRepository.CategoryRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class CategoryServiceImpl implements CategoryService{

    private final CategoryRepository categoryRepository;

    @Override
    public Long createCategory(CategoryCreateRequest request) {

        Category category = Category.create(request.getName());

        return categoryRepository.save(category).getId();

    }
}
