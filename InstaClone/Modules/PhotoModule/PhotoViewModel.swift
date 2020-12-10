//
//  PhotoViewModel.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation

protocol PhotoViewModelDelegate {
    
}

class PhotoViewModel {
    
    let delegate: PhotoViewModelDelegate?
    
    init(delegate: PhotoViewModelDelegate) {
        self.delegate = delegate
    }
    
}
