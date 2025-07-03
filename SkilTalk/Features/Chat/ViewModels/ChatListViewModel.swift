import Foundation

class ChatListViewModel: ObservableObject {
    @Published var chats: [Chat] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let chatService: ChatServiceProtocol

    init(chatService: ChatServiceProtocol) {
        self.chatService = chatService
    }

    func fetchChats(userId: String) async {
        isLoading = true
        errorMessage = nil
        do {
            // In a real app, this would fetch chats for the given user
            // For now, just a dummy chat
            DispatchQueue.main.async {
                self.chats = [
                    Chat(id: "chat1", participantIds: [userId, "otherUser"], lastMessage: "Hello!", lastMessageTimestamp: Date(), type: "one-on-one")
                ]
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
