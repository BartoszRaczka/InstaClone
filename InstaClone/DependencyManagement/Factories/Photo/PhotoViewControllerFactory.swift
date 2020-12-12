//
//  PhotoViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

protocol PhotoViewControllerFactory {
    
    func makePhotoViewController(delegate: PhotoViewModelDelegate) -> PhotoViewController
    
}

extension DependencyContainer: PhotoViewControllerFactory {
    
    func makePhotoViewController(delegate: PhotoViewModelDelegate) -> PhotoViewController {
        PhotoViewController(with: makePhotoViewModel(delegate: delegate))
    }
    
}
