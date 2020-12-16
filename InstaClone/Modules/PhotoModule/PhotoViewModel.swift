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
    private let contentService: ContentService
    
    init(delegate: PhotoViewModelDelegate, contentService: ContentService) {
        self.delegate = delegate
        self.contentService = contentService
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
