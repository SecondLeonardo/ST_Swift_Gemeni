import Foundation

class BasicInfoViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int? = nil
    @Published var gender: String? = nil
    @Published var country: String = ""
    @Published var city: String = ""
    @Published var nativeLanguage: String = ""
    @Published var secondLanguage: String = ""
    @Published var expertise: String = ""
    @Published var targetSkill: String = ""

    // This ViewModel would interact with the OnboardingViewModel to update the userProfile
}