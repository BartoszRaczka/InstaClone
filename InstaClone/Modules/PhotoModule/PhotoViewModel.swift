//
//  PhotoViewModel.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import UIKit

protocol PhotoViewModelDelegate {
    
}

class PhotoViewModel {
    
    let delegate: PhotoViewModelDelegate?
    private var capturedPhoto: UIImage!
    var onRecapturePhotoAction: (() -> ())?
    var contentService = ContentService()
    
    init(delegate: PhotoViewModelDelegate) {
        self.delegate = delegate
    }
    
}

// MARK: - Public methods
extension PhotoViewModel {
    
    func capturePhotoButtonTapped(with photo: UIImage) {
        self.capturedPhoto = photo
        // TODO: Call contentService (when ContentService will be done)
    }
    
    func recapturePhotoButtonTapped() {
        self.onRecapturePhotoAction?() // This line allows PhotoView to recapturing photo
    }
    
}
