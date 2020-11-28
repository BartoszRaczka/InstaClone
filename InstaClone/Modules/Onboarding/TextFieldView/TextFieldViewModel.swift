//
//  TextFieldViewModel.swift
//  InstaClone
//
//  Created by new on 27/11/2020.
//

import UIKit

protocol TextFieldViewModelDelegate: AnyObject {
    
    func textFieldDidChange(in textFieldType: TextFieldType, with typedText: String)
    
}

struct TextFieldViewModel {
    
    var delegate: TextFieldViewModelDelegate?
    var onStopEditingAction: (() -> Void)?
    let textFieldType: TextFieldType
    let placeholderText: String
    
    // MARK: - Public methods
    func textFieldDidChange(with typedText: String) {
        delegate?.textFieldDidChange(in: self.textFieldType, with: typedText)
    }
    
//    func stopEditing() {
//        self.onStopEditingAction
//    }
    
}
