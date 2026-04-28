package my.project.origin.service.categoryService;

import my.project.origin.dto.category.CategoryCreateRequest;

public interface CategoryService {
    Long createCategory(CategoryCreateRequest request);
}
