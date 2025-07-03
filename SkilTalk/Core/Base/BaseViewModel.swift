
import Foundation
import Combine

class BaseViewModel: ViewModelProtocol {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
}
