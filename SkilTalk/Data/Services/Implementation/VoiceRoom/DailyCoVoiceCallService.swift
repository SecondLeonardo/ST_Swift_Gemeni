import Foundation

class DailyCoVoiceCallService: VoiceCallServiceProtocol {
    func startCall(participantIds: [String]) async throws -> String {
        print("DailyCoVoiceCallService: Starting call with participants: \(participantIds)")
        return UUID().uuidString
    }

    func endCall(callId: String) async throws {
        print("DailyCoVoiceCallService: Ending call \(callId)")
    }

    func joinCall(callId: String, userId: String) async throws {
        print("DailyCoVoiceCallService: User \(userId) joining call \(callId)")
    }

    func leaveCall(callId: String, userId: String) async throws {
        print("DailyCoVoiceCallService: User \(userId) leaving call \(callId)")
    }

    func observeCallParticipants(callId: String) -> AsyncThrowingStream<[String], Error> {
        return AsyncThrowingStream { continuation in
            print("DailyCoVoiceCallService: Observing participants for call \(callId)")
        }
    }
}
