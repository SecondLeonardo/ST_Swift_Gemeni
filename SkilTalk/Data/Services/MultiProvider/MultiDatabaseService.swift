import Foundation

class MultiDatabaseService: DatabaseServiceProtocol {
    private var primaryService: DatabaseServiceProtocol
    private var fallbackService: DatabaseServiceProtocol

    init(primary: DatabaseServiceProtocol, fallback: DatabaseServiceProtocol) {
        self.primaryService = primary
        self.fallbackService = fallback
    }

    func create<T: Encodable>(collection: String, documentId: String?, data: T) async throws {
        do {
            try await primaryService.create(collection: collection, documentId: documentId, data: data)
        } catch {
            print("Primary database service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.create(collection: collection, documentId: documentId, data: data)
        }
    }

    func read<T: Decodable>(collection: String, documentId: String) async throws -> T? {
        do {
            return try await primaryService.read(collection: collection, documentId: documentId)
        } catch {
            print("Primary database service failed: \(error.localizedDescription). Trying fallback.")
            return try await fallbackService.read(collection: collection, documentId: documentId)
        }
    }

    func update<T: Encodable>(collection: String, documentId: String, data: T) async throws {
        do {
            try await primaryService.update(collection: collection, documentId: documentId, data: data)
        } catch {
            print("Primary database service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.update(collection: collection, documentId: documentId, data: data)
        }
    }

    func delete(collection: String, documentId: String) async throws {
        do {
            try await primaryService.delete(collection: collection, documentId: documentId)
        } catch {
            print("Primary database service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.delete(collection: collection, documentId: documentId)
        }
    }
}
