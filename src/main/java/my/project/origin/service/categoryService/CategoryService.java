package my.project.origin.service.categoryService;

import my.project.origin.domain.category.Category;
import my.project.origin.dto.category.CategoryCreateRequest;

import java.util.List;

public interface CategoryService {
    Long createCategory(CategoryCreateRequest request);

    List<Category> getCategories();
}
