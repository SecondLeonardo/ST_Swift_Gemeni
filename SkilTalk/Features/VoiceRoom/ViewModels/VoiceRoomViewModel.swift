import Foundation

class VoiceRoomViewModel: ObservableObject {
    @Published var participants: [String] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let voiceRoomService: VoiceRoomServiceProtocol
    private let roomId: String
    private let currentUserId: String

    init(voiceRoomService: VoiceRoomServiceProtocol, roomId: String, currentUserId: String) {
        self.voiceRoomService = voiceRoomService
        self.roomId = roomId
        self.currentUserId = currentUserId
        observeParticipants()
    }

    func joinRoom() async {
        isLoading = true
        errorMessage = nil
        do {
            try await voiceRoomService.joinVoiceRoom(roomId: roomId, userId: currentUserId)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func leaveRoom() async {
        isLoading = true
        errorMessage = nil
        do {
            try await voiceRoomService.leaveVoiceRoom(roomId: roomId, userId: currentUserId)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    private func observeParticipants() {
        Task {
            do {
                for try await participantList in voiceRoomService.observeVoiceRoomParticipants(roomId: roomId) {
                    DispatchQueue.main.async {
                        self.participants = participantList
                    }
                }
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
