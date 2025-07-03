import SwiftUI

struct LiveRoomView: View {
    let roomId: String

    var body: some View {
        VStack {
            Text("Live Room: \(roomId)")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            // Placeholder for live stream video and chat
            Text("Live stream and chat will appear here.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct LiveRoomView_Previews: PreviewProvider {
    static var previews: some View {
        LiveRoomView(roomId: "sample-live-room-id")
    }
}
