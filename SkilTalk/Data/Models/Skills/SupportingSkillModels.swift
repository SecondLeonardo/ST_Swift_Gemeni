import Foundation

struct TagIndex: Codable {
    let tags: [String: [String]] // tag -> skill IDs
    
    func search(query: String) -> [String] {
        let lowercaseQuery = query.lowercased()
        return tags.compactMap { key, skillIds in
            key.lowercased().contains(lowercaseQuery) ? skillIds : nil
        }.flatMap { $0 }
    }
}

struct DifficultyIndex: Codable {
    let difficulties: [String: [String]] // difficulty -> skill IDs
    
    func skills(for difficulty: SkillDifficulty) -> [String] {
        return difficulties[difficulty.rawValue] ?? []
    }
}

struct PopularityIndex: Codable {
    let rankings: [String] // skill IDs ordered by popularity
    
    func topSkills(limit: Int) -> [String] {
        return Array(rankings.prefix(limit))
    }
}

struct CategoryHierarchy: Codable {
    let category: SkillCategory
    let subcategories: [SkillSubcategory]
}

struct SubcategoryHierarchy: Codable {
    let subcategory: SkillSubcategory
    let skills: [Skill]
}
