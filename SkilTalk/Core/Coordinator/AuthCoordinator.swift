import SwiftUI
import UIKit

class AuthCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var didAuthenticate: (() -> Void)?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }

    func start() {
        let welcomeView = WelcomeView(onSignInTapped: { [weak self] in
            self?.showLogin()
        }, onSignUpTapped: { [weak self] in
            self?.showSignUp()
        })
        navigationController.setViewControllers([UIHostingController(rootView: welcomeView)], animated: false)
    }

    func showLogin() {
        let loginViewModel = LoginViewModel(authService: MultiAuthService(primary: FirebaseAuthService(), fallback: SupabaseAuthService(client: SupabaseClient(supabaseURL: URL(string: "https://example.com")!, supabaseKey: "YOUR_SUPABASE_KEY"))))
        loginViewModel.didAuthenticate = { [weak self] in
            self?.didAuthenticate?()
        }
        let loginView = LoginView(viewModel: loginViewModel)
        navigationController.pushViewController(UIHostingController(rootView: loginView), animated: true)
    }

    func showSignUp() {
        let signUpViewModel = SignUpViewModel(authService: MultiAuthService(primary: FirebaseAuthService(), fallback: SupabaseAuthService(client: SupabaseClient(supabaseURL: URL(string: "https://example.com")!, supabaseKey: "YOUR_SUPABASE_KEY"))))
        signUpViewModel.didAuthenticate = { [weak self] in
            self?.didAuthenticate?()
        }
        let signUpView = SignUpView(viewModel: signUpViewModel)
        navigationController.pushViewController(UIHostingController(rootView: signUpView), animated: true)
    }
}
