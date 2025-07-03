import Foundation

enum SkillDifficulty: String, Codable {
    case beginner
    case intermediate
    case advanced
    case expert
}

struct Skill: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let categoryId: String
    let subcategoryId: String
    let difficulty: SkillDifficulty
    let popularity: Int
    let tags: [String]
}
