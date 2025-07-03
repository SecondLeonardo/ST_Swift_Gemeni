import Foundation
import FirebaseAuth

class FirebaseAuthService: AuthServiceProtocol {
    func signIn(email: String, password: String) async throws -> Bool {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user != nil
    }

    func signUp(email: String, password: String) async throws -> Bool {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user != nil
    }

    func signOut() async throws {
        try Auth.auth().signOut()
    }

    func getCurrentUser() -> String? {
        return Auth.auth().currentUser?.uid
    }
}
