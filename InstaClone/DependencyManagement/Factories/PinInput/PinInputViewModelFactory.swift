//
//  PinInputViewModelFactory.swift
//  InstaClone
//
//  Created by new on 03/12/2020.
//

protocol PinInputViewModelFactory {
    
    func makePinInputViewModel(delegate: PinInputViewModelDelegate) -> PinInputViewModel
    
}

extension DependencyContainer: PinInputViewModelFactory {
    
    func makePinInputViewModel(delegate: PinInputViewModelDelegate) -> PinInputViewModel {
        PinInputViewModel(
            delegate: delegate
        )
    }
    
}
