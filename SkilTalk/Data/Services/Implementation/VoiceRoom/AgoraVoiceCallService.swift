import Foundation

class AgoraVoiceCallService: VoiceCallServiceProtocol {
    func startCall(participantIds: [String]) async throws -> String {
        print("AgoraVoiceCallService: Starting call with participants: \(participantIds)")
        return UUID().uuidString
    }

    func endCall(callId: String) async throws {
        print("AgoraVoiceCallService: Ending call \(callId)")
    }

    func joinCall(callId: String, userId: String) async throws {
        print("AgoraVoiceCallService: User \(userId) joining call \(callId)")
    }

    func leaveCall(callId: String, userId: String) async throws {
        print("AgoraVoiceCallService: User \(userId) leaving call \(callId)")
    }

    func observeCallParticipants(callId: String) -> AsyncThrowingStream<[String], Error> {
        return AsyncThrowingStream { continuation in
            print("AgoraVoiceCallService: Observing participants for call \(callId)")
        }
    }
}
