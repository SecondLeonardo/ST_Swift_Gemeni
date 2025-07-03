import Foundation
import Supabase

class SupabaseAuthService: AuthServiceProtocol {
    private let client: SupabaseClient

    init(client: SupabaseClient) {
        self.client = client
    }

    func signIn(email: String, password: String) async throws -> Bool {
        let response = try await client.auth.signIn(email: email, password: password)
        return response.user != nil
    }

    func signUp(email: String, password: String) async throws -> Bool {
        let response = try await client.auth.signUp(email: email, password: password)
        return response.user != nil
    }

    func signOut() async throws {
        try await client.auth.signOut()
    }

    func getCurrentUser() -> String? {
        return client.auth.currentUser?.id.uuidString
    }
}
