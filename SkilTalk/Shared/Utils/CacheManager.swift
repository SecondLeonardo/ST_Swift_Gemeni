import Foundation

class CacheManager {
    static let shared = CacheManager()
    private var cache = [String: (data: Any, timestamp: Date)]()

    func set<T>(key: String, value: T) async {
        cache[key] = (data: value, timestamp: Date())
    }

    func get<T>(key: String, type: T.Type) async -> T? {
        guard let entry = cache[key], let data = entry.data as? T else { return nil }
        return data
    }

    func isExpired(key: String, ttl: TimeInterval) -> Bool {
        guard let entry = cache[key] else { return true }
        return Date().timeIntervalSince(entry.timestamp) > ttl
    }
}
