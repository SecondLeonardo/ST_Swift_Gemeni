import Foundation

class LiveRoomViewModel: ObservableObject {
    @Published var viewers: Int = 0
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let voiceRoomService: VoiceRoomServiceProtocol // Reusing VoiceRoomService for LiveRoom
    private let roomId: String
    private let currentUserId: String

    init(voiceRoomService: VoiceRoomServiceProtocol, roomId: String, currentUserId: String) {
        self.voiceRoomService = voiceRoomService
        self.roomId = roomId
        self.currentUserId = currentUserId
        observeViewers()
    }

    func startLiveStream() async {
        isLoading = true
        errorMessage = nil
        do {
            _ = try await voiceRoomService.createVoiceRoom(hostId: currentUserId, topic: "Live Stream", language: "en")
            // Logic to start actual live stream (e.g., connect to Agora/100ms)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func endLiveStream() async {
        isLoading = true
        errorMessage = nil
        do {
            try await voiceRoomService.leaveVoiceRoom(roomId: roomId, userId: currentUserId)
            // Logic to end actual live stream
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    private func observeViewers() {
        // This would typically observe a viewer count from the live streaming service
        // For now, simulate viewer count
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            DispatchQueue.main.async {
                self.viewers = Int.random(in: 10...100)
            }
        }
    }
}
