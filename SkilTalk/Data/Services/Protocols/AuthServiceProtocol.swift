import Foundation

protocol AuthServiceProtocol {
    func signIn(email: String, password: String) async throws -> Bool
    func signUp(email: String, password: String) async throws -> Bool
    func signOut() async throws
    func getCurrentUser() -> String?
}
