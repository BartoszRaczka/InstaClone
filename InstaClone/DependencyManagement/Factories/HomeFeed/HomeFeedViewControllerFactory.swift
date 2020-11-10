//
//  HomeFeedViewControllerFactory.swift
//  InstaClone
//
//  Created by Rafał Małczyński on 05/11/2020.
//

import SnapKit

protocol HomeFeedViewControllerFactory {
    
    func makeHomeFeedViewController(
        with delegate: HomeFeedViewModelDelegate,
        childViewControllers: [UIViewController]
    ) -> HomeFeedViewController
    
}

extension DependencyContainer: HomeFeedViewControllerFactory {
    
    func makeHomeFeedViewController(
        with delegate: HomeFeedViewModelDelegate,
        childViewControllers: [UIViewController]
    ) -> HomeFeedViewController {
        HomeFeedViewController(
            with: makeHomeFeedViewModel(delegate: delegate),
            childViewControllers: childViewControllers
        )
    }
    
}
