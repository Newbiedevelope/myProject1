package my.project.origin.controller;

import lombok.RequiredArgsConstructor;
import my.project.origin.dto.category.CategoryCreateRequest;
import my.project.origin.dto.category.CategoryCreateResponse;
import my.project.origin.service.categoryService.CategoryService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/categories")
public class CategoryController {

    private final CategoryService categoryService;

    @PostMapping
    public CategoryCreateResponse createCategory(@RequestBody CategoryCreateRequest request) {
        Long id = categoryService.createCategory(request);
        return new CategoryCreateResponse(id);
    }

}
