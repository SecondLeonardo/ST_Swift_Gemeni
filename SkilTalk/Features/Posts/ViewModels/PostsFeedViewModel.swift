import Foundation

class PostsFeedViewModel: ObservableObject {
    @Published var posts: [[String: Any]] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let postService: PostServiceProtocol

    init(postService: PostServiceProtocol) {
        self.postService = postService
    }

    func fetchPosts() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedPosts = try await postService.fetchPosts(limit: 10, lastPostId: nil)
            DispatchQueue.main.async {
                self.posts = fetchedPosts
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
