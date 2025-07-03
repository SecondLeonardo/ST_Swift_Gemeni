import Foundation

protocol ChatServiceProtocol {
    func sendMessage(chatId: String, message: String, senderId: String) async throws
    func observeMessages(chatId: String) -> AsyncThrowingStream<[String: Any], Error>
    func createChat(participantIds: [String]) async throws -> String
}
