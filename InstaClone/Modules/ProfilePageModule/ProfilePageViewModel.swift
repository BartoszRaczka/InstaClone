//
//  ProfilePageViewModel.swift
//  InstaClone
//
//  Created by new on 01/11/2020.
//

import Foundation
import FirebaseAuth

protocol ProfilePageViewModelDelegate: AnyObject {
    
    func didTapUserProfilePictureButton()
    func didTapNumberOfPostsButton()
    func didTapNumberOfFollowersButton()
    func didTapNumberOfFollowingButton()
    func didTapEditProfileButton()
    
}

final class ProfilePageViewModel {
    
    let userProfileService = UserProfileService()
    
    var numberOfPosts: Int = 0
    var numberOfFollowers: Int = 0
    var numberOfFollowing: Int = 0
    var descriptionLabelText: String = " "
    
    var delegate: ProfilePageViewModelDelegate?
    
    init(delegate: ProfilePageViewModelDelegate) {
        self.delegate = delegate
        setupData()
    }
    
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
    
    func setupData() {
        if let userID = Auth.auth().currentUser?.uid {
            userProfileService.getUser(withID: userID) { result in
                switch result {
                case .success(let userData):
                    self.numberOfFollowers = userData.followers.count
                    self.numberOfFollowing = userData.following.count
                    self.numberOfPosts = 100
                    self.descriptionLabelText = "asd"
                case .failure:
                    self.numberOfFollowing = 6
                    self.numberOfFollowers = 5
                    self.numberOfPosts = 6
                    self.descriptionLabelText = "description failure"
                    return
                }
            }
        } else {
            numberOfFollowing = 1
            numberOfFollowers = 2
            numberOfPosts = 3
            descriptionLabelText = "description"
        }

    }
}
