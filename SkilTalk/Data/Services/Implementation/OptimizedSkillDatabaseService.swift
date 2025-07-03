import Foundation

protocol SkillDatabaseServiceProtocol {
    func loadAvailableLanguages() async throws -> [String]
    func loadCategories(for language: String) async throws -> [SkillCategory]
    func loadSubcategories(for categoryId: String, language: String) async throws -> [SkillSubcategory]
    func loadSkills(for subcategoryId: String, categoryId: String, language: String) async throws -> [Skill]
    func searchSkills(query: String, language: String) async throws -> [Skill]
    func getSkillsByDifficulty(_ difficulty: SkillDifficulty) async throws -> [Skill]
    func getPopularSkills(limit: Int) async throws -> [Skill]
}

class OptimizedSkillDatabaseService: SkillDatabaseServiceProtocol {
    private let cacheManager: CacheManager
    private let bundleLoader: BundleResourceLoader
    
    init(cacheManager: CacheManager = .shared, bundleLoader: BundleResourceLoader = .shared) {
        self.cacheManager = cacheManager
        self.bundleLoader = bundleLoader
    }
    
    // MARK: - Lazy Loading Implementation
    func loadAvailableLanguages() async throws -> [String] {
        let cacheKey = "available_languages"
        let cacheTTL: TimeInterval = 86400 * 7 // 7 days
        
        return try await loadWithCache(key: cacheKey, path: "database/languages.json", ttl: cacheTTL, type: [String].self)
    }

    func loadCategories(for language: String) async throws -> [SkillCategory] {
        let cacheKey = "categories_\(language)"
        let cacheTTL: TimeInterval = 86400 // 24 hours
        
        return try await loadWithCache(key: cacheKey, path: "database/languages/\(language)/categories.json", ttl: cacheTTL, type: [SkillCategory].self)
    }
    
    func loadSubcategories(for categoryId: String, language: String) async throws -> [SkillSubcategory] {
        let cacheKey = "subcategories_\(categoryId)_\(language)"
        let cacheTTL: TimeInterval = 86400 // 24 hours
        
        return try await loadWithCache(key: cacheKey, path: "database/languages/\(language)/hierarchy/\(categoryId).json", ttl: cacheTTL, type: CategoryHierarchy.self).subcategories
    }
    
    func loadSkills(for subcategoryId: String, categoryId: String, language: String) async throws -> [Skill] {
        let cacheKey = "skills_\(subcategoryId)_\(language)"
        let cacheTTL: TimeInterval = 3600 // 1 hour
        
        return try await loadWithCache(key: cacheKey, path: "database/languages/\(language)/hierarchy/\(categoryId)/\(subcategoryId).json", ttl: cacheTTL, type: SubcategoryHierarchy.self).skills
    }
    
    // MARK: - Performance Optimized Search
    func searchSkills(query: String, language: String) async throws -> [Skill] {
        // Use tag index for faster search
        let tagIndex = try await loadTagIndex()
        let matchingSkillIds = tagIndex.search(query: query)
        
        // This part needs actual skill data loading based on IDs, which is not directly supported by current bundleLoader
        // For now, returning empty array
        return []
    }
    
    // MARK: - Index-Based Queries
    func getSkillsByDifficulty(_ difficulty: SkillDifficulty) async throws -> [Skill] {
        let difficultyIndex = try await loadDifficultyIndex()
        let skillIds = difficultyIndex.skills(for: difficulty)
        // This part needs actual skill data loading based on IDs
        return []
    }
    
    func getPopularSkills(limit: Int) async throws -> [Skill] {
        let popularityIndex = try await loadPopularityIndex()
        let topSkillIds = popularityIndex.topSkills(limit: limit)
        // This part needs actual skill data loading based on IDs
        return []
    }
}

// MARK: - Cache Management Extension
extension OptimizedSkillDatabaseService {
    private func loadWithCache<T: Codable>(
        key: String,
        path: String,
        ttl: TimeInterval,
        type: T.Type
    ) async throws -> T {
        // Check cache first
        if let cachedData = await cacheManager.get(key: key, type: type),
           !cacheManager.isExpired(key: key, ttl: ttl) {
            return cachedData
        }
        
        // Load from bundle if not in cache or expired
        let data = try await bundleLoader.loadJSON(from: path, type: Data.self)
        let decodedData = try JSONDecoder().decode(type, from: data)
        await cacheManager.set(key: key, value: decodedData)
        
        return decodedData
    }
    
    private func loadTagIndex() async throws -> TagIndex {
        return try await loadWithCache(
            key: "tag_index",
            path: "database/indexes/tag_index.json",
            ttl: 86400, // 24 hours
            type: TagIndex.self
        )
    }
    
    private func loadDifficultyIndex() async throws -> DifficultyIndex {
        return try await loadWithCache(
            key: "difficulty_index",
            path: "database/indexes/difficulty_index.json",
            ttl: 86400, // 24 hours
            type: DifficultyIndex.self
        )
    }
    
    private func loadPopularityIndex() async throws -> PopularityIndex {
        return try await loadWithCache(
            key: "popularity_index",
            path: "database/indexes/popularity_index.json",
            ttl: 3600, // 1 hour
            type: PopularityIndex.self
        )
    }
    
    private func getCurrentLanguage() -> String {
        // This should come from user settings or device locale
        return "en" // Placeholder
    }
    
    private func loadSkillsByIds(_ ids: [String], language: String) async throws -> [Skill] {
        // This function would load individual skills by their IDs from the appropriate JSON files.
        // This is a complex operation that would require iterating through categories/subcategories
        // or having a flat index of all skills, which is not currently set up for direct access.
        // For now, returning empty array.
        return []
    }
}
