//
//  OnboardingViewModelFactory.swift
//  InstaClone
//
//  Created by new on 26/11/2020.
//

protocol OnboardingViewModelFactory {
    
    func makeOnboardingViewModel() -> OnboardingViewModel
    
}

extension DependencyContainer: OnboardingViewModelFactory {
    
    func makeOnboardingViewModel() -> OnboardingViewModel {
        OnboardingViewModel()
    }
    
}
