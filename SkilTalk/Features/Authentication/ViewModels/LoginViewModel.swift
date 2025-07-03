import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func signIn() async {
        isLoading = true
        errorMessage = nil
        do {
            let success = try await authService.signIn(email: email, password: password)
            if !success {
                errorMessage = "Invalid credentials"
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
