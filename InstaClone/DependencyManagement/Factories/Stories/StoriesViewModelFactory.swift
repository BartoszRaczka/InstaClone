//
//  StoriesViewModelFactory.swift
//  InstaClone
//
//  Created by new on 06/11/2020.
//

protocol StoriesViewModelFactory {
    
    func makeStoriesViewModel(delegate: StoriesViewModelDelegate) -> StoriesViewModel
    
}

extension DependencyContainer: StoriesViewModelFactory {
    
    func makeStoriesViewModel(delegate: StoriesViewModelDelegate) -> StoriesViewModel {
        StoriesViewModel(
//            with: UserProfileServiceProtocol(),
//            storiesService: StoriesServiceProtocol(),
            delegate: delegate
        )
    }
    
}
