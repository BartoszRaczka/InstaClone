//
//  OnboardingViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 26/11/2020.
//

protocol OnboardingViewControllerFactory {
    
    func makeOnboardingViewController(delegate: OnboardingViewModelDelegate) -> OnboardingViewController
    
}

extension DependencyContainer: OnboardingViewControllerFactory {
    
    func makeOnboardingViewController(delegate: OnboardingViewModelDelegate) -> OnboardingViewController {
        OnboardingViewController(with: makeOnboardingViewModel(delegate: delegate))
    }
    
}
