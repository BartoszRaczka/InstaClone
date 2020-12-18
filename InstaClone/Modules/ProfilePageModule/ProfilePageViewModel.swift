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

struct ProfilePageViewModel {
    
    let userProfileService = UserProfileService()
    
    var numberOfPosts: Int?
    var numberOfFollowers: Int?
    var numberOfFollowing: Int?
    var descriptionLabelText: String?
    
    var delegate: ProfilePageViewModelDelegate?
    
    init(delegate: ProfilePageViewModelDelegate) {
        self.delegate = delegate
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
            self.numberOfFollowing = 1
            self.numberOfFollowers = 2
            self.numberOfPosts = 3
            self.descriptionLabelText = "description"
        }
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
    
}
