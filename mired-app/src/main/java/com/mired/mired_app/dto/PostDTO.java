package com.mired.mired_app.dto;

import jakarta.validation.constraints.NotBlank;

public class PostDTO {
    @NotBlank
    private String title;

    @NotBlank
    private String category;

    @NotBlank
    private String description;

    public PostDTO(String title, String category, String description) {
        this.title = title;
        this.category = category;
        this.description = description;
    }

    public PostDTO() {

    }


    public @NotBlank String getTitle() {
        return title;
    }

    public void setTitle(@NotBlank String title) {
        this.title = title;
    }

    public @NotBlank String getCategory() {
        return category;
    }

    public void setCategory(@NotBlank String category) {
        this.category = category;
    }

    public @NotBlank String getDescription() {
        return description;
    }

    public void setDescription(@NotBlank String description) {
        this.description = description;
    }
}
