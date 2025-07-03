
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // In a real app, you'd check for authentication status here.
        // For now, we'll just start the main flow.
        let mainTabCoordinator = MainTabCoordinator(navigationController: navigationController)
        childCoordinators.append(mainTabCoordinator)
        mainTabCoordinator.start()
    }

    func onboardingDidFinish(_ coordinator: OnboardingCoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        // Transition to main app flow after onboarding
        start()
    }
}
