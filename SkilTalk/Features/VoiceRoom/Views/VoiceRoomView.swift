import SwiftUI

struct VoiceRoomView: View {
    let roomId: String

    var body: some View {
        VStack {
            Text("Voice Room: \(roomId)")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            // Placeholder for voice room participants and controls
            Text("Participants and controls will appear here.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct VoiceRoomView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceRoomView(roomId: "sample-voice-room-id")
    }
}
