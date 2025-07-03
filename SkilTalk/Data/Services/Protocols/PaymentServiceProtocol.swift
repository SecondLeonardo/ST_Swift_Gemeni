import Foundation

protocol PaymentServiceProtocol {
    func purchaseProduct(productId: String) async throws -> Bool
    func restorePurchases() async throws -> Bool
    func getAvailableProducts() async throws -> [String] // Placeholder for product IDs
    func getCoinBalance(userId: String) async throws -> Int
    func deductCoins(userId: String, amount: Int) async throws -> Bool
    func addCoins(userId: String, amount: Int) async throws -> Bool
}
