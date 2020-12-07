//
//  PinInputViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol PinInputViewModelDelegate: AnyObject {
    
    func pinEntered(pin: String)
    
}

final class PinInputViewModel {

    //    MARK: - Properties
    
    private weak var delegate: PinInputViewModelDelegate?
    
    private var typedText: String?
    
    //    MARK: - Life Cycle
    
    init(delegate: PinInputViewModelDelegate) {
        self.delegate = delegate
    }
    
    //    MARK: - Public methods
    
    func buttonTapped() {
        guard let pin = self.typedText else {
            return
        }
        delegate?.pinEntered(pin: pin)
    }
    
    func textFieldDidChange(with typedText: String) {
        
        self.typedText = typedText
        
    }
    
}
