//
//  HomeFeedViewModelFactory.swift
//  InstaClone
//
//  Created by MacBook on 23/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

protocol HomeFeedViewModelFactory {
    
    func makeHomeFeedViewModel(delegate: HomeFeedViewModelDelegate) -> HomeFeedViewModel
    
}

extension DependencyContainer: HomeFeedViewModelFactory {
    
    func makeHomeFeedViewModel(delegate: HomeFeedViewModelDelegate) -> HomeFeedViewModel {
        HomeFeedViewModel(delegate: delegate)
    }
    
}
