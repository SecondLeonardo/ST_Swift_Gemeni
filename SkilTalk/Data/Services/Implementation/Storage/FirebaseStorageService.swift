import Foundation
import FirebaseStorage

class FirebaseStorageService: StorageServiceProtocol {
    private let storage = Storage.storage()

    func uploadFile(data: Data, path: String, fileName: String) async throws -> URL {
        let storageRef = storage.reference().child("\(path)/\(fileName)")
        _ = try await storageRef.putDataAsync(data)
        return try await storageRef.downloadURL()
    }

    func downloadFile(path: String, fileName: String) async throws -> Data {
        let storageRef = storage.reference().child("\(path)/\(fileName)")
        return try await storageRef.data(maxSize: 1 * 1024 * 1024) // 1 MB limit
    }

    func deleteFile(path: String, fileName: String) async throws {
        let storageRef = storage.reference().child("\(path)/\(fileName)")
        try await storageRef.delete()
    }
}
