import Foundation

class AuthenticationViewModel: ObservableObject {
    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    // This ViewModel could manage the overall authentication state (e.g., isLoggedIn)
    // and provide methods for checking authentication status.
}
