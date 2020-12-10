//
//  PinInputViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 03/12/2020.
//

protocol PinInputViewControllerFactory {
    
    func makePinInputViewController(delegate: PinInputViewModelDelegate) -> PinInputViewController
    
}

extension DependencyContainer: PinInputViewControllerFactory {
    
    func makePinInputViewController(delegate: PinInputViewModelDelegate) -> PinInputViewController {
        PinInputViewController(with: makePinInputViewModel(delegate: delegate))
    }
    
}

