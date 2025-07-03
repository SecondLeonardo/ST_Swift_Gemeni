import Foundation

class BundleResourceLoader {
    static let shared = BundleResourceLoader()

    func loadJSON<T: Decodable>(from fileName: String, type: T.Type) async throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
}
