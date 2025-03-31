package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Translation {
    @Id
    @GeneratedValue()
    private Long id;
    private String english;
    private String translation;

    public Translation() {

    }

    public Translation(String english, String translation) {
        this.english = english;
        this.translation = translation;
    }

    public Long getId() {
        return id;
    }

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getTranslation() {
        return translation;
    }

    public void setTranslation(String translation) {
        this.translation = translation;
    }

}
