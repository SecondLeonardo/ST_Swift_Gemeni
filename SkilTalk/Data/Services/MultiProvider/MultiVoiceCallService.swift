import Foundation

class MultiVoiceCallService: VoiceCallServiceProtocol {
    private var primaryService: VoiceCallServiceProtocol
    private var fallbackService: VoiceCallServiceProtocol

    init(primary: VoiceCallServiceProtocol, fallback: VoiceCallServiceProtocol) {
        self.primaryService = primary
        self.fallbackService = fallback
    }

    func startCall(participantIds: [String]) async throws -> String {
        do {
            return try await primaryService.startCall(participantIds: participantIds)
        } catch {
            print("Primary voice call service failed: \(error.localizedDescription). Trying fallback.")
            return try await fallbackService.startCall(participantIds: participantIds)
        }
    }

    func endCall(callId: String) async throws {
        do {
            try await primaryService.endCall(callId: callId)
        } catch {
            print("Primary voice call service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.endCall(callId: callId)
        }
    }

    func joinCall(callId: String, userId: String) async throws {
        do {
            try await primaryService.joinCall(callId: callId, userId: userId)
        } catch {
            print("Primary voice call service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.joinCall(callId: callId, userId: userId)
        }
    }

    func leaveCall(callId: String, userId: String) async throws {
        do {
            try await primaryService.leaveCall(callId: callId, userId: userId)
        } catch {
            print("Primary voice call service failed: \(error.localizedDescription). Trying fallback.")
            try await fallbackService.leaveCall(callId: callId, userId: userId)
        }
    }

    func observeCallParticipants(callId: String) -> AsyncThrowingStream<[String], Error> {
        // Similar to chat, this might need more sophisticated logic for current user across services
        return primaryService.observeCallParticipants(callId: callId)
    }
}
