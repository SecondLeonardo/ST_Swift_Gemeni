import Foundation

class CreatePostViewModel: ObservableObject {
    @Published var postContent: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var postCreated = false

    private let postService: PostServiceProtocol
    private let userId: String // Assuming current user ID is passed or fetched

    init(postService: PostServiceProtocol, userId: String) {
        self.postService = postService
        self.userId = userId
    }

    func createPost() async {
        isLoading = true
        errorMessage = nil
        postCreated = false
        do {
            _ = try await postService.createPost(userId: userId, content: postContent, mediaUrl: nil)
            postCreated = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
