import Foundation

protocol NotificationServiceProtocol {
    func sendPushNotification(to userId: String, title: String, body: String) async throws
    func subscribeToTopic(topic: String) async throws
    func unsubscribeFromTopic(topic: String) async throws
}
