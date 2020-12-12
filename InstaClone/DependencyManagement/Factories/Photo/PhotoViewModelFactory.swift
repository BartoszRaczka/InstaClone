//
//  PhotoViewModelFactory.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

protocol PhotoViewModelFactory {
    
    func makePhotoViewModel(delegate: PhotoViewModelDelegate) -> PhotoViewModel
    
}

extension DependencyContainer: PhotoViewModelFactory {
    
    func makePhotoViewModel(delegate: PhotoViewModelDelegate) -> PhotoViewModel {
        PhotoViewModel(delegate: delegate)
    }
    
}
