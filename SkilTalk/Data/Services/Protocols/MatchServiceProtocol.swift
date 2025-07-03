import Foundation

protocol MatchServiceProtocol {
    func findMatches(userId: String, criteria: [String: Any]) async throws -> [String]
    func calculateCompatibility(user1Id: String, user2Id: String) async throws -> Double
}
