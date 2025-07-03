import Foundation

class MultiChatService: ChatServiceProtocol {
    private var primaryService: ChatServiceProtocol
    private var fallbackService: ChatServiceProtocol

    init(primary: ChatServiceProtocol, fallback: ChatServiceProtocol) {
        self.primaryService = primary
        self.fallbackService = fallback
    }

    func sendMessage(chatId: String, message: String, senderId: String) async throws {
        do {
            try await primaryService.sendMessage(chatId: chatId, message: message, senderId: senderId)
        } catch {
            print("Primary chat service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.sendMessage(chatId: chatId, message: message, senderId: senderId)
        }
    }

    func observeMessages(chatId: String) -> AsyncThrowingStream<[String: Any], Error> {
        // This is more complex for failover, might need to combine streams or switch dynamically
        // For now, just use primary
        return primaryService.observeMessages(chatId: chatId)
    }

    func createChat(participantIds: [String]) async throws -> String {
        do {
            return try await primaryService.createChat(participantIds: participantIds)
        } catch {
            print("Primary chat service failed: \(error.localizedDescription). Trying fallback.")
            return try await fallbackService.createChat(participantIds: participantIds)
        }
    }
}
