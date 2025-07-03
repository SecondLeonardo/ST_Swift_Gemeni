import Foundation

class MatchViewModel: ObservableObject {
    @Published var matchedUsers: [UserModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let matchService: MatchServiceProtocol

    init(matchService: MatchServiceProtocol) {
        self.matchService = matchService
    }

    func fetchMatches(userId: String, criteria: [String: Any]) async {
        isLoading = true
        errorMessage = nil
        do {
            let userIds = try await matchService.findMatches(userId: userId, criteria: criteria)
            // In a real app, you would fetch full UserModel objects based on these IDs
            // For now, just create dummy users
            DispatchQueue.main.async {
                self.matchedUsers = userIds.map { id in
                    UserModel(id: id, name: "User \(id.prefix(4))", onboardingCompleted: true)
                }
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
