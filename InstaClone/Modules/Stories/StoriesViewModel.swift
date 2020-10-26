//
//  StoriesViewModel.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

protocol StoriesViewModelDelegate: AnyObject {
    
    func selectedUser()
    
}

final class StoriesViewModel {
        
    // MARK: - Properties
    
    private let userProfileService: UserProfileServiceProtocol
    private let storiesService: StoriesServiceProtocol
        
    private weak var delegate: StoriesViewModelDelegate?
        
    // MARK: - Life cycle
        
    init(
        with userProfileService: UserProfileServiceProtocol,
        storiesService: StoriesServiceProtocol,
        delegate: StoriesViewModelDelegate
    ) {
        self.userProfileService = userProfileService
        self.storiesService = storiesService
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func selectedUser(at indexPath: IndexPath) {
        delegate?.selectedUser()
    }
}
