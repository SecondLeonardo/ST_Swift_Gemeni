import Foundation

protocol VoiceCallServiceProtocol {
    func startCall(participantIds: [String]) async throws -> String
    func endCall(callId: String) async throws
    func joinCall(callId: String, userId: String) async throws
    func leaveCall(callId: String, userId: String) async throws
    func observeCallParticipants(callId: String) -> AsyncThrowingStream<[String], Error>
}
