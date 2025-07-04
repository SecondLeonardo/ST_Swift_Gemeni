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
        showBasicInfo()
    }

    func showBasicInfo() {
        let basicInfoViewModel = BasicInfoViewModel()
        let basicInfoView = BasicInfoView(viewModel: basicInfoViewModel, onNext: { [weak self] in
            self?.showCountrySelection()
        })
        navigationController.pushViewController(UIHostingController(rootView: basicInfoView), animated: true)
    }

    func showCountrySelection() {
        let countrySelectionViewModel = CountrySelectionViewModel(referenceDataService: LocalJSONReferenceDataService())
        let countrySelectionView = CountrySelectionView(viewModel: countrySelectionViewModel, onNext: { [weak self] in
            self?.showLanguageSelection()
        })
        navigationController.pushViewController(UIHostingController(rootView: countrySelectionView), animated: true)
    }

    func showLanguageSelection() {
        let languageSelectionViewModel = LanguageSelectionViewModel(referenceDataService: LocalJSONReferenceDataService())
        let languageSelectionView = LanguageSelectionView(viewModel: languageSelectionViewModel, onNext: { [weak self] in
            self?.showSkillSelection()
        })
        navigationController.pushViewController(UIHostingController(rootView: languageSelectionView), animated: true)
    }

    func showSkillSelection() {
        let skillSelectionViewModel = SkillSelectionViewModel(skillService: OptimizedSkillDatabaseService())
        let skillSelectionView = SkillSelectionView(viewModel: skillSelectionViewModel, onNext: { [weak self] in
            self?.showProfilePicture()
        })
        navigationController.pushViewController(UIHostingController(rootView: skillSelectionView), animated: true)
    }

    func showProfilePicture() {
        let profilePictureView = ProfilePictureView(onNext: { [weak self] in
            self?.finishOnboarding()
        })
        navigationController.pushViewController(UIHostingController(rootView: profilePictureView), animated: true)
    }

    func finishOnboarding() {
        parentCoordinator?.onboardingDidFinish(self)
    }
}