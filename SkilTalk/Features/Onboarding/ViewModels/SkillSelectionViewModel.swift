import Foundation

class SkillSelectionViewModel: ObservableObject {
    @Published var categories: [SkillCategory] = []
    @Published var subcategories: [SkillSubcategory] = []
    @Published var skills: [Skill] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let skillService: OptimizedSkillDatabaseService

    init(skillService: OptimizedSkillDatabaseService) {
        self.skillService = skillService
    }

    func loadCategories(language: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let loadedCategories = try await skillService.loadCategories(for: language)
            DispatchQueue.main.async {
                self.categories = loadedCategories
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func loadSubcategories(categoryId: String, language: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let loadedSubcategories = try await skillService.loadSubcategories(for: categoryId, language: language)
            DispatchQueue.main.async {
                self.subcategories = loadedSubcategories
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func loadSkills(subcategoryId: String, categoryId: String, language: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let loadedSkills = try await skillService.loadSkills(for: subcategoryId, categoryId: categoryId, language: language)
            DispatchQueue.main.async {
                self.skills = loadedSkills
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}