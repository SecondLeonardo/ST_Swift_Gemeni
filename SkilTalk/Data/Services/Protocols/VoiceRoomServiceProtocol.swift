import Foundation

protocol VoiceRoomServiceProtocol {
    func createVoiceRoom(hostId: String, topic: String, language: String) async throws -> String
    func joinVoiceRoom(roomId: String, userId: String) async throws
    func leaveVoiceRoom(roomId: String, userId: String) async throws
    func observeVoiceRoomParticipants(roomId: String) -> AsyncThrowingStream<[String], Error>
}
