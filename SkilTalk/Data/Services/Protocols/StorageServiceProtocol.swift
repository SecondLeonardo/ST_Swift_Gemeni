import Foundation

protocol StorageServiceProtocol {
    func uploadFile(data: Data, path: String, fileName: String) async throws -> URL
    func downloadFile(path: String, fileName: String) async throws -> Data
    func deleteFile(path: String, fileName: String) async throws
}
