import SwiftUI

struct CreatePostView: View {
    @State private var postContent: String = ""

    var body: some View {
        VStack {
            Text("Create New Post")
                .font(.largeTitle)
                .foregroundColor(.primaryTeal)
                .padding(.bottom, Spacing.m)

            TextEditor(text: $postContent)
                .frame(height: 150)
                .border(Color.gray.opacity(0.5), width: 1)
                .padding(.horizontal)

            PrimaryButton(title: "Post") {
                // Action to create post
            }
            .padding()

            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
