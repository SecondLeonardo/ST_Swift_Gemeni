import Foundation

class LanguageSelectionViewModel: ObservableObject {
    @Published var languages: [String] = []
    @Published var selectedNativeLanguage: String? = nil
    @Published var selectedSecondLanguage: String? = nil
    @Published var selectedSecondLanguageProficiency: String? = nil
    @Published var proficiencyLevels = ["Beginner", "Elementary", "Intermediate", "Advanced", "Proficient"]
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let referenceDataService: ReferenceDataServiceProtocol

    init(referenceDataService: ReferenceDataServiceProtocol) {
        self.referenceDataService = referenceDataService
    }

    func loadLanguages() async {
        isLoading = true
        errorMessage = nil
        do {
            let loadedLanguages = try await referenceDataService.loadAll(dataType: String.self, fileName: "languages")
            DispatchQueue.main.async {
                self.languages = loadedLanguages
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}