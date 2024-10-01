package com.example.demo;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TranslationService {
    private final TranslationRepository translationRepository;

    public TranslationService(TranslationRepository translationRepository) {
        this.translationRepository = translationRepository;
    }

    public List<Translation> findAllTranslations() {
        return translationRepository.findAll();
    }
}
