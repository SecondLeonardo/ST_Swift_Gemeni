import Foundation

class GamificationViewModel: ObservableObject {
    @Published var currentStreak: Int = 0
    @Published var badges: [String] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    // This ViewModel would interact with a GamificationService to track streaks and badges

    func fetchGamificationData(userId: String) async {
        isLoading = true
        errorMessage = nil
        // Simulate fetching data
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentStreak = 7
            self.badges = ["First Week", "Chat Master"]
            self.isLoading = false
        }
    }

    func recordDailyActivity(userId: String) async {
        // Simulate recording activity and updating streak
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.currentStreak += 1
        }
    }
}
