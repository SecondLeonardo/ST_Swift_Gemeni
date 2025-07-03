import Foundation

protocol PostServiceProtocol {
    func createPost(userId: String, content: String, mediaUrl: URL?) async throws -> String
    func fetchPosts(limit: Int, lastPostId: String?) async throws -> [[String: Any]]
    func likePost(postId: String, userId: String) async throws
    func addComment(postId: String, userId: String, comment: String) async throws
}
