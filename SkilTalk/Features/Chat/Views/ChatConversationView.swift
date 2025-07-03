import SwiftUI

struct ChatConversationView: View {
    let chatId: String
    @State private var messageText: String = ""

    var body: some View {
        VStack {
            Text("Chat ID: \(chatId)")
                .font(.title2)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            // Placeholder for messages
            ScrollView {
                VStack {
                    Text("Messages will appear here.")
                        .font(.bodyText)
                        .foregroundColor(.textSecondary)
                }
            }

            HStack {
                TextField("Type a message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: { /* Send message */ }) {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                        .foregroundColor(.primaryTeal)
                }
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ChatConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ChatConversationView(chatId: "sample-chat-id")
    }
}
