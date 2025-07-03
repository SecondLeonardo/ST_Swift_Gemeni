
import UIKit
import Combine

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T
    var cancellables = Set<AnyCancellable>()

    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        // Base implementation does nothing. Subclasses should override this.
    }
}
