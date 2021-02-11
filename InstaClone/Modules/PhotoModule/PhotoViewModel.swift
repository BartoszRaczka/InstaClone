//
//  PhotoViewModel.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import UIKit

protocol PhotoViewModelDelegate {
    
    func capturePhotoButtonTapped()
    func photoCaptured()
    
}

class PhotoViewModel {
    
    let delegate: PhotoViewModelDelegate?
    private var capturedPhoto: UIImage!
    private let contentService: ContentService
    var onPhotoCapturedAction: ((UIImage) -> Void)?
    
    init(delegate: PhotoViewModelDelegate, contentService: ContentService) {
        self.delegate = delegate
        self.contentService = contentService
    }
    
}

// MARK: - Public methods
extension PhotoViewModel {
    
    func capturePhotoButtonTapped() {
        delegate?.capturePhotoButtonTapped()
    }
    
    func photoCaptured(with image: UIImage) {
        capturedPhoto = image
        contentService.uploadData(image: capturedPhoto) { (result) in
            switch result {
            case .success:
                self.onPhotoCapturedAction?(self.capturedPhoto)
                self.delegate?.photoCaptured()
            case .failure:
                print("Failed to upload image.")
            }
        }
    }
}
