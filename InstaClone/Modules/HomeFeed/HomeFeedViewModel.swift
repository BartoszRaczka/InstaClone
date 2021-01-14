//
//  HomeFeedViewModel.swift
//  InstaClone
//
//  Created by MacBook on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

protocol HomeFeedViewModelDelegate: AnyObject {
    
    func photoButtonTapped()
    
}

final class HomeFeedViewModel {

    //    MARK: - Properties
    
    private weak var delegate: HomeFeedViewModelDelegate?
    
    //    MARK: - Life Cycle
    
    init(delegate: HomeFeedViewModelDelegate) {
        self.delegate = delegate
    }
    
    //    MARK: - Public methods
    
    func didTapPhotoButton() {
        delegate?.photoButtonTapped()
    }
        
    func didTapLogOutButton() {
        print("logOutButton tapped")
    }
    
}
