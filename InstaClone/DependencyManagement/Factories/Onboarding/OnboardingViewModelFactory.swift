//
//  OnboardingViewModelFactory.swift
//  InstaClone
//
//  Created by new on 26/11/2020.
//

protocol OnboardingViewModelFactory {
    
    func makeOnboardingViewModel(delegate: OnboardingViewModelDelegate) -> OnboardingViewModel
    
}

extension DependencyContainer: OnboardingViewModelFactory {
    
    func makeOnboardingViewModel(delegate: OnboardingViewModelDelegate) -> OnboardingViewModel {
        OnboardingViewModel(
            login: "",
            password: "",
            delegate: delegate
        )
    }
    
}
