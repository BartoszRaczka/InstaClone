//
//  OnboardingViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 26/11/2020.
//

import Foundation

protocol OnboardingViewControllerFactory {
    
    func makeOnboardingViewController() -> OnboardingViewController
    
}

extension DependencyContainer: OnboardingViewControllerFactory {
    
    func makeOnboardingViewController() -> OnboardingViewController {
        OnboardingViewController()
    }
    
}
