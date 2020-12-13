//
//  PhotoViewModelFactory.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

protocol PhotoViewModelFactory {
    
    func makePhotoViewModel(delegate: PhotoViewModelDelegate, contentService: ContentService) -> PhotoViewModel
    
}

extension DependencyContainer: PhotoViewModelFactory {
    
    func makePhotoViewModel(delegate: PhotoViewModelDelegate, contentService: ContentService) -> PhotoViewModel {
        PhotoViewModel(
            delegate: delegate,
            contentService: contentService
        )
    }
    
}
