//
//  ProfilePageViewModel.swift
//  InstaClone
//
//  Created by new on 01/11/2020.
//

import Foundation

protocol ProfilePageViewModelDelegate: AnyObject {
    
    func didTapUserProfilePictureButton()
    func didTapNumberOfPostsButton()
    func didTapNumberOfFollowersButton()
    func didTapNumberOfFollowingButton()
    func didTapEditProfileButton()
    
}

struct ProfilePageViewModel {
    
    var numberOfPosts: Int
    var numberOfFollowers: Int
    var numberOfFollowing: Int
    var descriptionLabelText: String
    
    var delegate: ProfilePageViewModelDelegate?
    
    func didTapUserProfilePictureButton() {
        delegate?.didTapUserProfilePictureButton()
    }
    
    func didTapNumberOfPostsButton() {
        delegate?.didTapNumberOfPostsButton()
    }
    
    func didTapNumberOfFollowersButton() {
        delegate?.didTapNumberOfFollowersButton()
    }
    
    func didTapNumberOfFollowingButton() {
        delegate?.didTapNumberOfFollowingButton()
    }
    
    func didTapEditProfileButton() {
        delegate?.didTapEditProfileButton()
    }
    
}
