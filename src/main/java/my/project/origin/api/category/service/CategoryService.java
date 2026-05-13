package my.project.origin.api.category.service;

import my.project.origin.api.category.domain.Category;
import my.project.origin.api.category.dto.CategoryCreateRequest;

import java.util.List;

public interface CategoryService {
    Long createCategory(CategoryCreateRequest request);

    List<Category> getCategories();
}
