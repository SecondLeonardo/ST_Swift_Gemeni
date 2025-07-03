import SwiftUI

struct VoiceRoomListView: View {
    var body: some View {
        VStack {
            Text("Voice Rooms")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            // Placeholder for voice room list
            Text("Voice rooms will appear here.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct VoiceRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceRoomListView()
    }
}
