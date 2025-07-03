import Foundation

class MultiAuthService: AuthServiceProtocol {
    private var primaryService: AuthServiceProtocol
    private var fallbackService: AuthServiceProtocol

    init(primary: AuthServiceProtocol, fallback: AuthServiceProtocol) {
        self.primaryService = primary
        self.fallbackService = fallback
    }

    func signIn(email: String, password: String) async throws -> Bool {
        // Implement logic to try primary, then fallback
        do {
            return try await primaryService.signIn(email: email, password: password)
        } catch {
            print("Primary auth service failed: \(error.localizedDescription). Trying fallback.")
            return try await fallbackService.signIn(email: email, password: password)
        }
    }

    func signUp(email: String, password: String) async throws -> Bool {
        do {
            return try await primaryService.signUp(email: email, password: password)
        } catch {
            print("Primary auth service failed: \(error.localizedDescription). Trying fallback.")
            return try await fallbackService.signUp(email: email, password: password)
        }
    }

    func signOut() async throws {
        do {
            try await primaryService.signOut()
        } catch {
            print("Primary auth service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.signOut()
        }
    }

    func getCurrentUser() -> String? {
        // This might need more sophisticated logic for current user across services
        return primaryService.getCurrentUser() ?? fallbackService.getCurrentUser()
    }
}
