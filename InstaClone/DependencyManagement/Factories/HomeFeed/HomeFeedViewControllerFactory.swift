//
//  HomeFeedViewControllerFactory.swift
//  InstaClone
//
//  Created by Rafał Małczyński on 05/11/2020.
//

protocol HomeFeedViewControllerFactory {
    
    func makeHomeFeedViewController(with delegate: HomeFeedViewModelDelegate) -> HomeFeedViewController
    
}

extension DependencyContainer: HomeFeedViewControllerFactory {
    
    func makeHomeFeedViewController(with delegate: HomeFeedViewModelDelegate) -> HomeFeedViewController {
        HomeFeedViewController(with: makeHomeFeedViewModel(delegate: delegate))
    }
    
}
