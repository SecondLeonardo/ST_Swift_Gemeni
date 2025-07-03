import SwiftUI
import UIKit

class AuthCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // Present the WelcomeView or LoginView
        // For now, just a placeholder
        print("AuthCoordinator started")
    }

    // Methods to navigate to Login, SignUp, etc.
    func showLogin() {
        print("Showing Login")
    }

    func showSignUp() {
        print("Showing Sign Up")
    }
}