import Foundation

class ChatConversationViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let chatService: ChatServiceProtocol
    private let chatId: String
    private let currentUserId: String

    init(chatService: ChatServiceProtocol, chatId: String, currentUserId: String) {
        self.chatService = chatService
        self.chatId = chatId
        self.currentUserId = currentUserId
        observeMessages()
    }

    func sendMessage(content: String) async {
        do {
            try await chatService.sendMessage(chatId: chatId, message: content, senderId: currentUserId)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func observeMessages() {
        Task {
            do {
                for try await messageData in chatService.observeMessages(chatId: chatId) {
                    // Assuming messageData can be decoded into a Message object
                    // This part needs proper decoding logic based on actual messageData structure
                    if let content = messageData["message"] as? String, let senderId = messageData["senderId"] as? String {
                        let newMessage = Message(id: UUID().uuidString, chatId: chatId, senderId: senderId, content: content, timestamp: Date(), isRead: false, type: "text")
                        DispatchQueue.main.async {
                            self.messages.append(newMessage)
                        }
                    }
                }
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
