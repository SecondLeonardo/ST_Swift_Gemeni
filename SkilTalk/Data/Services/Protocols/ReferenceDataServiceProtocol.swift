import Foundation

protocol ReferenceDataServiceProtocol {
    func loadAll<T: Decodable>(dataType: T.Type, fileName: String) async throws -> [T]
    func search<T: Decodable>(dataType: T.Type, fileName: String, query: String, keyPath: KeyPath<T, String>) async throws -> [T]
}
