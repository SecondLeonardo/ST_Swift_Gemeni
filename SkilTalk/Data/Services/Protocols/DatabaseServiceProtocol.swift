import Foundation

protocol DatabaseServiceProtocol {
    func create<T: Encodable>(collection: String, documentId: String?, data: T) async throws
    func read<T: Decodable>(collection: String, documentId: String) async throws -> T?
    func update<T: Encodable>(collection: String, documentId: String, data: T) async throws
    func delete(collection: String, documentId: String) async throws
}
