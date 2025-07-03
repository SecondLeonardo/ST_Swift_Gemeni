import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func signUp() async {
        isLoading = true
        errorMessage = nil
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            isLoading = false
            return
        }
        do {
            let success = try await authService.signUp(email: email, password: password)
            if !success {
                errorMessage = "Sign up failed"
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
