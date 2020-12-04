//
//  PinInputViewModel.swift
//  InstaClone
//
//  Created by new on 25/11/2020.
//

import Foundation

protocol PinInputViewModelDelegate: AnyObject {
    
    func pinEntered()
    
}

final class PinInputViewModel {

    //    MARK: - Properties
    
    private weak var delegate: PinInputViewModelDelegate?
    
    //    MARK: - Life Cycle
    
    init(delegate: PinInputViewModelDelegate) {
        self.delegate = delegate
    }
    
    //    MARK: - Public methods
    
    func pinEntered() {
    }
    
}
