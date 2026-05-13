package my.project.origin.api.category.controller;

import lombok.RequiredArgsConstructor;
import my.project.origin.api.category.dto.CategoryCreateRequest;
import my.project.origin.api.category.dto.CategoryCreateResponse;
import my.project.origin.api.category.service.CategoryService;
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
