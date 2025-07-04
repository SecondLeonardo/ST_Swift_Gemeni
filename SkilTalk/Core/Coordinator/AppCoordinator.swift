import UIKit
import SwiftUI

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // Check authentication status
        // For now, always start with AuthCoordinator
        showAuthFlow()
    }

    func showAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.didAuthenticate = { [weak self] in
            self?.showOnboardingFlow()
        }
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }

    func showOnboardingFlow() {
        // Create a new navigation controller for onboarding if needed, or reuse
        let onboardingNavigationController = UINavigationController()
        let onboardingCoordinator = OnboardingCoordinator(navigationController: onboardingNavigationController)
        onboardingCoordinator.parentCoordinator = self
        childCoordinators.append(onboardingCoordinator)
        onboardingCoordinator.start()

        // Present the onboarding flow
        navigationController.present(onboardingNavigationController, animated: true, completion: nil)
    }

    func onboardingDidFinish(_ coordinator: OnboardingCoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        navigationController.dismiss(animated: true) { [weak self] in
            self?.showMainAppFlow()
        }
    }

    func showMainAppFlow() {
        // This is where you'd transition to the main tab bar controller
        print("Showing Main App Flow")
        // For now, just show a simple view
        let mainAppView = Text("Main App Content - Welcome!")
        navigationController.setViewControllers([UIHostingController(rootView: mainAppView)], animated: true)
    }
}
