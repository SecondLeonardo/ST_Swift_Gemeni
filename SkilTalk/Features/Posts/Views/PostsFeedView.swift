import SwiftUI

struct PostsFeedView: View {
    var body: some View {
        VStack {
            Text("Posts Feed")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            // Placeholder for posts feed
            Text("Posts will appear here.")
                .font(.bodyText)
                .foregroundColor(.textSecondary)

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct PostsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        PostsFeedView()
    }
}
