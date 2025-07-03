import Foundation

struct Chat: Codable, Identifiable {
    let id: String
    let participantIds: [String]
    var lastMessage: String?
    var lastMessageTimestamp: Date?
    var type: String // e.g., "one-on-one", "group"
}

struct Message: Codable, Identifiable {
    let id: String
    let chatId: String
    let senderId: String
    let content: String
    let timestamp: Date
    var isRead: Bool
    var type: String // e.g., "text", "image", "voice"
}
