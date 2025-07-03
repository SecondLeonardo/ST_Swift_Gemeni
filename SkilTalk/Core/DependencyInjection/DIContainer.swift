
import Foundation

class DIContainer {
    static let shared = DIContainer()

    private init() {}

    // MARK: - Services
    // Example: lazy var authService: AuthServiceProtocol = FirebaseAuthService()

    // MARK: - ViewModels
    // Example: func makeLoginViewModel() -> LoginViewModel { return LoginViewModel(authService: authService) }
}
