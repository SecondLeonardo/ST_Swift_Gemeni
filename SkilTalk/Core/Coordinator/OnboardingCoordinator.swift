import SwiftUI
import UIKit

class OnboardingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("OnboardingCoordinator started")
        // Navigate to the first onboarding step (e.g., BasicInfoView)
    }

    // Methods to navigate through onboarding steps
    func showBasicInfo() {
        print("Showing Basic Info")
    }

    func showCountrySelection() {
        print("Showing Country Selection")
    }

    func showLanguageSelection() {
        print("Showing Language Selection")
    }

    func showSkillSelection() {
        print("Showing Skill Selection")
    }

    func showProfilePicture() {
        print("Showing Profile Picture")
    }

    func finishOnboarding() {
        print("Onboarding finished")
        parentCoordinator?.onboardingDidFinish(self)
    }
}