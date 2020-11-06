//
//  StoriesViewControllerFactory.swift
//  InstaClone
//
//  Created by new on 06/11/2020.
//

protocol StoriesViewControlerFactory {
    
    func makeStoriesViewController(delegate: StoriesViewModelDelegate) -> StoriesViewController
    
}

extension DependencyContainer: StoriesViewControlerFactory {
    
    func makeStoriesViewController(delegate: StoriesViewModelDelegate) -> StoriesViewController {
        StoriesViewController(with: StoriesViewModel(delegate: delegate))
    }
    
}

