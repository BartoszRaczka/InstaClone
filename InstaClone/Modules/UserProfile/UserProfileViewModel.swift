//
//  UserProfileViewModel.swift
//  InstaClone
//
//  Created by MacBook on 30/10/2020.
//

import Foundation

protocol UserProfileViewModelDelegate: AnyObject {
    
    func profileButtonTapped()
    
}

final class UserProfileViewModel {
    
    // MARK: - Properties

    private let userProfileService: UserProfileServiceProtocol
    
    private weak var delegate: UserProfileViewModelDelegate?
    
    // MARK: - Life cycle
    
    init(
        with userProfileService: UserProfileServiceProtocol,
        delegate: UserProfileViewModelDelegate
    ) {
        self.userProfileService = userProfileService
        self.delegate = delegate
    }

    // MARK: - Public Methods

    func selectedUser(at indexPath: IndexPath) {
        delegate?.profileButtonTapped()
    }
    
}
