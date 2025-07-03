import SwiftUI

struct ChatListView: View {
    var body: some View {
        VStack {
            Text("SkillTalk (Chats)")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            // Placeholder for chat list
            Text("Your chats will appear here.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
