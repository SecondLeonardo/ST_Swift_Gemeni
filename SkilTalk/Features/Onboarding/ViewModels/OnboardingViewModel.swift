import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var userProfile: UserModel
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let databaseService: DatabaseServiceProtocol

    init(databaseService: DatabaseServiceProtocol, initialProfile: UserModel) {
        self.databaseService = databaseService
        self.userProfile = initialProfile
    }

    func saveProfile() async {
        isLoading = true
        errorMessage = nil
        do {
            try await databaseService.update(collection: "users", documentId: userProfile.id, data: userProfile)
            userProfile.onboardingCompleted = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func nextStep() {
        currentStep += 1
    }

    func previousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }
}
