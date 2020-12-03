//
//  PinInputViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 03/12/2020.
//

protocol PinInputViewControllerFactory {
    
    func makePinInputViewController() -> PinInputViewController
    
}

extension DependencyContainer: PinInputViewControllerFactory {
    
    func makePinInputViewController() -> PinInputViewController {
        PinInputViewController(with: makePinInputViewModel())
    }
    
}
