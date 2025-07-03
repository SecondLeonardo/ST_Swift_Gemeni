import Foundation
import Supabase

class SupabaseDBService: DatabaseServiceProtocol {
    private let client: SupabaseClient

    init(client: SupabaseClient) {
        self.client = client
    }

    func create<T: Encodable>(collection: String, documentId: String?, data: T) async throws {
        // Supabase doesn't have direct document IDs like Firestore for inserts
        // You'd typically insert and get the ID back, or rely on auto-generated IDs
        // For simplicity, assuming 'collection' maps to a table name
        _ = try await client.from(collection).insert(data).execute()
    }

    func read<T: Decodable>(collection: String, documentId: String) async throws -> T? {
        let response = try await client.from(collection).select("*").eq("id", value: documentId).single().execute()
        return try JSONDecoder().decode(T.self, from: response.data)
    }

    func update<T: Encodable>(collection: String, documentId: String, data: T) async throws {
        _ = try await client.from(collection).update(data).eq("id", value: documentId).execute()
    }

    func delete(collection: String, documentId: String) async throws {
        _ = try await client.from(collection).delete().eq("id", value: documentId).execute()
    }
}
