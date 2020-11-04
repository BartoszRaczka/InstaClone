//
//  PhotoPostViewModelFactory.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

protocol PhotoPostViewModelFactory {
    
    func makePhotoPostViewModel(delegate: PhotoPostViewModelDelegate) -> PhotoPostViewModel
    
}

extension DependencyContainer: PhotoPostViewModelFactory {
    
    func makePhotoPostViewModel(delegate: PhotoPostViewModelDelegate) -> PhotoPostViewModel {
        PhotoPostViewModel(
            delegate: delegate
        )
    }
    
}
