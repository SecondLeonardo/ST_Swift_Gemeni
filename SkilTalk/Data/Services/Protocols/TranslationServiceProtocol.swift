import Foundation

protocol TranslationServiceProtocol {
    func translate(text: String, from: String, to: String) async throws -> String
}
