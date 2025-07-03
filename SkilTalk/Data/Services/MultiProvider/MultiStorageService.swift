import Foundation

class MultiStorageService: StorageServiceProtocol {
    private var primaryService: StorageServiceProtocol
    private var fallbackService: StorageServiceProtocol

    init(primary: StorageServiceProtocol, fallback: StorageServiceProtocol) {
        self.primaryService = primary
        self.fallbackService = fallback
    }

    func uploadFile(data: Data, path: String, fileName: String) async throws -> URL {
        do {
            return try await primaryService.uploadFile(data: data, path: path, fileName: fileName)
        } catch {
            print("Primary storage service failed: \(error.localizedDescription). Trying fallback.")
            return try await fallbackService.uploadFile(data: data, path: path, fileName: fileName)
        }
    }

    func downloadFile(path: String, fileName: String) async throws -> Data {
        do {
            return try await primaryService.downloadFile(path: path, fileName: fileName)
        } catch {
            print("Primary storage service failed: \(error.localizedDescription). Trying fallback.")
            return try await fallbackService.downloadFile(path: path, fileName: fileName)
        }
    }

    func deleteFile(path: String, fileName: String) async throws {
        do {
            try await primaryService.deleteFile(path: path, fileName: fileName)
        } catch {
            print("Primary storage service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.deleteFile(path: path, fileName: fileName)
        }
    }
}
