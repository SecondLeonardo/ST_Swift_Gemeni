import Foundation

class VoiceRoomListViewModel: ObservableObject {
    @Published var voiceRooms: [String] = [] // Placeholder for VoiceRoom models
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let voiceRoomService: VoiceRoomServiceProtocol

    init(voiceRoomService: VoiceRoomServiceProtocol) {
        self.voiceRoomService = voiceRoomService
    }

    func fetchVoiceRooms() async {
        isLoading = true
        errorMessage = nil
        do {
            // In a real app, this would fetch a list of available voice rooms
            // For now, just a dummy list
            DispatchQueue.main.async {
                self.voiceRooms = ["Room 1", "Room 2", "Room 3"]
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
