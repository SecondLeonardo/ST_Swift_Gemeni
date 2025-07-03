import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: UserModel?
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let databaseService: DatabaseServiceProtocol
    private let userId: String

    init(databaseService: DatabaseServiceProtocol, userId: String) {
        self.databaseService = databaseService
        self.userId = userId
    }

    func fetchUserProfile() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedUser: UserModel? = try await databaseService.read(collection: "users", documentId: userId)
            DispatchQueue.main.async {
                self.user = fetchedUser
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func updateProfile(updatedUser: UserModel) async {
        isLoading = true
        errorMessage = nil
        do {
            try await databaseService.update(collection: "users", documentId: updatedUser.id, data: updatedUser)
            DispatchQueue.main.async {
                self.user = updatedUser
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
