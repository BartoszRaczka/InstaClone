//
//  PhotoPostViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

protocol PhotoPostViewControllerFactory {
    
    func makePhotoPostViewController(delegate: PhotoPostViewModelDelegate) -> PhotoPostViewController
    
}

extension DependencyContainer: PhotoPostViewControllerFactory {
    
    func makePhotoPostViewController(delegate: PhotoPostViewModelDelegate) -> PhotoPostViewController {
        PhotoPostViewController(with: makePhotoPostViewModel(delegate: delegate))
    }
    
}
