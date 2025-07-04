import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let authService: AuthServiceProtocol
    var didAuthenticate: (() -> Void)?

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func signIn() async {
        isLoading = true
        errorMessage = nil
        do {
            let success = try await authService.signIn(email: email, password: password)
            if success {
                didAuthenticate?()
            } else {
                errorMessage = "Invalid credentials"
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
