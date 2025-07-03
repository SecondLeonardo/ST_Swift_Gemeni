import Foundation

struct UserModel: Codable, Identifiable {
    let id: String
    var name: String
    var email: String?
    var profilePictureUrl: URL?
    var nativeLanguage: String?
    var secondLanguages: [String: String]? // [languageCode: proficiencyLevel]
    var expertSkills: [String]?
    var targetSkills: [String]?
    var country: String?
    var city: String?
    var age: Int?
    var gender: String?
    var onboardingCompleted: Bool
}
