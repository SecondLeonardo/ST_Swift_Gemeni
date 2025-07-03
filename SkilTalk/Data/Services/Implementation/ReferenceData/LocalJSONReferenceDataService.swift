import Foundation

class LocalJSONReferenceDataService: ReferenceDataServiceProtocol {
    private let bundleLoader: BundleResourceLoader

    init(bundleLoader: BundleResourceLoader = .shared) {
        self.bundleLoader = bundleLoader
    }

    func loadAll<T: Decodable>(dataType: T.Type, fileName: String) async throws -> [T] {
        return try await bundleLoader.loadJSON(from: "database/reference/\(fileName).json", type: [T].self)
    }

    func search<T: Decodable>(dataType: T.Type, fileName: String, query: String, keyPath: KeyPath<T, String>) async throws -> [T] {
        let allData = try await loadAll(dataType: dataType, fileName: fileName)
        let lowercasedQuery = query.lowercased()
        return allData.filter { $0[keyPath: keyPath].lowercased().contains(lowercasedQuery) }
    }
}
